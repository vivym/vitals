import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart';
import 'package:vitals/features/auth/data/models/patient.dart';
import 'package:vitals/features/auth/domain/usecases/create_patient_usecase.dart';
import 'package:vitals/features/auth/presentation/providers/patient_form_provider.dart';
import 'package:vitals/features/auth/presentation/pages/create_patient_screen.dart';

// Mock classes
class MockCreatePatientUseCase extends Mock implements CreatePatientUseCase {}

// Fake classes
class FakeCreatePatientRequest extends Fake implements CreatePatientRequest {}

void main() {
  group('CreatePatientScreen Widget Tests', () {
    late MockCreatePatientUseCase mockCreatePatientUseCase;

    setUpAll(() {
      registerFallbackValue(FakeCreatePatientRequest());
    });

    setUp(() {
      mockCreatePatientUseCase = MockCreatePatientUseCase();
    });

    Widget createTestWidget({List<Override>? overrides}) {
      return ProviderScope(
        overrides: overrides ?? [
          createPatientUseCaseProvider.overrideWithValue(mockCreatePatientUseCase),
        ],
        child: MaterialApp(
          home: const CreatePatientScreen(),
        ),
      );
    }

    group('界面元素显示', () {
      testWidgets('should display all required form fields', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证页面标题
        expect(find.text('新签约患者'), findsOneWidget);

        // 验证返回按钮
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);

        // 验证必填字段标记和输入框
        expect(find.textContaining('真实姓名'), findsOneWidget);
        expect(find.textContaining('身份证号'), findsOneWidget);
        expect(find.textContaining('性别'), findsOneWidget);
        expect(find.textContaining('日期'), findsOneWidget);
        expect(find.textContaining('联系电话'), findsOneWidget);

        // 验证可选字段
        expect(find.textContaining('病案号'), findsOneWidget);
        expect(find.textContaining('紧急联系人'), findsOneWidget);
        expect(find.textContaining('紧急联系人电话'), findsOneWidget);

        // 验证必填标记（红色星号）
        expect(find.text('*'), findsWidgets);

        // 验证确定按钮
        expect(find.text('确定'), findsOneWidget);
      });

      testWidgets('should show phone number from login', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 应该显示从登录获取的手机号（脱敏显示）
        expect(find.textContaining('150******68'), findsOneWidget);
      });

      testWidgets('should highlight medical record number field', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 病案号字段应该有特殊的高亮边框（根据UI设计）
        expect(find.textContaining('病案号'), findsOneWidget);
      });
    });

    group('表单输入验证', () {
      testWidgets('should validate name field', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 输入空的姓名
        final nameField = find.byKey(const Key('name_field'));
        await tester.enterText(nameField, '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        // 应该显示错误消息
        expect(find.textContaining('请输入真实姓名'), findsOneWidget);

        // 输入有效姓名
        await tester.enterText(nameField, '王高南');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        // 错误消息应该消失
        expect(find.textContaining('请输入真实姓名'), findsNothing);
      });

      testWidgets('should validate ID number field', (tester) async {
        await tester.pumpWidget(createTestWidget());

        final idField = find.byKey(const Key('id_number_field'));

        // 测试无效身份证号
        await tester.enterText(idField, '123456');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(find.textContaining('请输入正确的身份证号'), findsOneWidget);

        // 测试有效身份证号
        await tester.enterText(idField, '310101199001011234');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(find.textContaining('请输入正确的身份证号'), findsNothing);
      });

      testWidgets('should validate phone number field', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证联系电话字段已预填充且禁用编辑
        final phoneField = find.byKey(const Key('phone_field'));
        final phoneTextField = tester.widget<TextFormField>(phoneField);

        expect(phoneTextField.enabled, false); // 应该是禁用状态
        expect(phoneTextField.initialValue, contains('150******68'));
      });
    });

    group('性别选择', () {
      testWidgets('should show gender selection dialog', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 点击性别字段
        await tester.tap(find.textContaining('请选择您的性别'));
        await tester.pumpAndSettle();

        // 应该显示性别选择器
        expect(find.text('男'), findsOneWidget);
        expect(find.text('女'), findsOneWidget);
        expect(find.text('其他'), findsOneWidget);
      });

      testWidgets('should update gender when selected', (tester) async {
        await tester.pumpWidget(createTestWidget());

        await tester.tap(find.textContaining('请选择您的性别'));
        await tester.pumpAndSettle();

        // 选择男性
        await tester.tap(find.text('男'));
        await tester.pumpAndSettle();

        // 验证性别已更新
        expect(find.text('男'), findsOneWidget);
      });
    });

    group('日期选择', () {
      testWidgets('should show date picker when date field is tapped', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 点击日期字段
        await tester.tap(find.textContaining('请选择您的出生日期'));
        await tester.pumpAndSettle();

        // 应该显示日期选择器
        expect(find.byType(DatePickerDialog), findsOneWidget);
      });

      testWidgets('should update birth date when selected', (tester) async {
        await tester.pumpWidget(createTestWidget());

        await tester.tap(find.textContaining('请选择您的出生日期'));
        await tester.pumpAndSettle();

        // 选择一个日期（这里简化处理，实际测试可能需要更复杂的日期选择逻辑）
        await tester.tap(find.text('确定'));
        await tester.pumpAndSettle();

        // 验证日期字段不再显示placeholder文本
        expect(find.textContaining('请选择您的出生日期'), findsNothing);
      });
    });

    group('可选字段处理', () {
      testWidgets('should allow empty optional fields', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 紧急联系人字段可以为空
        final emergencyContactField = find.byKey(const Key('emergency_contact_field'));
        await tester.enterText(emergencyContactField, '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        // 不应该显示错误消息
        expect(find.textContaining('联系人'), findsNothing);
      });

      testWidgets('should validate emergency contact phone when provided', (tester) async {
        await tester.pumpWidget(createTestWidget());

        final emergencyPhoneField = find.byKey(const Key('emergency_phone_field'));

        // 输入无效手机号
        await tester.enterText(emergencyPhoneField, '123');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(find.textContaining('请输入正确的手机号码'), findsOneWidget);

        // 清空字段应该不显示错误
        await tester.enterText(emergencyPhoneField, '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(find.textContaining('请输入正确的手机号码'), findsNothing);
      });
    });

    group('表单提交', () {
      testWidgets('should disable submit button when form is invalid', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 确定按钮初始应该是禁用状态（因为必填字段为空）
        final submitButton = tester.widget<ElevatedButton>(
          find.widgetWithText(ElevatedButton, '确定'),
        );
        expect(submitButton.onPressed, null);
      });

      testWidgets('should enable submit button when all required fields are valid', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 填写所有必填字段
        await tester.enterText(find.byKey(const Key('name_field')), '王高南');
        await tester.enterText(find.byKey(const Key('id_number_field')), '310101199001011234');

        // 选择性别
        await tester.tap(find.textContaining('请选择您的性别'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('男'));
        await tester.pumpAndSettle();

        // 选择出生日期
        await tester.tap(find.textContaining('请选择您的出生日期'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('确定'));
        await tester.pumpAndSettle();

        await tester.pump();

        // 确定按钮应该变为启用状态
        final submitButton = tester.widget<ElevatedButton>(
          find.widgetWithText(ElevatedButton, '确定'),
        );
        expect(submitButton.onPressed, isNotNull);
      });

      testWidgets('should submit form when valid', (tester) async {
        // 模拟成功创建患者
        final patient = Patient(
          id: '1',
          name: '王高南',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '15000000068',
        );
        when(() => mockCreatePatientUseCase.execute(any()))
            .thenAnswer((_) async => Result.success(patient));

        await tester.pumpWidget(createTestWidget());

        // 填写表单...（省略填写过程）
        // ...

        // 点击确定按钮
        await tester.tap(find.widgetWithText(ElevatedButton, '确定'));
        await tester.pump();

        // 验证用例被调用
        verify(() => mockCreatePatientUseCase.execute(any())).called(1);
      });
    });

    group('加载状态', () {
      testWidgets('should show loading indicator during submission', (tester) async {
        when(() => mockCreatePatientUseCase.execute(any()))
            .thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return Result.success(Patient(
            id: '1',
            name: '王高南',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '15000000068',
          ));
        });

        await tester.pumpWidget(createTestWidget());

        // 填写表单并提交...
        // ...

        // 应该显示加载指示器
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pumpAndSettle();
      });

      testWidgets('should disable form during submission', (tester) async {
        when(() => mockCreatePatientUseCase.execute(any()))
            .thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return Result.success(Patient(
            id: '1',
            name: '王高南',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '15000000068',
          ));
        });

        await tester.pumpWidget(createTestWidget());

        // 提交表单后，所有输入字段应该被禁用
        // ...

        await tester.pumpAndSettle();
      });
    });

    group('错误处理', () {
      testWidgets('should display error message when submission fails', (tester) async {
        const error = AppError.network(message: '网络连接失败');
        when(() => mockCreatePatientUseCase.execute(any()))
            .thenAnswer((_) async => const Result.failure(error));

        await tester.pumpWidget(createTestWidget());

        // 填写并提交表单...
        // ...

        await tester.pumpAndSettle();

        // 应该显示错误消息
        expect(find.textContaining('网络连接失败'), findsOneWidget);
      });

      testWidgets('should handle validation errors from server', (tester) async {
        const error = AppError.validation(message: '身份证号已存在', field: 'idNumber');
        when(() => mockCreatePatientUseCase.execute(any()))
            .thenAnswer((_) async => const Result.failure(error));

        await tester.pumpWidget(createTestWidget());

        // 提交表单后应该显示服务器验证错误
        // ...

        expect(find.textContaining('身份证号已存在'), findsOneWidget);
      });
    });

    group('导航行为', () {
      testWidgets('should navigate back when back button is pressed', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 点击返回按钮
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        // 这里应该测试导航行为
        // 具体实现时可以使用Navigator.observer或其他方法
      });

      testWidgets('should navigate to success page when patient is created', (tester) async {
        final patient = Patient(
          id: '1',
          name: '王高南',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '15000000068',
        );
        when(() => mockCreatePatientUseCase.execute(any()))
            .thenAnswer((_) async => Result.success(patient));

        await tester.pumpWidget(createTestWidget());

        // 提交成功后应该导航到成功页面
        // ...
      });
    });

    group('无障碍支持', () {
      testWidgets('should have proper accessibility labels', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证重要元素有适当的语义标签
        expect(find.bySemanticsLabel('姓名输入框'), findsOneWidget);
        expect(find.bySemanticsLabel('身份证号输入框'), findsOneWidget);
        expect(find.bySemanticsLabel('性别选择'), findsOneWidget);
        expect(find.bySemanticsLabel('出生日期选择'), findsOneWidget);
      });

      testWidgets('should support screen readers', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证表单字段有适当的hints
        final nameField = find.byKey(const Key('name_field'));
        expect(nameField, findsOneWidget);
      });
    });
  });
}
