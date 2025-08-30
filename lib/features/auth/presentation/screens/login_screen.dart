import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

/// 登录页面
/// 手机号一键登录，需要同意服务协议
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _agreedToTerms = false;
  final String _phoneNumber = '15000000068'; // 模拟获取的手机号

  @override
  void initState() {
    super.initState();
    // 尝试自动登录，但不显示加载状态
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authNotifierProvider.notifier).autoLogin(silent: true);
    });
  }

  String get _maskedPhoneNumber {
    if (_phoneNumber.length >= 11) {
      return '${_phoneNumber.substring(0, 3)}******${_phoneNumber.substring(7)}';
    }
    return _phoneNumber;
  }

  void _handleLogin() async {
    if (!_agreedToTerms) return;

    try {
      await ref.read(authNotifierProvider.notifier).login(
        _phoneNumber,
        agreedToTerms: _agreedToTerms,
      );

      // 检查登录结果
      final authState = ref.read(authNotifierProvider);
      if (authState.isAuthenticated && mounted) {
        // 登录成功，导航到主页
        context.go('/dashboard');
      }
    } catch (e) {
      // 打印错误信息用于调试
      print('登录错误: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final theme = Theme.of(context);

    // 如果已认证，直接导航到主页
    if (authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/dashboard');
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // 标题
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 60),
                child: Text(
                  '手机号一键登录',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),

              // 主要内容区域
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 用户头像
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // 脱敏手机号
                    Text(
                      _maskedPhoneNumber,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 60),

                    // 一键登录按钮
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _agreedToTerms && !authState.isLoading
                            ? _handleLogin
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _agreedToTerms
                              ? theme.primaryColor
                              : Colors.grey[400],
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: authState.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : const Text(
                                '一键登录',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // 底部协议区域
              Column(
                children: [
                  // 协议勾选
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _agreedToTerms,
                          onChanged: authState.isLoading
                              ? null
                              : (value) {
                                  setState(() {
                                    _agreedToTerms = value ?? false;
                                  });
                                },
                          activeColor: theme.primaryColor,
                          checkColor: Colors.white,
                          side: BorderSide(
                            color: Colors.grey[400]!,
                            width: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Wrap(
                          children: [
                            Text(
                              '我已阅读并同意',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: 打开服务协议
                              },
                              child: Text(
                                '《服务协议》',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Text(
                              ' 和 ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: 打开隐私协议
                              },
                              child: Text(
                                '《隐私协议》',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),

      // 错误提示
      bottomSheet: authState.error != null
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                border: Border(
                  top: BorderSide(color: Colors.red[200]!),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red[600], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      authState.error!.message,
                      style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).clearError();
                    },
                    child: Text(
                      '关闭',
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
