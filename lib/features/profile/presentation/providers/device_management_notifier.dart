import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/profile_state.dart';
import '../../data/models/connected_device.dart';
import '../../data/providers/profile_providers.dart';

part 'device_management_notifier.g.dart';

/// 设备管理状态
@riverpod
class DeviceManagementNotifier extends _$DeviceManagementNotifier {
  @override
  AsyncValue<DeviceManagementState> build() {
    _loadDevices();
    return const AsyncValue.loading();
  }

  Future<void> connectDevice(DeviceType deviceType) async {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(
        isConnecting: true,
        connectingDeviceId: deviceType.name,
      ));
    });

    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.connectDevice(deviceType, {});

    result.when(
      success: (device) {
        state.whenData((currentState) {
          final updatedDevices = [...currentState.connectedDevices, device];
          state = AsyncValue.data(currentState.copyWith(
            connectedDevices: updatedDevices,
            isConnecting: false,
            connectingDeviceId: null,
          ));
        });
      },
      failure: (error) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            isConnecting: false,
            connectingDeviceId: null,
            error: error.toString(),
          ));
        });
      },
    );
  }

  Future<void> _loadDevices() async {
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.getConnectedDevices();

    result.when(
      success: (devices) {
        state = AsyncValue.data(DeviceManagementState(
          connectedDevices: devices,
          availableDevices: DeviceType.values,
        ));
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}
