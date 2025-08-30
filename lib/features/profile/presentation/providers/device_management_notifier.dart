import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../domain/entities/connected_device_entity.dart';
import 'profile_providers.dart';

part 'device_management_notifier.freezed.dart';
part 'device_management_notifier.g.dart';

/// 设备管理状态
@freezed
abstract class DeviceManagementState with _$DeviceManagementState {
  const factory DeviceManagementState({
    @Default([]) List<ConnectedDeviceEntity> connectedDevices,
    @Default(false) bool isLoading,
    @Default(false) bool isConnecting,
    String? connectingDeviceId,
    String? error,
  }) = _DeviceManagementState;
}

/// 设备管理状态管理
@riverpod
class DeviceManagementNotifier extends _$DeviceManagementNotifier {
  @override
  DeviceManagementState build() {
    _loadDevices();
    return const DeviceManagementState(isLoading: true);
  }

  /// 连接设备
  Future<void> connectDevice(ConnectedDeviceEntity device) async {
    state = state.copyWith(
      isConnecting: true,
      connectingDeviceId: device.id,
      error: null,
    );

    final usecase = ref.read(manageDevicesUsecaseProvider);
    final result = await usecase.connectDevice('user_id', device); // TODO: 获取实际用户ID

    result.when(
      success: (connectedDevice) {
        final updatedDevices = [...state.connectedDevices, connectedDevice];
        state = state.copyWith(
          connectedDevices: updatedDevices,
          isConnecting: false,
          connectingDeviceId: null,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isConnecting: false,
          connectingDeviceId: null,
          error: error.toString(),
        );
      },
    );
  }

  /// 断开设备连接
  Future<void> disconnectDevice(String deviceId) async {
    final usecase = ref.read(manageDevicesUsecaseProvider);
    final result = await usecase.disconnectDevice('user_id', deviceId); // TODO: 获取实际用户ID

    result.when(
      success: (_) {
        final updatedDevices = state.connectedDevices
            .where((device) => device.id != deviceId)
            .toList();
        state = state.copyWith(
          connectedDevices: updatedDevices,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(error: error.toString());
      },
    );
  }

  /// 同步设备数据
  Future<void> syncDeviceData(String deviceId) async {
    final usecase = ref.read(manageDevicesUsecaseProvider);
    final result = await usecase.syncDeviceData('user_id', deviceId); // TODO: 获取实际用户ID

    result.when(
      success: (_) {
        // 同步成功，可以显示提示信息
        state = state.copyWith(error: null);
      },
      failure: (error) {
        state = state.copyWith(error: error.toString());
      },
    );
  }

  /// 清除错误信息
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// 加载设备列表
  Future<void> _loadDevices() async {
    state = state.copyWith(isLoading: true, error: null);

    final usecase = ref.read(manageDevicesUsecaseProvider);
    final result = await usecase.getConnectedDevices('user_id'); // TODO: 获取实际用户ID

    result.when(
      success: (devices) {
        state = state.copyWith(
          connectedDevices: devices,
          isLoading: false,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.toString(),
        );
      },
    );
  }

  /// 刷新设备列表
  Future<void> refresh() async {
    await _loadDevices();
  }
}