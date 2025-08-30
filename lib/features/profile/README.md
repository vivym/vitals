# Profile 模块

## 概述

Profile 模块是 Vitals 应用的个人中心模块，现已重构为严格遵循 Clean Architecture 原则的三层架构。该模块提供用户账户管理、设备绑定、应用设置、数据管理等功能，是用户管理个人信息和应用配置的统一入口。

## 功能特性

- **用户资料管理**: 头像、姓名、个人信息的展示和编辑，支持完善度检查
- **智能设备管理**: 第三方健康设备的连接、断开、同步和状态监控
- **应用设置管理**: 主题模式、语言、通知、数据同步、隐私设置等
- **数据备份恢复**: 用户数据的云端备份和恢复功能
- **账户安全**: 生物识别认证、数据分析控制等安全功能
- **快捷功能入口**: 收藏、反馈、帮助等常用功能的快速访问

## Clean Architecture 架构设计

### Domain 层（领域层）- 业务逻辑核心
```
domain/
├── entities/                              # 领域实体（业务对象）
│   ├── profile_entity.dart                # 个人资料聚合实体
│   ├── user_profile_entity.dart           # 用户基本信息实体
│   ├── connected_device_entity.dart       # 连接设备实体
│   └── app_settings_entity.dart           # 应用设置实体
├── repositories/                          # 仓库接口（不依赖具体实现）
│   └── profile_repository.dart            # 个人资料仓库接口
└── usecases/                             # 用例（业务逻辑）
    ├── get_profile_usecase.dart           # 获取完整个人资料
    ├── update_user_profile_usecase.dart   # 更新用户基本信息
    ├── manage_devices_usecase.dart        # 设备管理（连接/断开/同步）
    ├── manage_app_settings_usecase.dart   # 应用设置管理
    └── backup_restore_usecase.dart        # 数据备份恢复
```

### Data 层（数据层）- 数据获取和存储
```
data/
├── datasources/                           # 数据源
│   ├── profile_remote_datasource.dart     # 远程数据源接口
│   ├── profile_remote_datasource_mock.dart # Mock实现（开发用）
│   ├── profile_local_datasource.dart      # 本地数据源接口
│   └── profile_local_datasource_impl.dart # 本地数据源实现
├── models/                                # 数据模型（JSON 序列化）
│   ├── user_profile.dart                  # 用户资料数据模型
│   ├── connected_device.dart              # 连接设备数据模型
│   ├── app_settings.dart                  # 应用设置数据模型
│   └── profile_state.dart                 # 状态数据模型
├── mappers/                               # 数据映射器
│   └── profile_mappers.dart               # 实体与模型间的转换
└── repositories/                          # 仓库实现
    └── profile_repository_impl.dart       # 实现领域层仓库接口
```

### Presentation 层（表现层）- UI 和状态管理
```
presentation/
├── screens/                               # 页面
│   └── profile_screen.dart                # 个人中心主页
├── widgets/                               # UI组件
│   ├── user_info_section.dart             # 用户信息展示区域
│   ├── quick_actions_section.dart         # 快捷功能区域
│   ├── function_list_section.dart         # 功能列表区域
│   ├── loading_view.dart                  # 加载状态组件
│   └── error_view.dart                    # 错误状态组件
└── providers/                             # 状态管理
    └── profile_notifier.dart              # Profile状态管理器
```

## 核心领域实体

### UserProfileEntity
用户基本信息实体，包含个人资料的核心业务逻辑：
```dart
@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? avatarUrl,
    Gender? gender,
    DateTime? birthDate,
    String? address,
    String? emergencyContact,
    String? emergencyContactPhone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfileEntity;

  // 业务方法
  int? get age;                        // 计算年龄
  String get displayName;              // 获取显示名称
  bool get isProfileComplete;          // 检查资料完善度
}
```

### ConnectedDeviceEntity
设备连接实体，管理健康设备的连接状态：
```dart
@freezed
abstract class ConnectedDeviceEntity with _$ConnectedDeviceEntity {
  const factory ConnectedDeviceEntity({
    required String id,
    required String name,
    required DeviceType type,         // 设备类型枚举
    required DeviceStatus status,     // 设备状态枚举
    String? brand,
    String? model,
    String? macAddress,
    DateTime? lastSyncAt,
    DateTime? connectedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ConnectedDeviceEntity;

  // 业务方法
  String get displayName;              // 获取设备显示名称
  bool get canSync;                    // 是否可以同步数据
  String get syncStatusDescription;    // 获取同步状态描述
}
```

### AppSettingsEntity
应用设置实体，管理用户偏好和应用配置：
```dart
@freezed
abstract class AppSettingsEntity with _$AppSettingsEntity {
  const factory AppSettingsEntity({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(Language.system) Language language,
    @Default(true) bool notificationsEnabled,
    @Default(true) bool healthDataNotifications,
    @Default(true) bool medicationReminders,
    @Default(true) bool deviceConnectionAlerts,
    @Default(SyncFrequency.daily) SyncFrequency dataSyncFrequency,
    @Default(true) bool autoBackup,
    @Default(false) bool biometricAuthEnabled,
    @Default(true) bool crashReportingEnabled,
    @Default(true) bool analyticsEnabled,
    DateTime? lastBackupAt,
    DateTime? updatedAt,
  }) = _AppSettingsEntity;

  // 业务方法
  bool get hasAnyNotificationEnabled;  // 是否启用了任何通知
  bool get hasPrivacyFeaturesEnabled;  // 是否启用了隐私保护功能
  String get syncDescription;          // 获取数据同步描述
  String get backupStatusDescription;  // 获取备份状态描述
}
```

