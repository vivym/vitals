# 个人中心模块

## 概述

个人中心模块提供用户账户管理、设备绑定、服务管理、设置配置等功能，是用户管理个人信息和应用设置的统一入口。

## 功能特性

- **用户信息管理**: 头像、姓名、个人资料展示和编辑
- **就诊人管理**: 患者信息的增删改查
- **智能设备管理**: 第三方健康设备的授权和解绑
- **我的服务**: 服务订阅、历史记录查看
- **专项评估**: 健康评估问卷和结果
- **用药提醒**: 用药计划的设置和管理
- **个人设置**: 应用偏好、通知设置、隐私配置
- **收藏和反馈**: 内容收藏、问题反馈

## 架构设计

### 数据层 (Data Layer)
- `models/`: 数据模型定义
- `datasources/`: 数据源接口和实现
- `repositories/`: 仓库接口和实现

### 领域层 (Domain Layer)
- `entities/`: 领域实体
- `repositories/`: 仓库接口
- `usecases/`: 业务用例

### 表现层 (Presentation Layer)
- `screens/`: 页面
- `providers/`: Riverpod提供者
- `widgets/`: UI组件

## 核心组件

### 数据模型

#### UserProfile
用户资料模型，扩展基础User模型：
```dart
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? avatarUrl,
    Gender? gender,
    DateTime? birthDate,
    // ... 其他字段
  }) = _UserProfile;
}
```

#### ConnectedDevice
设备绑定信息模型：
```dart
@freezed
abstract class ConnectedDevice with _$ConnectedDevice {
  const factory ConnectedDevice({
    required String id,
    required String name,
    required DeviceType type,
    required DeviceStatus status,
    // ... 其他字段
  }) = _ConnectedDevice;
}
```

### 状态管理

#### ProfileNotifier
个人中心状态管理：
```dart
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  AsyncValue<ProfileState> build() {
    _loadProfileData();
    return const AsyncValue.loading();
  }

  Future<void> refresh() async {
    await _loadProfileData(forceRefresh: true);
  }
}
```

## 使用方法

### 1. 在页面中使用

```dart
class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      body: profileState.when(
        loading: () => const LoadingView(),
        error: (error, _) => ErrorView(error: error),
        data: (state) => _ProfileContent(state: state),
      ),
    );
  }
}
```

### 2. 刷新数据

```dart
// 在需要刷新数据的地方
ref.read(profileNotifierProvider.notifier).refresh();
```

### 3. 更新用户资料

```dart
final notifier = ref.read(profileNotifierProvider.notifier);
await notifier.updateProfile(updatedProfile);
```

## 路由配置

个人中心模块包含以下路由：

- `/profile` - 个人中心主页
- `/profile/edit` - 编辑资料
- `/profile/patients` - 就诊人管理
- `/profile/devices` - 智能设备
- `/profile/services` - 我的服务
- `/profile/assessments` - 专项评估
- `/profile/medication-reminders` - 用药提醒
- `/profile/settings` - 个人设置
- `/profile/favorites` - 我的收藏
- `/profile/feedback` - 健康反馈
- `/profile/about` - 关于

## 测试

### 运行测试

```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/features/profile/domain/usecases/get_user_profile_usecase_test.dart

# 运行Widget测试
flutter test test/features/profile/presentation/widgets/
```

### 测试覆盖

- **单元测试**: 用例、仓库、数据源
- **Widget测试**: UI组件交互
- **集成测试**: 完整功能流程

## 开发指南

### 添加新功能

1. **创建数据模型**: 在 `data/models/` 目录下创建新的模型类
2. **实现数据源**: 在 `data/datasources/` 目录下实现数据访问逻辑
3. **创建用例**: 在 `domain/usecases/` 目录下实现业务逻辑
4. **添加状态管理**: 在 `presentation/providers/` 目录下创建状态管理
5. **实现UI**: 在 `presentation/widgets/` 和 `presentation/screens/` 目录下创建界面

### 代码生成

修改注解类后，运行以下命令生成代码：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 遵循约定

- 使用TDD开发模式
- 遵循Clean Architecture架构
- 使用Riverpod进行状态管理
- 使用Freezed创建不可变模型
- 错误处理通过SelectableText.rich显示

## 依赖

- `riverpod`: 状态管理
- `freezed`: 不可变类和联合类型
- `json_annotation`: JSON序列化
- `go_router`: 路由管理
- `shared_preferences`: 本地存储
- `flutter_secure_storage`: 安全存储

## 注意事项

1. **权限管理**: 设备连接需要相应的健康数据权限
2. **数据同步**: 支持离线缓存和在线同步
3. **错误处理**: 网络错误、验证错误等都有相应的处理机制
4. **性能优化**: 使用const widget、列表优化等技术
5. **响应式设计**: 支持不同屏幕尺寸和主题模式
