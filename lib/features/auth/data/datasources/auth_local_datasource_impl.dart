import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_local_datasource.dart';
import '../models/user.dart';

/// 认证本地数据源实现
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  static const String _keyToken = 'auth_token';
  static const String _keyUser = 'cached_user';
  static const String _keyTermsAgreed = 'terms_agreed';

  AuthLocalDataSourceImpl(this._prefs, this._secureStorage);

  @override
  Future<String?> getAuthToken() async {
    try {
      return await _secureStorage.read(key: _keyToken);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(key: _keyToken, value: token);
  }

  @override
  Future<void> removeAuthToken() async {
    await _secureStorage.delete(key: _keyToken);
  }

  @override
  Future<User?> getCachedUser() async {
    try {
      final userJson = _prefs.getString(_keyUser);
      if (userJson != null) {
        return User.fromJson(jsonDecode(userJson));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveCachedUser(User user) async {
    await _prefs.setString(_keyUser, jsonEncode(user.toJson()));
  }

  @override
  Future<void> removeCachedUser() async {
    await _prefs.remove(_keyUser);
  }

  @override
  Future<bool> hasAgreedToTerms() async {
    return _prefs.getBool(_keyTermsAgreed) ?? false;
  }

  @override
  Future<void> saveTermsAgreement(bool agreed) async {
    await _prefs.setBool(_keyTermsAgreed, agreed);
  }
}