### ProfileEntity
个人资料聚合实体，整合所有个人中心相关数据：
```dart
@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    UserProfileEntity? userProfile,
    @Default([]) List<ConnectedDeviceEntity> connectedDevices,
    @Default(AppSettingsEntity()) AppSettingsEntity settings,
    DateTime? lastUpdatedAt,
  }) = _ProfileEntity;

  // 业务方法
  bool get hasUserProfile;             // 是否有用户资料
  bool get hasConnectedDevices;        // 是否有连接的设备
  int get activeDeviceCount;           // 获取活跃设备数量
  Map<DeviceType, int> get deviceTypeStats; // 获取设备类型统计
  bool get needsProfileCompletion;     // 是否需要完善资料
  double get completionPercentage;     // 获取完成度百分比
  List<ConnectedDeviceEntity> get recentlyActiveDevices; // 获取最近活跃的设备
}
```

## 业务用例

### 核心用例说明

1. **GetProfileUsecase**: 获取完整的个人资料信息
   - 聚合用户基本信息、连接设备和应用设置
   - 支持缓存机制，优先读取本地数据
   - 统一错误处理和数据转换

2. **UpdateUserProfileUsecase**: 更新用户基本信息
   - 包含完整的数据验证逻辑
   - 支持手机号、邮箱格式验证
   - 生日合理性检查

3. **ManageDevicesUsecase**: 设备管理
   - 连接新设备（防止重复连接）
   - 断开设备连接
   - 同步设备数据
   - MAC地址格式验证

4. **ManageAppSettingsUsecase**: 应用设置管理
   - 主题模式切换
   - 通知设置管理
   - 数据同步设置
   - 安全设置配置

5. **BackupRestoreUsecase**: 数据备份恢复
   - 用户数据备份到云端
   - 从备份恢复数据
   - 账户删除（危险操作）

## 状态管理

### ProfileNotifier
基于 Riverpod 的响应式状态管理器：

```dart
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<ProfileState> build() async {
    return _loadProfile();
  }

  // 主要方法
  Future<void> refresh();                           // 刷新数据
  Future<void> updateUserProfile(UserProfileEntity profile); // 更新用户资料
  Future<void> connectDevice(ConnectedDeviceEntity device);  // 连接设备
  Future<void> disconnectDevice(String deviceId);            // 断开设备
  Future<void> updateAppSettings(AppSettingsEntity settings); // 更新应用设置
  Future<void> updateThemeMode(ThemeMode themeMode);         // 切换主题
  Future<void> updateNotificationSettings({...});            // 更新通知设置
}
```

### ProfileState
状态数据结构：
```dart
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    ProfileEntity? profile,
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    String? error,
  }) = _ProfileState;
}
```

## 数据映射

### ProfileMappers
负责数据层模型与领域实体之间的转换：

- **用户资料映射**: `UserProfile` ⟷ `UserProfileEntity`
- **设备信息映射**: `ConnectedDevice` ⟷ `ConnectedDeviceEntity`
- **应用设置映射**: `AppSettings` ⟷ `AppSettingsEntity`
- **枚举类型映射**: 处理不同层间的枚举类型转换

关键映射逻辑：
- 设备类型和状态的枚举转换
- 主题模式的Flutter类型适配
- 语言设置的Locale转换
- 同步频率的布尔值映射

## UI 组件设计

### UserInfoSection
用户信息展示区域：
- 响应式头像显示（支持网络图片和占位符）
- 用户基本信息展示（姓名、手机号）
- 年龄和性别信息chips
- 资料完善度提示
- 编辑入口

### QuickActionsSection
快捷功能区域：
- 智能设备管理入口（显示连接数量徽章）
- 应用设置入口
- 收藏和反馈入口
- 设备状态摘要显示

### FunctionListSection
功能列表区域：
- 分组的功能入口
- 一致的图标和文本样式
- 支持导航到各子模块

## 使用方法

### 基本使用
```dart
class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return profileState.when(
      loading: () => const LoadingView(),
      error: (error, _) => ErrorView(error: error.toString()),
      data: (state) => _ProfileContent(state: state),
    );
  }
}
```

### 更新用户资料
```dart
// 在组件中更新用户资料
final notifier = ref.read(profileNotifierProvider.notifier);
await notifier.updateUserProfile(updatedProfile);
```

### 设备管理
```dart
// 连接新设备
await notifier.connectDevice(newDevice);

// 断开设备连接
await notifier.disconnectDevice(deviceId);
```

### 设置管理
```dart
// 切换主题模式
await notifier.updateThemeMode(ThemeMode.dark);

// 更新通知设置
await notifier.updateNotificationSettings(
  healthDataNotifications: false,
  medicationReminders: true,
);
```

