# 共享组件 (Shared Widgets)

## 概述

这个目录包含应用中的共享UI组件，这些组件可以在多个功能模块中重复使用，确保UI的一致性和代码的复用性。

## 组件列表

### 1. AppBottomNavigationBar

应用底部导航栏组件，提供统一的导航体验。

#### 特性
- 固定的4个导航项：首页、健康数据、报告、我的
- 支持当前页面高亮显示
- 自动路由导航

#### 使用方法

```dart
import 'package:vitals/shared/widgets/app_bottom_navigation_bar.dart';

// 在Scaffold中使用
Scaffold(
  body: YourContent(),
  bottomNavigationBar: AppBottomNavigationBar(currentIndex: 0),
)

// 或者使用AppPage包装器
AppPage(
  currentIndex: 0,
  body: YourContent(),
)
```

#### 导航项索引
- `0`: 首页 (`/dashboard`)
- `1`: 健康数据 (`/health-data`)
- `2`: 报告 (`/reports`)
- `3`: 我的 (`/profile`)

### 2. AppScaffold

应用脚手架组件，自动处理底部导航栏的显示。

#### 特性
- 可选的底部导航栏
- 支持所有Scaffold的标准属性
- 自动处理导航栏状态

#### 使用方法

```dart
import 'package:vitals/shared/widgets/app_scaffold.dart';

AppScaffold(
  currentIndex: 0, // 显示底部导航栏并高亮首页
  appBar: AppBar(title: Text('页面标题')),
  body: YourContent(),
  // 其他Scaffold属性...
)
```

### 3. AppPage

带底部导航栏的页面基类，简化页面创建。

#### 特性
- 自动包含底部导航栏
- 必须指定当前页面索引
- 继承所有Scaffold功能

#### 使用方法

```dart
import 'package:vitals/shared/widgets/app_page.dart';

class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      currentIndex: 1, // 健康数据页面
      appBar: AppBar(title: Text('健康数据')),
      body: YourContent(),
    );
  }
}
```

### 4. LoadingView

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

对于需要底部导航栏的页面，推荐使用以下结构：

```dart
class YourPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage(
      currentIndex: 2, // 根据实际页面设置
      appBar: AppBar(title: Text('页面标题')),
      body: YourContent(),
    );
  }
}
```

### 2. 导航栏索引管理

建议在常量文件中定义导航栏索引：

```dart
class NavigationIndices {
  static const dashboard = 0;
  static const healthData = 1;
  static const reports = 2;
  static const profile = 3;
}
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

1. 更新 `AppBottomNavigationBar` 的 `items` 列表
2. 在 `onTap` 方法中添加新的路由处理
3. 更新路由配置
4. 更新所有使用导航栏的页面索引

### 自定义导航栏样式

可以通过修改 `AppBottomNavigationBar` 的 `build` 方法来自定义样式：

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
flutter test test/shared/widgets/app_bottom_navigation_bar_test.dart
```

### 测试注意事项

- 在测试环境中，GoRouter的导航可能不会实际执行
- 使用 `tester.pumpAndSettle()` 等待动画完成
- 验证组件的显示状态和交互行为

## 依赖

- `flutter/material.dart`: Flutter基础组件
- `go_router`: 路由管理

## 注意事项

1. **路由上下文**: 确保在使用导航功能的组件中有正确的GoRouter上下文
2. **索引一致性**: 保持页面索引与路由配置的一致性
3. **性能优化**: 使用const构造函数优化重建性能
4. **主题适配**: 组件会自动适配当前主题的颜色和样式
