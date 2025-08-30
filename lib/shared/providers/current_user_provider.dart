import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';

part 'current_user_provider.g.dart';

/// 当前用户提供者
/// 这是一个简单的状态提供者，用于存储当前登录的用户信息
@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    print('👤 CurrentUser.build() - 初始化状态: null');
    return null; // 初始状态为未登录
  }

  /// 设置当前用户
  void setUser(User user) {
    print('👤 CurrentUser.setUser() - 设置用户: ${user.name} (${user.id})');
    state = user;
  }

  /// 清除当前用户（登出）
  void clearUser() {
    print('👤 CurrentUser.clearUser() - 清除用户');
    state = null;
  }

  /// 更新用户信息
  void updateUser(User updatedUser) {
    state = updatedUser;
  }
}

/// 当前用户状态的便捷访问
@riverpod
User? currentUserState(CurrentUserStateRef ref) {
  return ref.watch(currentUserProvider);
}
