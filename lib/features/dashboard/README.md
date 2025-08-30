# Dashboard 模块

## 概述

Dashboard 模块是 Vitals 应用的首页模块，现已重构为严格遵循 Clean Architecture 原则的三层架构。该模块提供健康数据概览、康复目标跟踪和健康教育内容，帮助用户快速了解当前健康状况和康复进度。

## 功能特性

- **健康数据概览**: 展示心率、血压、体重、步数等核心健康指标的今日/最近数据
- **康复目标管理**: 显示和跟踪血压控制、胆固醇水平、运动目标、用药依从性等康复目标
- **健康宣教**: 推荐健康知识文章、视频，支持阅读状态跟踪
- **快速操作**: 提供快捷入口到各个功能模块
- **健康评分**: 基于多个健康指标计算综合健康评分

## Clean Architecture 架构设计

### Domain 层（领域层）- 业务逻辑核心
```
domain/
├── entities/                           # 领域实体（业务对象）
│   ├── dashboard_entity.dart           # 首页数据聚合实体
│   ├── health_data_overview_entity.dart # 健康数据概览实体
│   ├── recovery_goal_entity.dart       # 康复目标实体
│   ├── health_education_entity.dart    # 健康教育内容实体
│   └── health_score_entity.dart        # 健康评分实体
├── repositories/                       # 仓库接口（不依赖具体实现）
│   └── dashboard_repository.dart       # 首页数据仓库接口
└── usecases/                          # 用例（业务逻辑）
    ├── get_dashboard_data_usecase.dart      # 获取首页数据
    ├── get_education_items_usecase.dart     # 获取教育内容列表
    ├── mark_education_as_read_usecase.dart  # 标记教育内容已读
    ├── toggle_education_favorite_usecase.dart # 切换收藏状态
    └── calculate_health_score_usecase.dart  # 计算健康评分
```

### Data 层（数据层）- 数据获取和存储
```
data/
├── datasources/                        # 数据源
│   ├── dashboard_remote_datasource.dart     # 远程数据源接口
│   ├── dashboard_remote_datasource_mock.dart # Mock实现（开发用）
│   ├── dashboard_local_datasource.dart      # 本地数据源接口
│   └── dashboard_local_datasource_impl.dart # 本地数据源实现
├── models/                            # 数据模型（JSON 序列化）
│   └── dashboard_models.dart          # 所有数据传输对象
└── repositories/                       # 仓库实现
    └── dashboard_repository_impl.dart  # 实现领域层仓库接口
```

### Presentation 层（表现层）- UI 和状态管理
```
presentation/
├── providers/                         # 状态管理和依赖注入
│   ├── dashboard_notifier.dart        # 首页状态管理 (Riverpod)
│   └── dashboard_providers.dart       # 用例层 Providers
├── screens/                           # 页面
│   ├── dashboard_screen.dart          # 首页主屏幕（内容组件）
│   └── dashboard_demo_screen.dart     # 演示页面
└── widgets/                           # UI组件
    ├── health_score_card.dart         # 健康评分卡片
    ├── health_data_overview_section.dart # 健康数据概览
    ├── recovery_goals_section.dart    # 康复目标区域
    ├── health_education_section.dart  # 健康宣教区域
    ├── quick_actions_section.dart     # 快速操作区域
    ├── health_data_card.dart         # 健康数据卡片
    ├── loading_view.dart             # 加载状态视图
    ├── error_view.dart               # 错误状态视图
    └── empty_state_view.dart         # 空状态视图
```

## 核心领域实体

### 1. DashboardEntity（首页数据聚合实体）
```dart
@freezed
class DashboardEntity with _$DashboardEntity {
  const factory DashboardEntity({
    required HealthDataOverviewEntity healthData,
    required List<RecoveryGoalEntity> recoveryGoals,
    required List<HealthEducationItemEntity> educationItems,
    HealthScoreEntity? healthScore,
    DateTime? lastUpdated,
  }) = _DashboardEntity;
}
```

### 2. HealthDataOverviewEntity（健康数据概览实体）
```dart
@freezed
class HealthDataOverviewEntity with _$HealthDataOverviewEntity {
  const factory HealthDataOverviewEntity({
    BloodPressureSummaryEntity? bloodPressure,
    HeartRateSummaryEntity? heartRate,
    WeightSummaryEntity? weight,
    StepsSummaryEntity? steps,
    DateTime? lastUpdated,
  }) = _HealthDataOverviewEntity;
}
```

