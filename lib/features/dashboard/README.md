# 首页（Dashboard）模块

## 模块概述

首页模块是用户登录后的主要入口，提供健康数据概览、康复目标跟踪和健康教育内容，帮助用户快速了解当前健康状况和康复进度。

## 功能特性

- **健康数据概览**: 展示心率、血压、体重、步数等核心健康指标的今日/最近数据
- **康复目标管理**: 显示和跟踪血压控制、胆固醇水平、运动目标、用药依从性等康复目标
- **健康宣教**: 推荐健康知识文章、视频，支持阅读状态跟踪
- **快速操作**: 提供快捷入口到各个功能模块
- **健康评分**: 基于多个健康指标计算综合健康评分

## 模块结构

```
lib/features/dashboard/
├── data/                          # 数据层
│   ├── datasources/              # 数据源
│   │   ├── dashboard_remote_datasource.dart          # 远程数据源接口
│   │   ├── dashboard_remote_datasource_mock.dart     # Mock实现（开发用）
│   │   ├── dashboard_local_datasource.dart           # 本地数据源接口
│   │   └── dashboard_local_datasource_impl.dart      # 本地数据源实现
│   ├── models/                   # 数据模型
│   │   └── dashboard_models.dart # 所有数据模型定义
│   ├── repositories/             # 仓库层
│   │   ├── dashboard_repository.dart                 # 仓库接口
│   │   └── dashboard_repository_impl.dart            # 仓库实现
│   └── providers/                # 依赖注入
│       └── dashboard_providers.dart                  # 数据层Providers
├── domain/                       # 业务逻辑层
│   └── usecases/                # 用例
│       ├── get_dashboard_data_usecase.dart           # 获取首页数据
│       ├── mark_education_as_read_usecase.dart       # 标记教育内容已读
│       └── calculate_health_score_usecase.dart       # 计算健康评分
├── presentation/                 # 表现层
│   ├── providers/               # 状态管理
│   │   └── dashboard_notifier.dart                   # 首页状态管理
│   ├── screens/                 # 页面
│   │   ├── dashboard_screen.dart                     # 首页主屏幕
│   │   └── dashboard_demo_screen.dart                # 演示页面
│   └── widgets/                 # UI组件
│       ├── health_score_card.dart                    # 健康评分卡片
│       ├── health_data_overview_section.dart         # 健康数据概览
│       ├── recovery_goals_section.dart               # 康复目标区域
│       ├── health_education_section.dart             # 健康宣教区域
│       ├── quick_actions_section.dart                # 快速操作区域
│       ├── health_data_card.dart                     # 健康数据卡片
│       ├── loading_view.dart                         # 加载状态视图
│       ├── error_view.dart                           # 错误状态视图
│       └── empty_state_view.dart                     # 空状态视图
└── test/                        # 测试文件
    └── domain/usecases/
        └── calculate_health_score_usecase_test.dart   # 健康评分测试
```

## 核心数据模型

### HealthDataOverview
健康数据概览，包含：
- `bloodPressure`: 血压数据
- `heartRate`: 心率数据
- `weight`: 体重数据
- `steps`: 步数数据

### RecoveryGoal
康复目标，包含：
- 目标类型（血压控制、胆固醇、运动、用药依从性等）
- 目标值和当前值
- 进度计算
- 剩余天数

### HealthEducationItem
健康教育内容，包含：
- 文章/视频/图解等类型
- 阅读时间和标签
- 阅读状态和收藏状态

## 使用方法

### 1. 基本使用

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/dashboard/presentation/screens/dashboard_screen.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}
```

### 2. 状态管理

```dart
// 监听首页状态
final dashboardState = ref.watch(dashboardNotifierProvider);

// 刷新数据
ref.read(dashboardNotifierProvider.notifier).refresh();

// 标记教育内容已读
ref.read(dashboardNotifierProvider.notifier)
    .markEducationAsRead('item_id');
```

### 3. 健康评分

```dart
// 获取健康评分
final score = ref.watch(healthScoreProvider);

// 获取紧急目标
final urgentGoals = ref.watch(urgentGoalsProvider);

// 获取推荐教育内容
final recommendedEducation = ref.watch(recommendedEducationProvider);
```

## 开发指南

### 1. 添加新的健康指标

1. 在 `dashboard_models.dart` 中定义新的数据模型
2. 在 `HealthDataOverview` 中添加新字段
3. 在 `HealthDataOverviewSection` 中添加对应的卡片
4. 在 `CalculateHealthScoreUseCase` 中添加评分逻辑

### 2. 添加新的目标类型

1. 在 `GoalType` 枚举中添加新类型
2. 在 `RecoveryGoalsSection` 中处理新类型的显示
3. 更新相关的图标和颜色配置

### 3. 自定义UI组件

所有UI组件都遵循Flutter设计规范，支持主题定制。可以通过修改 `Theme.of(context)` 来调整样式。

## 测试

### 运行测试

```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/features/dashboard/domain/usecases/calculate_health_score_usecase_test.dart
```

### 测试覆盖率

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 性能优化

- 使用 `const` 构造函数优化静态组件
- 实现数据缓存策略（5分钟短期缓存）
- 使用 `ListView.builder` 优化长列表
- 实现下拉刷新和自动刷新

## 注意事项

1. **数据缓存**: 本地缓存5分钟过期，网络错误时自动回退到缓存数据
2. **状态管理**: 使用Riverpod进行状态管理，支持异步操作和错误处理
3. **路由导航**: 使用GoRouter进行页面导航，支持深链接
4. **国际化**: 所有文本都使用中文，符合中国用户习惯

## 依赖项

- `flutter_riverpod`: 状态管理
- `freezed`: 不可变数据类
- `json_annotation`: JSON序列化
- `go_router`: 路由管理
- `shared_preferences`: 本地存储

## 更新日志

### v1.0.0
- 初始版本发布
- 实现基础的健康数据展示
- 支持康复目标跟踪
- 提供健康教育内容管理
- 实现健康评分计算
