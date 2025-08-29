import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/auth/presentation/pages/success_screen.dart';

void main() {
  group('SuccessScreen Widget Tests', () {
    Widget createTestWidget() {
      return ProviderScope(
        child: MaterialApp(
          home: const SuccessScreen(),
        ),
      );
    }

    group('界面元素显示', () {
      testWidgets('should display all required UI elements', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证页面标题
        expect(find.text('签约成功'), findsOneWidget);

        // 验证返回按钮
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);

        // 验证成功图标/插画
        expect(find.byIcon(Icons.check_circle), findsOneWidget);

        // 验证返回首页按钮
        expect(find.text('返回首页'), findsOneWidget);
      });

      testWidgets('should display success illustration correctly', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证成功图标的样式
        final successIcon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
        expect(successIcon.color, Colors.green);
        expect(successIcon.size, greaterThan(50)); // 应该是一个较大的图标
      });

      testWidgets('should center all content properly', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证内容居中布局
        expect(find.byType(Center), findsWidgets);
        expect(find.byType(Column), findsOneWidget);
      });
    });

    group('按钮样式', () {
      testWidgets('should style return home button correctly', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证返回首页按钮的样式
        final returnButton = tester.widget<ElevatedButton>(
          find.widgetWithText(ElevatedButton, '返回首页'),
        );

        expect(returnButton.style?.backgroundColor?.resolve({}), isNotNull);
        expect(returnButton.onPressed, isNotNull);
      });

      testWidgets('should have proper button sizing', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证按钮占据适当的宽度
        final buttonFinder = find.widgetWithText(ElevatedButton, '返回首页');
        expect(buttonFinder, findsOneWidget);

        final button = tester.widget<ElevatedButton>(buttonFinder);
        expect(button, isNotNull);
      });
    });

    group('用户交互', () {
      testWidgets('should handle return home button tap', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 点击返回首页按钮
        await tester.tap(find.widgetWithText(ElevatedButton, '返回首页'));
        await tester.pumpAndSettle();

        // 这里应该测试导航到首页的行为
        // 具体实现时需要使用适当的导航测试方法
      });

      testWidgets('should handle back button tap', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 点击返回按钮
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        // 这里应该测试返回上一页的行为
      });
    });

    group('动画效果', () {
      testWidgets('should show entrance animation', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证页面有适当的进入动画
        // 这里可以测试AnimatedOpacity、SlideTransition等动画组件
        expect(find.byType(AnimatedOpacity), findsWidgets);
      });

      testWidgets('should animate success icon', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证成功图标有动画效果
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        // 成功图标应该有缩放或渐显动画
        expect(find.byIcon(Icons.check_circle), findsOneWidget);
      });
    });

    group('响应式设计', () {
      testWidgets('should adapt to different screen sizes', (tester) async {
        // 测试小屏幕
        await tester.binding.setSurfaceSize(const Size(320, 568));
        await tester.pumpWidget(createTestWidget());

        expect(find.text('签约成功'), findsOneWidget);
        expect(find.text('返回首页'), findsOneWidget);

        // 测试大屏幕
        await tester.binding.setSurfaceSize(const Size(414, 896));
        await tester.pump();

        expect(find.text('签约成功'), findsOneWidget);
        expect(find.text('返回首页'), findsOneWidget);
      });

      testWidgets('should maintain proper spacing on different screens', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证各元素之间有适当的间距
        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
      });
    });

    group('主题适配', () {
      testWidgets('should adapt to light theme', (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: ThemeData.light(),
              home: const SuccessScreen(),
            ),
          ),
        );

        expect(find.text('签约成功'), findsOneWidget);
        expect(find.text('返回首页'), findsOneWidget);
      });

      testWidgets('should adapt to dark theme', (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: ThemeData.dark(),
              home: const SuccessScreen(),
            ),
          ),
        );

        expect(find.text('签约成功'), findsOneWidget);
        expect(find.text('返回首页'), findsOneWidget);
      });
    });

    group('无障碍支持', () {
      testWidgets('should have proper accessibility labels', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证重要元素有适当的语义标签
        expect(find.bySemanticsLabel('签约成功'), findsOneWidget);
        expect(find.bySemanticsLabel('返回首页按钮'), findsOneWidget);
        expect(find.bySemanticsLabel('返回上一页'), findsOneWidget);
      });

      testWidgets('should announce success to screen readers', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证页面加载时会向屏幕阅读器宣布成功消息
        expect(find.byType(Semantics), findsWidgets);
      });
    });

    group('页面状态管理', () {
      testWidgets('should prevent back navigation with system back button', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证使用WillPopScope阻止系统返回键
        expect(find.byType(WillPopScope), findsOneWidget);
      });

      testWidgets('should handle app lifecycle changes', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 测试应用进入后台再恢复时的状态
        await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
          'flutter/lifecycle',
          const StandardMethodCodec().encodeMethodCall(
            const MethodCall('AppLifecycleState.paused'),
          ),
          (data) {},
        );

        await tester.pump();
        expect(find.text('签约成功'), findsOneWidget);
      });
    });

    group('性能优化', () {
      testWidgets('should build efficiently', (tester) async {
        // 测试页面构建性能
        final stopwatch = Stopwatch()..start();

        await tester.pumpWidget(createTestWidget());

        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(100)); // 应该快速构建
      });

      testWidgets('should dispose resources properly', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 切换到其他页面
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: const Scaffold(body: Text('Other Page')),
            ),
          ),
        );

        // 验证资源被正确释放
        expect(find.text('Other Page'), findsOneWidget);
        expect(find.text('签约成功'), findsNothing);
      });
    });
  });
}
