import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/user_profile.dart';

/// 用户信息区域
class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key, this.userProfile});

  final UserProfile? userProfile;

  @override
  Widget build(BuildContext context) {
    if (userProfile == null) {
      return const Card(
        child: ListTile(
          title: Text('加载中...'),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade100,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // 头像
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: userProfile!.avatarUrl != null
                  ? NetworkImage(userProfile!.avatarUrl!)
                  : null,
              child: userProfile!.avatarUrl == null
                  ? Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey.shade600,
                    )
                  : null,
            ),

            const SizedBox(width: 20),

            // 用户信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProfile!.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '暂时无法查看',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // 更多选项按钮
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              ),
              onPressed: () {
                // 显示更多选项
                _showMoreOptions(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('编辑资料'),
              onTap: () {
                Navigator.pop(context);
                context.go('/profile/edit');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('更换头像'),
              onTap: () {
                Navigator.pop(context);
                // 处理头像更换
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('退出登录'),
              onTap: () {
                Navigator.pop(context);
                // 处理退出登录
              },
            ),
          ],
        ),
      ),
    );
  }
}
