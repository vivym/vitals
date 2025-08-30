# Auth 模块

## 概述

Auth 模块是 Vitals 应用的认证模块，负责用户登录、自动登录、患者签约等功能。该模块严格遵循 Clean Architecture 架构模式，包含三个主要层次：Domain（领域层）、Data（数据层）和 Presentation（表现层）。

## 功能特性

- **手机号登录**: 支持手机号码验证和登录
- **自动登录**: 支持应用重启后的自动登录
- **患者签约**: 每个账号必须签约一个患者（1:1关系）
- **会话管理**: Token 管理和用户状态持久化
- **安全存储**: 使用 FlutterSecureStorage 存储敏感信息
- **错误处理**: 完善的错误处理和用户反馈

## 架构设计

### Domain 层（领域层）
```
domain/
├── entities/           # 领域实体
│   ├── user_entity.dart
│   ├── patient_entity.dart
│   └── gender.dart
├── repositories/       # 仓库接口
│   └── auth_repository.dart
└── usecases/          # 用例
    ├── login_usecase.dart
    ├── auto_login_usecase.dart
    ├── logout_usecase.dart
    ├── sign_patient_usecase.dart
    └── check_patient_signed_usecase.dart
```

### Data 层（数据层）
```
data/
├── datasources/       # 数据源
│   ├── auth_remote_datasource.dart
│   ├── auth_remote_datasource_impl.dart
│   ├── auth_local_datasource.dart
│   └── auth_local_datasource_impl.dart
├── models/            # 数据模型
│   ├── auth_models.dart
│   └── patient.dart
└── repositories/      # 仓库实现
    └── auth_repository_impl.dart
```

### Presentation 层（表现层）
```
presentation/
├── pages/             # 页面
│   ├── login_screen.dart
│   ├── patient_sign_screen.dart
│   └── patient_sign_success_screen.dart
├── providers/         # Riverpod 提供者
│   ├── auth_provider.dart
│   ├── patient_sign_form_provider.dart
│   └── auth_providers.dart
└── widgets/           # UI 组件
    └── login_form.dart
```

## 核心概念

### 1. 用户实体 (UserEntity)
```dart
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String phone,
    String? email,
  }) = _UserEntity;
}
```

### 2. 患者实体 (PatientEntity)
```dart
@freezed
class PatientEntity with _$PatientEntity {
  const factory PatientEntity({
    required String id,
    required String name,
    required String idNumber,
    required Gender gender,
    required DateTime birthDate,
    required String phone,
  }) = _PatientEntity;
```

### 3. 登录结果 (LoginResult)
```dart
@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String token,
    required UserEntity user,
    PatientEntity? patient,  // 1:1 关系
  }) = _LoginResult;
}
```

### 4. 认证状态 (AuthState)
```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    @Default(false) bool hasSignedPatient,
    UserEntity? user,
    PatientEntity? patient,
    AppError? error,
  }) = _AuthState;
}
```

## 开发过程中遇到的问题及解决方案

### 1. 类型不匹配问题

**问题**: 重构过程中出现大量类型不匹配错误
- `LoginResponse` vs `LoginResult`
- `User` vs `UserEntity`
- `Patient` vs `PatientEntity`
- `patients` (数组) vs `patient` (单个对象)

**解决方案**:
- 系统性地更新所有引用，使用 `as data` 别名区分数据层和领域层类型
- 建立清晰的类型映射关系
- 使用代码生成工具 (Freezed) 确保类型一致性

### 2. Mock 数据结构不匹配

**问题**: 集成测试中 mock 数据使用 `patients` 数组，但新架构要求单个 `patient`

**解决方案**:
```dart
// 修改前
'patients': [
  {
    'id': 'patient_1',
    'name': '张三',
    // ...
  },
],

// 修改后
'patient': {
  'id': 'patient_1',
  'name': '张三',
  // ...
},
```

### 3. 依赖注入和初始化问题

**问题**: `SharedPreferences` 和 `FlutterSecureStorage` 需要在 Flutter 引擎初始化后才能使用

**解决方案**:
- 在 `auth_providers.dart` 中定义抽象 Provider
- 在 `main.dart` 中使用 `overrideWithValue` 提供具体实现
- 测试中使用 mock 实现

