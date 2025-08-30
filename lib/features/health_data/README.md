# Health Data 模块

## 概述

Health Data 模块是 Vitals 应用的核心健康数据管理模块，负责处理用户的血压、心率、体重、步数等健康指标的记录、存储、展示和分析。

## 架构设计

本模块严格遵循 Clean Architecture 原则，采用分层架构设计：

```
lib/features/health_data/
├── data/                    # 数据层
│   ├── datasources/         # 数据源（远程API、本地存储）
│   ├── models/              # 数据模型（DTO）
│   └── repositories/        # 仓库实现
├── domain/                  # 领域层
│   ├── entities/            # 领域实体
│   ├── repositories/        # 仓库接口
│   └── usecases/            # 用例
└── presentation/            # 表现层
    ├── screens/             # 页面
    ├── providers/           # Riverpod提供者
    └── widgets/             # UI组件
```

## 核心功能

### 1. 血压管理
- **数据录入**：支持手动输入收缩压/舒张压
- **数据展示**：图表化展示血压趋势
- **时间筛选**：支持近一周、近一月、全部时间范围
- **智能验证**：收缩压应大于舒张压的合理性检查

### 2. 心率管理
- **数据记录**：心率数值录入
- **趋势分析**：心率变化趋势图表
- **异常提醒**：心率异常范围检测

### 3. 体重管理
- **体重记录**：支持小数点精度
- **变化追踪**：体重变化趋势分析
- **目标设定**：体重管理目标

### 4. 步数统计
- **日常步数**：每日步数记录
- **目标达成**：步数目标完成度
- **统计分析**：步数趋势和统计

## 技术特性

### 状态管理
- 使用 **Riverpod** 进行状态管理
- 采用 `@riverpod` 注解生成提供者
- 支持异步状态处理（`AsyncValue`）

### 数据模型
- 使用 **Freezed** 创建不可变数据类
- 支持 JSON 序列化/反序列化
- 实现数据验证和错误处理

### UI组件
- **响应式设计**：适配不同屏幕尺寸
- **Material Design 3**：遵循最新设计规范
- **自定义组件**：数字键盘、图表等专用组件

## 主要组件

### 血压输入对话框 (`BloodPressureInputDialog`)
- 智能输入模式切换（收缩压 ⇄ 舒张压）
- 自定义数字键盘
- 实时数据验证
- 状态指示（字体大小和颜色差异）

### 血压图表 (`BloodPressureChart`)
- 双线图表（收缩压/舒张压）
- 自动Y轴缩放
- 智能X轴标签间隔
- 支持时间范围筛选

### 时间范围选择器 (`TimeRangeSelector`)
- 支持近一周、近一月、全部
- 响应式按钮布局
- 状态持久化

## 使用方法

### 基本数据录入
```dart
// 获取血压数据提供者
final bloodPressureProvider = ref.watch(bloodPressureNotifierProvider);

// 录入新血压数据
await ref.read(bloodPressureNotifierProvider.notifier).recordBloodPressure(
  patientId: 'patient_1',
  systolic: 120,
  diastolic: 80,
  heartRate: 72,
  recordedAt: DateTime.now(),
);
```

### 数据展示
```dart
// 监听血压状态
bloodPressureState.when(
  loading: () => LoadingView(),
  error: (error, stackTrace) => ErrorView(error: error),
  data: (state) => BloodPressureContent(state: state),
);
```

### 时间范围切换
```dart
// 切换时间范围
ref.read(bloodPressureNotifierProvider.notifier).setTimeRange(TimeRange.month);
```

## 开发指南

### 添加新的健康指标

1. **创建领域实体**
```dart
@freezed
abstract class NewHealthMetric with _$NewHealthMetric {
  const factory NewHealthMetric({
    required String id,
    required double value,
    required DateTime recordedAt,
    String? notes,
  }) = _NewHealthMetric;
}
```

2. **定义仓库接口**
```dart
abstract class NewHealthMetricRepository {
  Future<Result<List<NewHealthMetric>>> getRecords(String patientId);
  Future<Result<void>> addRecord(NewHealthMetric record);
}
```

3. **实现用例**
```dart
@riverpod
class NewHealthMetricNotifier extends _$NewHealthMetricNotifier {
  @override
  Future<NewHealthMetricState> build() async {
    return const NewHealthMetricState();
  }

  Future<void> addRecord(NewHealthMetric record) async {
    // 实现逻辑
  }
}
```

### 错误处理
- 使用 `Result<T>` 类型包装操作结果
- 在UI层使用 `SelectableText.rich` 显示错误信息
- 避免使用 SnackBar 进行错误提示

### 测试策略
- **单元测试**：测试用例和仓库逻辑
- **Widget测试**：测试UI组件交互
- **集成测试**：测试完整数据流

## 依赖关系

### 内部依赖
- `core/errors/` - 错误处理
- `core/network/` - 网络请求
- `shared/models/` - 共享模型
- `shared/providers/` - 共享提供者

### 外部依赖
- `riverpod` - 状态管理
- `freezed` - 数据类生成
- `fl_chart` - 图表绘制
- `go_router` - 路由管理

## 性能优化

### 列表优化
- 使用 `ListView.builder` 处理大量数据
- 实现分页加载
- 缓存已加载的数据

### 图表优化
- 动态计算Y轴范围
- 智能X轴标签间隔
- 支持图表缩放和平移

### 状态管理优化
- 使用 `ref.invalidate()` 手动触发更新
- 合理使用 `ref.watch` 和 `ref.read`
- 避免不必要的状态重建

## 未来规划

### 短期目标
- [ ] 添加数据导出功能
- [ ] 实现数据备份和恢复
- [ ] 优化图表性能

### 长期目标
- [ ] 集成第三方健康设备
- [ ] 实现AI健康建议
- [ ] 支持多用户数据管理

## 贡献指南

1. 遵循项目的代码约定
2. 编写完整的测试用例
3. 更新相关文档
4. 提交前运行 `flutter analyze` 检查

## 相关文档

- [Flutter 官方文档](https://flutter.dev/docs)
- [Riverpod 文档](https://riverpod.dev/)
- [Freezed 文档](https://pub.dev/packages/freezed)
- [Fl Chart 文档](https://pub.dev/packages/fl_chart)
