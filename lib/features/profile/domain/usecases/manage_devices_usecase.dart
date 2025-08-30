import '../../../../core/errors/app_error.dart';
import '../entities/connected_device_entity.dart';
import '../repositories/profile_repository.dart';

/// 设备管理用例

class ManageDevicesUsecase {
  final ProfileRepository _repository;

  ManageDevicesUsecase(this._repository);

  /// 获取连接的设备列表
  Future<Result<List<ConnectedDeviceEntity>, AppError>> getConnectedDevices(
    String userId,
  ) async {
    try {
      return await _repository.getConnectedDevices(userId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '获取设备列表失败: ${e.toString()}'),
      );
    }
  }

  /// 连接新设备
  Future<Result<ConnectedDeviceEntity, AppError>> connectDevice(
    String userId,
    ConnectedDeviceEntity device,
  ) async {
    try {
      // 验证设备信息
      final validationResult = _validateDevice(device);
      if (validationResult.isFailure) {
        return validationResult.cast<ConnectedDeviceEntity>();
      }

      // 检查设备是否已连接
      final existingDevicesResult = await _repository.getConnectedDevices(userId);
      if (existingDevicesResult.isSuccess) {
        final existingDevices = existingDevicesResult.data;
        final duplicateDevice = existingDevices.any((d) =>
          d.macAddress?.toLowerCase() == device.macAddress?.toLowerCase() ||
          (d.name == device.name && d.type == device.type)
        );

        if (duplicateDevice) {
          return Result.failure(
            AppError.validation(field: 'device', message: '该设备已经连接'),
          );
        }
      }

      return await _repository.connectDevice(userId, device);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '连接设备失败: ${e.toString()}'),
      );
    }
  }

  /// 断开设备连接
  Future<Result<void, AppError>> disconnectDevice(
    String userId,
    String deviceId,
  ) async {
    try {
      if (deviceId.trim().isEmpty) {
        return Result.failure(
          AppError.validation(field: 'deviceId', message: '设备ID不能为空'),
        );
      }

      return await _repository.disconnectDevice(userId, deviceId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '断开设备连接失败: ${e.toString()}'),
      );
    }
  }

  /// 同步设备数据
  Future<Result<void, AppError>> syncDeviceData(
    String userId,
    String deviceId,
  ) async {
    try {
      if (deviceId.trim().isEmpty) {
        return Result.failure(
          AppError.validation(field: 'deviceId', message: '设备ID不能为空'),
        );
      }

      return await _repository.syncDeviceData(userId, deviceId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '同步设备数据失败: ${e.toString()}'),
      );
    }
  }

  /// 验证设备信息
  Result<void, AppError> _validateDevice(ConnectedDeviceEntity device) {
    if (device.name.trim().isEmpty) {
              return Result.failure(
          AppError.validation(field: 'name', message: '设备名称不能为空'),
        );
    }

    // 验证MAC地址格式（如果提供）
    if (device.macAddress != null && device.macAddress!.trim().isNotEmpty) {
      final macRegex = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
      if (!macRegex.hasMatch(device.macAddress!.trim())) {
        return Result.failure(
          AppError.validation(field: 'macAddress', message: 'MAC地址格式不正确'),
        );
      }
    }

    return const Result.success(null);
  }
}