```dart
// auth_providers.dart
@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError('需要在main.dart中重写此Provider');
}

// main.dart
ProviderScope(
  overrides: [
    sharedPreferencesProvider.overrideWithValue(prefs),
    flutterSecureStorageProvider.overrideWithValue(secureStorage),
  ],
  child: MyApp(),
)
```

### 4. 患者签约流程重构

**问题**: 从多患者列表模式改为单患者签约模式

**解决方案**:
- 重命名 `CreatePatientUseCase` → `SignPatientUseCase`
- 重命名 `create_patient_screen` → `patient_sign_screen`
- 更新路由逻辑，强制未签约用户进入签约页面
- 修改 API 接口从 `/auth/patients` → `/auth/patient`

### 5. 路由重定向逻辑

**问题**: 实现登录后自动检查患者签约状态并重定向

**解决方案**:
```dart
// app_router.dart
redirect: (context, state) {
  final authState = ref.read(authNotifierProvider);

  if (authState.requiresPatientSign) {
    return AppRoutes.patientSign.path;
  }

  return null;
}
```

### 6. 测试中的 Riverpod Provider 状态管理

**问题**: 测试中 Provider 状态在不同测试间可能互相影响

**解决方案**:
- 每个测试使用独立的 `ProviderContainer`
- 正确设置 `overrideWithValue` 和 `overrideWith`
- 使用 `await container.pump()` 确保状态更新完成

### 7. 表单验证状态管理

**问题**: 患者签约表单的复杂验证逻辑和状态管理

**解决方案**:
```dart
@freezed
class FormValidationState with _$FormValidationState {
  const factory FormValidationState({
    @Default({}) Map<String, String> errors,
    @Default(false) bool isValid,
  }) = _FormValidationState;
}
```

### 8. 异步操作的错误处理

**问题**: 网络请求失败、验证错误等各种异步操作的错误处理

**解决方案**:
- 使用 `Result<T, AppError>` 模式统一处理成功和失败状态
- 定义 `AppError` sealed class 覆盖所有错误类型
- 在 UI 层使用 `AsyncValue` 处理加载、成功、错误状态

### 9. 代码生成文件同步问题

**问题**: 修改 Freezed 模型后忘记运行代码生成，导致编译错误

**解决方案**:
- 建立开发流程：修改模型 → 运行 `flutter pub run build_runner build --delete-conflicting-outputs`
- 在 CI/CD 中自动检查代码生成文件是否最新

## 最佳实践

### 1. 领域驱动设计
- 领域实体不依赖外部框架
- 用例只依赖抽象接口，不依赖具体实现
- 保持业务逻辑纯净，易于测试

### 2. 状态管理
- 使用 Riverpod 的 `AsyncNotifier` 管理异步状态
- 避免使用已废弃的 `StateProvider` 和 `StateNotifierProvider`
- 状态类使用 Freezed 确保不可变性

### 3. 错误处理
- 统一错误类型定义 (`AppError`)
- UI 层使用 `SelectableText.rich` 显示错误，不使用 SnackBar
- 提供用户友好的错误信息

### 4. 测试策略
- 遵循 TDD 开发流程：先写测试，再写实现
- 每层独立测试：Unit Test（用例）、Integration Test（仓库）、Widget Test（UI）
- 使用 Mocktail 进行依赖模拟

### 5. 安全性
- 敏感信息存储在 `FlutterSecureStorage`
- Token 自动过期处理
- 输入验证和清理

## 性能优化

- 使用 `const` 构造函数优化 Widget 重建
- 合理使用 `select` 避免不必要的 Provider 监听
- 异步操作使用 `Completer` 避免重复请求

## 测试覆盖

当前 auth 模块测试覆盖情况：
- **Domain 层**: 100% 覆盖（用例测试）
- **Data 层**: 95+ % 覆盖（仓库和数据源测试）
- **Presentation 层**: 90+ % 覆盖（Provider 和 Widget 测试）
- **Integration**: 完整的端到端测试

## 未来改进

1. **生物识别认证**: 添加指纹/面部识别支持
2. **多因素认证**: SMS 验证码支持
3. **会话管理**: 更精细的会话超时控制
4. **缓存策略**: 优化用户数据本地缓存
5. **国际化**: 支持多语言错误信息

## 相关文档

- [Clean Architecture 指南](../../docs/architecture.md)
- [Riverpod 状态管理](../../docs/state-management.md)
- [测试策略](../../docs/testing.md)
- [API 接口文档](../../docs/api.md)
