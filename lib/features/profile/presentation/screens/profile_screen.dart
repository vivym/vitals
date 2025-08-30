import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/profile_notifier.dart';
import '../../data/models/profile_state.dart';
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
    final profileState = ref.watch(profileNotifierProvider);

    return profileState.when(
      loading: () => const LoadingView(),
      error: (error, _) => ErrorView(error: error),
      data: (state) => _ProfileContent(state: state),
    );
  }
}

/// 个人中心内容
class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.state});

  final ProfileState state;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // 刷新数据
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 用户信息头部
          UserInfoSection(userProfile: state.userProfile),

          const SizedBox(height: 16),

          // 快捷功能
          const QuickActionsSection(),

          const SizedBox(height: 16),

          // 功能列表
          FunctionListSection(
            connectedDevices: state.connectedDevices,
            myServices: state.myServices,
          ),
        ],
      ),
    );
  }
}