### 3. RecoveryGoalEntity（康复目标实体）
```dart
@freezed
class RecoveryGoalEntity with _$RecoveryGoalEntity {
  const factory RecoveryGoalEntity({
    required String id,
    required String title,
    required GoalType type,
    required double targetValue,
    required double currentValue,
    required DateTime deadline,
    required GoalStatus status,
    // ... 其他字段
  }) = _RecoveryGoalEntity;
}
```

### 4. HealthEducationItemEntity（健康教育内容实体）
```dart
@freezed
class HealthEducationItemEntity with _$HealthEducationItemEntity {
  const factory HealthEducationItemEntity({
    required String id,
    required String title,
    required EducationType type,
    required bool isRead,
    required bool isFavorited,
    // ... 其他字段
  }) = _HealthEducationItemEntity;
}
```

### 5. HealthScoreEntity（健康评分实体）
```dart
@freezed
class HealthScoreEntity with _$HealthScoreEntity {
  const factory HealthScoreEntity({
    required int totalScore,
    required Map<String, int> categoryScores,
    required HealthScoreLevel level,
    required String description,
    required List<String> recommendations,
    DateTime? calculatedAt,
  }) = _HealthScoreEntity;
}
```

## Clean Architecture 重构成果

### ✅ 已完成的重构任务

1. **✅ 创建领域实体 (Domain Entities)**
   - 定义了所有核心业务实体
   - 使用 Freezed 确保不可变性
   - 包含业务逻辑方法（如进度计算、状态判断）
   - **重要**: 所有实体都是纯领域对象，不依赖任何外部框架

2. **✅ 创建领域仓库接口 (Domain Repository)**
   - 定义了数据获取的抽象接口
   - 不依赖任何具体实现
   - 使用 Result 模式处理错误

3. **✅ 重构用例以符合Clean Architecture**
   - 每个用例都有接口和实现
   - 只依赖领域层接口
   - 包含业务验证逻辑
   - 所有测试用例已通过

4. **✅ 更新数据层仓库实现**
   - 实现领域层仓库接口
   - 添加数据模型到实体的转换逻辑
   - 保持原有的缓存和错误处理机制

5. **✅ 修复依赖注入**
   - 在表现层管理所有依赖
   - 使用 Riverpod 进行依赖注入
   - 清晰的层次分离

6. **✅ 更新表现层以使用领域层**
   - 状态管理器使用领域实体
   - 通过用例执行业务逻辑
   - 保持 UI 组件纯净

7. **✅ 运行代码生成器**
   - 生成了所有 Freezed 和 Riverpod 代码
   - 解决了所有编译错误

8. **✅ 重构UI架构**
   - 将 `pages` 目录重命名为 `screens`
   - 移除了 `data/providers` 目录（违反架构原则）
   - 所有页面现在通过 `MainNavigationScaffold` 统一管理

9. **✅ 完善测试覆盖**
   - 所有用例层测试已通过
   - 使用 Mocktail 进行依赖模拟
   - 测试覆盖成功、失败、异常等场景

## 架构优势

### 1. 依赖倒置 (Dependency Inversion)
- 内层（Domain）不依赖外层
- 外层（Data, Presentation）依赖内层的抽象接口
- 易于测试和替换实现

### 2. 单一职责 (Single Responsibility)
- 每个用例只负责一个具体的业务功能
- 数据层只负责数据获取和转换
- 表现层只负责 UI 状态管理

### 3. 开闭原则 (Open/Closed)
- 可以轻松添加新的用例而不修改现有代码
- 可以替换数据源实现而不影响业务逻辑
- 支持多种 UI 表现形式

### 4. 可测试性 (Testability)
- 每层都可以独立测试
- 依赖注入使得 mock 变得简单
- 业务逻辑与框架解耦

### 5. 纯领域对象 (Pure Domain Objects)
- 领域实体不依赖 Flutter、Riverpod 等外部框架
- 业务逻辑可以在任何环境中运行
- 便于单元测试和业务逻辑验证

## 使用方法

### 1. 获取首页数据
```dart
// 在 Widget 中监听状态
final dashboardState = ref.watch(dashboardNotifierProvider);

// 刷新数据
ref.read(dashboardNotifierProvider.notifier).refresh();
```

### 2. 业务操作
```dart
// 标记教育内容已读
await ref.read(dashboardNotifierProvider.notifier)
    .markEducationAsRead('item_id');

// 切换收藏状态
await ref.read(dashboardNotifierProvider.notifier)
    .toggleEducationFavorite('item_id');
```

