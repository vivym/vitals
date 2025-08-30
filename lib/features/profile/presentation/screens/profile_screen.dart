import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/providers/current_user_provider.dart';
import '../providers/profile_notifier.dart';
import '../widgets/user_info_section.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/function_list_section.dart';
import '../widgets/loading_view.dart';
import '../widgets/error_view.dart';

/// 个人中心内容组件 - 不包含AppBar和BottomNavigationBar
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 直接调试currentUserProvider状态
    final currentUser = ref.watch(currentUserProvider);
    print('🔍 ProfileScreen.build() - currentUser: $currentUser');
    print('🔍 ProfileScreen.build() - ref hashCode: ${ref.hashCode}');

    final profileState = ref.watch(profileNotifierProvider);

    return profileState.when(
      loading: () => const LoadingView(),
      error: (error, _) => ErrorView(error: error.toString()),
      data: (state) => _ProfileContent(state: state),
    );
  }
}

/// 个人中心内容
class _ProfileContent extends ConsumerWidget {
  const _ProfileContent({required this.state});

  final ProfileState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.error != null) {
      return ErrorView(error: state.error!);
    }

    if (state.profile == null) {
      return const Center(
        child: Text('个人资料不存在'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(profileNotifierProvider.notifier).refresh();
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 用户信息头部
          UserInfoSection(
            userProfile: state.profile!.userProfile,
            onEditProfile: () {
              // 导航到编辑资料页面
              context.push('/profile/edit');
            },
          ),

          const SizedBox(height: 16),

          // 快捷功能
          QuickActionsSection(
            connectedDevices: state.profile!.connectedDevices,
            settings: state.profile!.settings,
            onSettingsTap: () => context.push('/profile/settings'),
          ),

          const SizedBox(height: 16),

          // 功能列表
          FunctionListSection(
            connectedDevices: state.profile!.connectedDevices,
            myServicesCount: 0, // TODO: 从后端获取服务数量
          ),

          const SizedBox(height: 16),

          // 退出登录按钮
          if (state.profile!.userProfile != null)
            _LogoutButton(),

          // 底部安全区域
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

/// 退出登录按钮
class _LogoutButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: ElevatedButton(
        onPressed: () => _showLogoutDialog(context, ref),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          '退出登录',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _logout(context, ref);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) {
    // 清除用户状态
    // ref.read(authNotifierProvider.notifier).logout();

    // 导航到登录页面
    context.go('/login');
  }
}