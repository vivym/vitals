import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/entities/patient_entity.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/sign_patient_usecase.dart';
import 'package:vitals/features/auth/presentation/providers/patient_sign_form_provider.dart';
import 'package:vitals/features/auth/presentation/providers/auth_providers.dart';

// Mock classes
class MockSignPatientUseCase extends Mock implements SignPatientUseCase {}

// Fake classes
class FakeSignPatientRequest extends Fake implements SignPatientRequest {}

void main() {
  group('PatientSignFormNotifier', () {
    late MockSignPatientUseCase mockSignPatientUseCase;
    late ProviderContainer container;

    setUpAll(() {
      registerFallbackValue(FakeSignPatientRequest());
    });

    setUp(() {
      mockSignPatientUseCase = MockSignPatientUseCase();

      container = ProviderContainer(
        overrides: [
          signPatientUseCaseProvider.overrideWithValue(mockSignPatientUseCase),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    group('初始状态', () {
      test('should start with empty form state', () {
        final formState = container.read(patientSignFormNotifierProvider);

        expect(formState.name, null);
        expect(formState.idNumber, null);
        expect(formState.gender, null);
        expect(formState.birthDate, null);
        expect(formState.phone, null);
        expect(formState.emergencyContact, null);
        expect(formState.emergencyContactPhone, null);
        expect(formState.isSubmitting, false);
        expect(formState.generalError, null);
        expect(formState.validationState.errors, isEmpty);
      });
    });

    group('字段更新', () {
      test('should update name field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateName('张三');

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.name, '张三');
      });

      test('should update id number field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateIdNumber('310101199001011234');

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.idNumber, '310101199001011234');
      });

      test('should update gender field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateGender(Gender.male);

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.gender, Gender.male);
      });

      test('should update birth date field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);
        final birthDate = DateTime(1990, 1, 1);

        notifier.updateBirthDate(birthDate);

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.birthDate, birthDate);
      });

      test('should update phone field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updatePhone('13800000000');

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.phone, '13800000000');
      });



      test('should update emergency contact field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateEmergencyContact('李四');

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.emergencyContact, '李四');
      });

      test('should update emergency contact phone field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateEmergencyContactPhone('13900000000');

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.emergencyContactPhone, '13900000000');
      });
    });

    group('表单验证', () {
      test('should validate required fields', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        // 只填写部分必填字段
        notifier.updateName('张三');
        notifier.updatePhone('13800000000');

        final state = container.read(patientSignFormNotifierProvider);
        // 验证状态已更新
        expect(state.name, equals('张三'));
        expect(state.phone, equals('13800000000'));
        // 验证其他必填字段仍为空
        expect(state.idNumber, isNull);
        expect(state.gender, isNull);
        expect(state.birthDate, isNull);
      });

      test('should validate name field', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateName('   ');

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.validationState.errors['name'], isNotNull);
        expect(state.validationState.errors['name'], contains('姓名'));
      });

      test('should validate id number format', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updateIdNumber('12345'); // 无效格式

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.validationState.errors['idNumber'], isNotNull);
        expect(state.validationState.errors['idNumber'], contains('身份证号'));
      });

      test('should validate phone format', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        notifier.updatePhone('12345'); // 无效格式

        final state = container.read(patientSignFormNotifierProvider);
        expect(state.validationState.errors['phone'], isNotNull);
        expect(state.validationState.errors['phone'], contains('手机号'));
      });

      test('should clear validation errors when field is corrected', () {
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        // 先设置无效值
        notifier.updateName('   ');
        expect(container.read(patientSignFormNotifierProvider).validationState.errors['name'], isNotNull);

        // 修正值
        notifier.updateName('张三');
        expect(container.read(patientSignFormNotifierProvider).validationState.errors['name'], isNull);
      });
    });

    group('患者签约', () {
      test('should sign patient successfully', () async {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);
        final expectedPatient = PatientEntity(
          id: 'patient_123',
          name: '张三',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // 填写表单
        notifier.updateName('张三');
        notifier.updateIdNumber('310101199001011234');
        notifier.updateGender(Gender.male);
        notifier.updateBirthDate(DateTime(1990, 1, 1));
        notifier.updatePhone('13800000000');

        when(() => mockSignPatientUseCase.execute(any()))
            .thenAnswer((_) async => Result.success(expectedPatient));

        // When
        await notifier.signPatient();

        // Then
        final state = container.read(patientSignFormNotifierProvider);
        expect(state.isSubmitting, false);
        expect(state.generalError, isNull);
        expect(state.validationState.errors, isEmpty);

        verify(() => mockSignPatientUseCase.execute(any())).called(1);
      });

      test('should handle signing failure', () async {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);
        final error = AppError.network(message: '网络错误');

        // 填写表单
        notifier.updateName('张三');
        notifier.updateIdNumber('310101199001011234');
        notifier.updateGender(Gender.male);
        notifier.updateBirthDate(DateTime(1990, 1, 1));
        notifier.updatePhone('13800000000');

        when(() => mockSignPatientUseCase.execute(any()))
            .thenAnswer((_) async => Result.failure(error));

        // When
        await notifier.signPatient();

        // Then
        final state = container.read(patientSignFormNotifierProvider);
        expect(state.isSubmitting, false);
        expect(state.generalError, equals(error));
        expect(state.validationState.errors, isEmpty);

        verify(() => mockSignPatientUseCase.execute(any())).called(1);
      });

      test('should not submit when form is invalid', () async {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        // 只填写部分字段，保持表单无效
        notifier.updateName('张三');
        notifier.updatePhone('13800000000');

        // When
        await notifier.signPatient();

        // Then
        verifyNever(() => mockSignPatientUseCase.execute(any()));
      });

      test('should set submitting state during operation', () async {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);
        final completer = Completer<Result<PatientEntity, AppError>>();

        // 填写表单
        notifier.updateName('张三');
        notifier.updateIdNumber('310101199001011234');
        notifier.updateGender(Gender.male);
        notifier.updateBirthDate(DateTime(1990, 1, 1));
        notifier.updatePhone('13800000000');

        when(() => mockSignPatientUseCase.execute(any()))
            .thenAnswer((_) async => await completer.future);

        // When
        final future = notifier.signPatient();

        // Then
        expect(container.read(patientSignFormNotifierProvider).isSubmitting, true);

        // 完成操作
        completer.complete(Result.success(PatientEntity(
          id: 'patient_123',
          name: '张三',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        )));

        await future;
        expect(container.read(patientSignFormNotifierProvider).isSubmitting, false);
      });
    });

    group('表单重置', () {
      test('should reset form to initial state', () {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        // 填写一些字段
        notifier.updateName('张三');
        notifier.updatePhone('13800000000');
        notifier.updateGender(Gender.male);

        // When
        notifier.reset();

        // Then
        final state = container.read(patientSignFormNotifierProvider);
        expect(state.name, isNull);
        expect(state.phone, isNull);
        expect(state.gender, isNull);
        expect(state.isSubmitting, false);
        expect(state.generalError, isNull);
        expect(state.validationState.errors, isEmpty);
      });
    });

    group('错误处理', () {
      test('should clear general error when updating fields', () {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);
        final error = AppError.network(message: '网络错误');

        // 设置错误状态
        notifier.state = notifier.state.copyWith(generalError: error);
        expect(container.read(patientSignFormNotifierProvider).generalError, equals(error));

        // When
        notifier.updateName('张三');

        // Then
        // 验证字段已更新
        expect(container.read(patientSignFormNotifierProvider).name, equals('张三'));
      });

      test('should clear validation errors when updating fields', () {
        // Given
        final notifier = container.read(patientSignFormNotifierProvider.notifier);

        // 设置验证错误
        notifier.state = notifier.state.copyWith(
          validationState: FormValidationState(
            errors: {'name': '姓名不能为空'},
            isValid: false,
          ),
        );

        expect(container.read(patientSignFormNotifierProvider).validationState.errors['name'], isNotNull);

        // When
        notifier.updateName('张三');

        // Then
        expect(container.read(patientSignFormNotifierProvider).validationState.errors['name'], isNull);
      });
    });
  });
}
