import 'package:flutter/material.dart';
import '../../domain/entities/user_profile_entity.dart';

/// 用户信息区域
class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
    this.userProfile,
    this.onEditProfile,
  });

  final UserProfileEntity? userProfile;
  final VoidCallback? onEditProfile;

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
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
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

            const SizedBox(width: 16),

            // 用户信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 姓名
                  Text(
                    userProfile!.displayName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // 手机号
                  Text(
                    userProfile!.phone,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 用户状态信息
                  _buildUserStatusInfo(context),
                ],
              ),
            ),

            // 编辑按钮
            IconButton(
              onPressed: onEditProfile,
              icon: const Icon(Icons.edit_outlined),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStatusInfo(BuildContext context) {
    final info = <Widget>[];

    // 年龄信息
    if (userProfile!.age != null) {
      info.add(
        _buildInfoChip(
          context,
          '${userProfile!.age}岁',
          Icons.cake_outlined,
        ),
      );
    }

    // 性别信息
    if (userProfile!.gender != null) {
      info.add(
        _buildInfoChip(
          context,
          userProfile!.gender!.label,
          userProfile!.gender == Gender.male ? Icons.male : Icons.female,
        ),
      );
    }

    // 完善度提示
    if (!userProfile!.isProfileComplete) {
      info.add(
        _buildWarningChip(context, '资料待完善'),
      );
    }

    if (info.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: info,
    );
  }

  Widget _buildInfoChip(BuildContext context, String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningChip(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_outlined,
            size: 16,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
        ],
      ),
    );
  }
}