import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/app_router.dart';
import '../providers/auth_provider.dart';

/// 患者签约成功页面
/// 显示患者签约成功的确认页面
class PatientSignSuccessScreen extends ConsumerStatefulWidget {
  const PatientSignSuccessScreen({super.key});

  @override
  ConsumerState<PatientSignSuccessScreen> createState() => _PatientSignSuccessScreenState();
}

class _PatientSignSuccessScreenState extends ConsumerState<PatientSignSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late AnimationController _contentAnimationController;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _contentOpacityAnimation;

  @override
  void initState() {
    super.initState();

    // 成功图标动画控制器
    _iconAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // 内容渐显动画控制器
    _contentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // 图标缩放动画
    _iconScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.elasticOut,
    ));

    // 内容透明度动画
    _contentOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _contentAnimationController,
      curve: Curves.easeInOut,
    ));

    // 启动动画
    _startAnimations();
  }

  void _startAnimations() async {
    // 使用 SchedulerBinding 来确保在测试中正确处理
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 200));
      if (mounted) {
        _iconAnimationController.forward();
      }

      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        _contentAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    _contentAnimationController.dispose();
    super.dispose();
  }

  void _onContinue() {
    // 检查用户认证状态，根据情况决定跳转
    final authState = ref.read(authNotifierProvider);

    if (authState.isAuthenticated && authState.hasSignedPatient) {
      // 用户已认证且已签约，跳转到首页
      context.go(AppRoutes.dashboard);
    } else {
      // 其他情况跳转到登录页面
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        // 阻止系统返回键，用户必须点击返回首页
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,  // 不允许返回
          title: Text(
            '签约成功',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            semanticsLabel: '签约成功',
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 成功图标动画
                        AnimatedBuilder(
                          animation: _iconScaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _iconScaleAnimation.value,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check_circle,
                                  size: 80,
                                  color: Colors.green[500],
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 40),

                        // 成功文本（渐显动画）
                        AnimatedBuilder(
                          animation: _contentOpacityAnimation,
                          builder: (context, child) {
                            return AnimatedOpacity(
                              opacity: _contentOpacityAnimation.value,
                              duration: const Duration(milliseconds: 300),
                              child: Column(
                                children: [
                                  Text(
                                    '恭喜您！',
                                    style: theme.textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green[600],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '患者签约已成功完成',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '您现在可以开始使用我们的健康服务了',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // 底部返回首页按钮
                AnimatedBuilder(
                  animation: _contentOpacityAnimation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      opacity: _contentOpacityAnimation.value,
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _onContinue,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                '开始使用',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                semanticsLabel: '开始使用按钮',
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