### 3. 获取特定数据
```dart
// 获取健康评分
final healthScore = ref.watch(healthScoreProvider);

// 获取紧急目标
final urgentGoals = ref.watch(urgentGoalsProvider);

// 获取推荐教育内容
final recommendedEducation = ref.watch(recommendedEducationProvider);
```

## 开发指南

### 1. 添加新的业务功能
1. 在 `domain/entities/` 中定义或扩展实体
2. 在 `domain/usecases/` 中创建新的用例
3. 在 `domain/repositories/` 中添加所需的接口方法
4. 在 `data/repositories/` 中实现接口
5. 在 `presentation/providers/` 中注入用例
6. 在 `presentation/` 中使用用例

### 2. 添加新的数据源
1. 在 `data/datasources/` 中定义接口
2. 创建具体实现（API、本地存储等）
3. 在仓库实现中使用

### 3. 扩展 UI 组件
1. 在 `presentation/widgets/` 中创建新组件
2. 使用领域实体作为数据模型
3. 通过 Provider 获取状态和执行操作

## 重构过程中遇到的问题及解决方案

### 1. 架构层次混乱
**问题**: 原来的用例直接依赖数据层，违反了 Clean Architecture 原则
**解决方案**:
- 在领域层定义仓库接口
- 数据层实现接口
- 用例只依赖接口，不依赖具体实现

### 2. 实体和模型混淆
**问题**: 数据传输对象（DTO）和业务实体混在一起
**解决方案**:
- 领域层定义纯粹的业务实体
- 数据层定义 JSON 序列化模型
- 在仓库实现中进行转换

### 3. 依赖注入复杂性
**问题**: 多层依赖导致 Provider 管理混乱
**解决方案**:
- 数据层 Provider 只管理数据源
- 表现层 Provider 管理仓库和用例
- 清晰的层次分离

### 4. 代码生成问题
**问题**: Freezed 和 Riverpod 代码生成相互影响
**解决方案**:
- 定期运行 `flutter clean` 清理缓存
- 使用 `--delete-conflicting-outputs` 强制重新生成
- 检查 part 文件引用正确性

### 5. 类型安全问题
**问题**: 数据模型和实体之间的类型转换
**解决方案**:
- 为每个枚举提供明确的映射方法
- 使用扩展方法简化转换逻辑
- 添加空值检查和默认值处理

### 6. 领域实体污染
**问题**: 领域实体导入了 Flutter 相关包
**解决方案**:
- 移除所有 Flutter 导入
- 使用通用 Dart 类型替代 Flutter 特定类型
- 确保实体可以在任何环境中运行

### 7. 目录结构问题
**问题**: `providers` 错误地放在 `data` 目录下
**解决方案**:
- 删除 `data/providers` 目录
- 将所有 Provider 移到 `presentation/providers`
- 保持架构层次清晰

### 8. 页面命名不一致
**问题**: 有些目录使用 `pages`，有些使用 `screens`
**解决方案**:
- 统一重命名为 `screens`
- 更新所有相关导入路径
- 保持命名一致性

## 测试策略

### 1. 单元测试
- **Domain 层**: 测试用例逻辑和实体方法 ✅
- **Data 层**: 测试仓库实现和数据转换
- **Presentation 层**: 测试状态管理逻辑

### 2. 集成测试
- 测试完整的数据流（API → Repository → UseCase → Provider）
- 验证错误处理和边界情况

### 3. Widget 测试
- 测试 UI 组件的渲染和交互
- 使用 mock 数据和 Provider override

## 性能优化

- **缓存策略**: 5分钟本地缓存，网络失败时回退
- **Const 优化**: UI 组件使用 const 构造函数
- **Provider 优化**: 使用 select 避免不必要的重建
- **数据分页**: 教育内容支持分页加载
- **异步操作**: 本地操作立即响应，远程同步异步处理

## 未来改进方向

1. **完善错误处理**: 更细粒度的错误分类和用户提示
2. **离线支持**: 增强本地缓存和离线数据同步
3. **实时数据**: 添加 WebSocket 支持实时健康数据更新
4. **个性化推荐**: 基于用户行为的智能内容推荐
5. **A/B 测试**: 支持 UI 组件的 A/B 测试
6. **性能监控**: 添加性能指标收集和分析

## 相关文档

- [Clean Architecture 原则](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Riverpod 官方文档](https://riverpod.dev/)
- [Freezed 使用指南](https://pub.dev/packages/freezed)
- [Flutter 测试指南](https://docs.flutter.dev/testing)

---

**重构状态**: ✅ **重构完成** - 所有架构问题已解决，测试通过，代码生成正常
**下一步**: 完善其他模块的测试覆盖，优化性能，添加新功能