## 错误处理

### 统一错误处理机制
- 使用 `Result<T>` 类型包装所有操作结果
- 区分不同类型的错误（网络、验证、未知等）
- 在UI层通过 `SelectableText.rich` 显示错误信息
- 避免使用 SnackBar 进行错误提示

### 错误类型
- **NetworkError**: 网络请求失败
- **ValidationError**: 数据验证失败
- **UnknownError**: 未知错误

## 测试策略

### 测试覆盖
- **单元测试**: 所有用例的业务逻辑测试
- **Widget测试**: UI组件的交互测试
- **集成测试**: 完整功能流程测试

### 测试工具
- **Mocktail**: Mock 外部依赖
- **ProviderContainer**: 测试 Riverpod 状态管理
- **TestWidgets**: Flutter 组件测试

### 测试示例
```dart
group('ProfileNotifier', () {
  test('should load profile successfully', () async {
    // Given
    when(() => mockGetProfileUsecase('user_1'))
        .thenAnswer((_) async => const Result.success(testProfile));

    // When
    final state = await container.read(profileNotifierProvider.future);

    // Then
    expect(state.profile, equals(testProfile));
    expect(state.error, isNull);
  });
});
```

## 性能优化

### 缓存策略
- 优先使用本地缓存数据
- 支持强制刷新机制
- 智能缓存失效策略

### UI优化
- 使用 `const` widget 优化重建
- 响应式设计适配不同屏幕
- 图片懒加载和错误处理

### 状态管理优化
- 避免不必要的状态重建
- 合理使用 `ref.watch` 和 `ref.read`
- 异步操作的取消机制

## 路由配置

Profile模块包含以下路由结构：
```
/profile                    # 个人中心主页
├── /profile/edit          # 编辑用户资料
├── /profile/devices       # 智能设备管理
├── /profile/settings      # 应用设置
├── /profile/patients      # 就诊人管理
├── /profile/services      # 我的服务
├── /profile/assessments   # 专项评估
├── /profile/medication-reminders # 用药提醒
├── /profile/favorites     # 我的收藏
├── /profile/feedback      # 健康反馈
└── /profile/about         # 关于页面
```

## 依赖管理

### 内部依赖
- `core/errors/` - 统一错误处理
- `core/network/` - 网络请求封装
- `shared/providers/` - 共享状态提供者
- `shared/models/` - 共享数据模型

### 外部依赖
- `riverpod` - 状态管理框架
- `freezed` - 不可变数据类生成
- `json_annotation` - JSON序列化支持
- `go_router` - 路由管理
- `shared_preferences` - 本地数据存储
- `flutter_secure_storage` - 安全数据存储

## 开发指南

### 添加新功能
1. **创建领域实体**: 在 `domain/entities/` 定义业务对象
2. **定义仓库接口**: 在 `domain/repositories/` 声明数据访问接口
3. **实现用例**: 在 `domain/usecases/` 编写业务逻辑
4. **创建数据模型**: 在 `data/models/` 定义传输对象
5. **实现数据源**: 在 `data/datasources/` 实现数据访问
6. **创建仓库实现**: 在 `data/repositories/` 实现仓库接口
7. **添加数据映射**: 在 `data/mappers/` 实现实体转换
8. **实现UI组件**: 在 `presentation/` 创建界面和状态管理
9. **编写测试**: 覆盖所有层的功能测试

### 代码生成
修改带注解的类后，运行代码生成命令：
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 遵循约定
- 严格遵循 Clean Architecture 分层原则
- 领域层不依赖外部框架
- 使用依赖注入管理对象创建
- 统一的错误处理和日志记录
- TDD 开发模式
- 代码审查和性能监控

## 注意事项

1. **数据一致性**: 确保不同数据源间的数据同步
2. **权限管理**: 设备连接需要相应的系统权限
3. **安全考虑**: 敏感数据使用安全存储，生物识别认证
4. **性能监控**: 监控大量设备时的性能表现
5. **错误恢复**: 网络异常时的重试和降级策略
6. **版本兼容**: 数据模型变更时的向后兼容性

## 架构优势

### Clean Architecture 带来的好处
1. **可测试性**: 业务逻辑独立，易于单元测试
2. **可维护性**: 清晰的分层和职责分离
3. **可扩展性**: 易于添加新功能而不影响现有代码
4. **可替换性**: 数据源和UI框架可独立替换
5. **团队协作**: 不同层可并行开发
6. **代码复用**: 领域逻辑可在不同平台复用

### 重构成果
- **从MVC到Clean Architecture**: 完整的架构升级
- **依赖反转**: 高层模块不再依赖低层模块
- **关注点分离**: 业务逻辑、数据访问、UI展示完全分离
- **类型安全**: 强类型实体和完整的编译时检查
- **响应式状态管理**: 基于Riverpod的现代状态管理
- **完整测试覆盖**: 单元测试、Widget测试、集成测试

这个重构后的Profile模块为Vitals应用提供了坚实的架构基础，支持未来的功能扩展和维护需求。