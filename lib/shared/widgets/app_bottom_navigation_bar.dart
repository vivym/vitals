import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/navigation_constants.dart';

/// 应用底部导航栏
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case NavigationIndices.dashboard:
            context.go('/dashboard');
            break;
          case NavigationIndices.healthData:
            context.go('/health-data');
            break;
          case NavigationIndices.reports:
            context.go('/reports');
            break;
          case NavigationIndices.profile:
            context.go('/profile');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(NavigationIcons.dashboard),
          label: NavigationLabels.dashboard,
        ),
        BottomNavigationBarItem(
          icon: Icon(NavigationIcons.healthData),
          label: NavigationLabels.healthData,
        ),
        BottomNavigationBarItem(
          icon: Icon(NavigationIcons.reports),
          label: NavigationLabels.reports,
        ),
        BottomNavigationBarItem(
          icon: Icon(NavigationIcons.profile),
          label: NavigationLabels.profile,
        ),
      ],
    );
  }
}
