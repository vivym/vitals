import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_bottom_navigation_bar.dart';

/// 应用脚手架，包含底部导航栏
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.currentIndex,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final int? currentIndex;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    // 如果提供了currentIndex，使用公共底部导航栏
    final bottomNav = currentIndex != null
        ? AppBottomNavigationBar(currentIndex: currentIndex!)
        : bottomNavigationBar;

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNav,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }
}

/// 带底部导航栏的页面基类
class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.body,
    this.appBar,
    required this.currentIndex,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final int currentIndex;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: body,
      appBar: appBar,
      currentIndex: currentIndex,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
      endDrawer: endDrawer,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }
}
