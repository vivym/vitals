import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/connected_device_entity.dart';
import '../../domain/entities/app_settings_entity.dart';

/// 快捷功能区域
class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({
    super.key,
    required this.connectedDevices,
    required this.settings,
    this.onSettingsTap,
  });

  final List<ConnectedDeviceEntity> connectedDevices;
  final AppSettingsEntity settings;
  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '快捷功能',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _QuickActionItem(
                  icon: Icons.devices,
                  label: '智能设备',
                  badge: connectedDevices.length > 0 ? '${connectedDevices.length}' : null,
                  color: Colors.blue,
                  onTap: () => context.push('/profile/devices'),
                ),
                _QuickActionItem(
                  icon: Icons.settings,
                  label: '应用设置',
                  badge: null,
                  color: Colors.grey,
                  onTap: onSettingsTap,
                ),
                _QuickActionItem(
                  icon: Icons.favorite,
                  label: '我的收藏',
                  badge: null,
                  color: Colors.red,
                  onTap: () => context.push('/profile/favorites'),
                ),
                _QuickActionItem(
                  icon: Icons.feedback,
                  label: '健康反馈',
                  badge: null,
                  color: Colors.green,
                  onTap: () => context.push('/profile/feedback'),
                ),
              ],
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }


}

/// 快捷操作项
class _QuickActionItem extends StatelessWidget {
  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.color,
    this.badge,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final String? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 图标容器
            Stack(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),
                // 徽章
                if (badge != null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 8),

            // 标签
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}