import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/connected_device_entity.dart';

/// 功能列表区域
class FunctionListSection extends StatelessWidget {
  const FunctionListSection({
    super.key,
    required this.connectedDevices,
    this.myServicesCount = 0,
  });

  final List<ConnectedDeviceEntity> connectedDevices;
  final int myServicesCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            '常用工具',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ),

        // 功能列表
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildListItem(
                context,
                icon: Icons.people,
                title: '就诊人管理',
                onTap: () => context.go('/profile/patients'),
              ),
              _buildListItem(
                context,
                icon: Icons.devices,
                title: '智能设备',
                subtitle: '${connectedDevices.length}个已连接',
                onTap: () => context.go('/profile/devices'),
              ),
              _buildListItem(
                context,
                icon: Icons.medical_services,
                title: '我的服务',
                subtitle: '${myServicesCount}项服务',
                onTap: () => context.go('/profile/services'),
              ),
              _buildListItem(
                context,
                icon: Icons.assessment,
                title: '阶段报告',
                onTap: () => context.go('/profile/stage-reports'),
              ),
              _buildListItem(
                context,
                icon: Icons.medication,
                title: '用药提醒',
                onTap: () => context.go('/profile/medication-reminders'),
              ),
              _buildListItem(
                context,
                icon: Icons.settings,
                title: '个人设置',
                onTap: () => context.go('/profile/settings'),
              ),
              _buildListItem(
                context,
                icon: Icons.info,
                title: '关于',
                onTap: () => context.go('/profile/about'),
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 24,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                )
              : null,
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.grey.shade400,
          ),
          onTap: onTap,
        ),
        if (!isLast)
          Divider(
            height: 1,
            indent: 56,
            endIndent: 16,
            color: Colors.grey.shade200,
          ),
      ],
    );
  }
}
