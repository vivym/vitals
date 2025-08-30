# 共享组件 (Shared Widgets)

## 概述

这个目录包含应用中的共享UI组件，这些组件可以在多个功能模块中重复使用，确保UI的一致性和代码的复用性。

## 组件列表

### 1. MainNavigationScaffold

主导航脚手架组件，提供统一的底部导航栏和页面切换体验。

#### 特性
- 固定的底部导航栏，包含4个导航项：首页、健康数据、报告、我的
- 支持当前页面高亮显示
- 页面内容左右滑动切换，300ms平滑动画
- 自动路由同步，保持URL与页面状态一致
- 禁用手势滑动，只允许通过底部导航栏切换

#### 使用方法

```dart
import 'package:vitals/shared/widgets/main_navigation_scaffold.dart';

// 在路由配置中使用
GoRoute(
  path: '/dashboard',
  builder: (context, state) => const MainNavigationScaffold(currentIndex: 0),
)
```

#### 导航项索引
- `0`: 首页 (`/dashboard`)
- `1`: 健康数据 (`/health-data`)
- `2`: 报告 (`/reports`)
- `3`: 我的 (`/profile`)

#### 工作原理
1. 所有底部导航页面共享同一个 `MainNavigationScaffold` 实例
2. 使用 `PageView` 和 `PageController` 实现页面内容切换
3. 底部导航栏点击时立即切换页面，然后更新路由URL
4. 路由变化时自动切换到对应的页面索引

### 2. LoadingView

加载状态视图组件。

#### 特性
- 居中显示的加载指示器
- 加载文字提示
- 一致的加载体验

#### 使用方法

```dart
import 'package:vitals/shared/widgets/loading_view.dart';

// 在异步数据加载时显示
if (isLoading) {
  return const LoadingView();
}
```

## 最佳实践

### 1. 页面结构

对于需要底部导航栏的页面，现在统一使用 `MainNavigationScaffold`：

```dart
// 在路由配置中
GoRoute(
  path: '/dashboard',
  builder: (context, state) => const MainNavigationScaffold(currentIndex: 0),
)
```

### 2. 导航栏索引管理

使用常量文件中定义的导航栏索引：

```dart
import 'package:vitals/core/constants/navigation_constants.dart';

// 使用预定义的索引
MainNavigationScaffold(currentIndex: NavigationIndices.dashboard)
```

### 3. 路由一致性

确保底部导航栏的路由与路由配置一致：

```dart
// 在app_router.dart中
static const dashboard = '/dashboard';
static const healthData = '/health-data';
static const reports = '/reports';
static const profile = '/profile';
```

## 扩展指南

### 添加新的导航项

1. 在 `NavigationIndices` 中添加新的索引常量
2. 在 `NavigationLabels` 中添加新的标签文本
3. 在 `NavigationIcons` 中添加新的图标
4. 更新 `_MainBottomNavigationBar` 的 `items` 列表
5. 在 `_onBottomNavTap` 方法中添加新的路由处理
6. 更新路由配置和重定向逻辑

### 自定义导航栏样式

可以通过修改 `_MainBottomNavigationBar` 的 `build` 方法来自定义样式：

```dart
@override
Widget build(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    selectedItemColor: Theme.of(context).primaryColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 8,
    // 自定义样式...
  );
}
```

## 测试

### 运行测试

```bash
# 运行所有shared widgets测试
flutter test test/shared/widgets/

# 运行特定测试
flutter test test/shared/widgets/main_navigation_scaffold_test.dart
```

### 测试注意事项

- 在测试环境中，GoRouter的导航可能不会实际执行
- 需要模拟路由状态来测试页面切换逻辑
- 测试页面内容组件的独立渲染

## 架构优势

### 1. 代码复用
- 底部导航栏逻辑集中管理
- 减少重复代码
- 统一的维护入口

### 2. UI一致性
- 所有页面使用相同的导航栏样式
- 统一的交互体验
- 便于主题和样式调整

### 3. 维护性
- 导航逻辑集中管理
- 常量统一管理
- 便于功能扩展

### 4. 性能优化
- 页面内容在同一个 `PageView` 中切换
- 避免重复创建导航栏组件
- 直接切换，无动画延迟，响应更快
