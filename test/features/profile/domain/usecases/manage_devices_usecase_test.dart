import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/features/profile/domain/usecases/manage_devices_usecase.dart';
import 'package:vitals/features/profile/domain/repositories/profile_repository.dart';
import 'package:vitals/features/profile/domain/entities/connected_device_entity.dart';
import 'package:vitals/core/errors/app_error.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}
class FakeConnectedDeviceEntity extends Fake implements ConnectedDeviceEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeConnectedDeviceEntity());
  });
  group('ManageDevicesUsecase', () {
    late MockProfileRepository mockRepository;
    late ManageDevicesUsecase usecase;

    setUp(() {
      mockRepository = MockProfileRepository();
      usecase = ManageDevicesUsecase(mockRepository);
    });

    group('getConnectedDevices', () {
      test('should get connected devices successfully', () async {
        // Given
        const devices = [
          ConnectedDeviceEntity(
            id: 'device_1',
            name: '华为手环',
            type: DeviceType.fitnessTracker,
            status: DeviceStatus.connected,
          ),
          ConnectedDeviceEntity(
            id: 'device_2',
            name: '小米体重秤',
            type: DeviceType.smartScale,
            status: DeviceStatus.disconnected,
          ),
        ];

        when(() => mockRepository.getConnectedDevices('user_1'))
            .thenAnswer((_) async => const Result.success(devices));

        // When
        final result = await usecase.getConnectedDevices('user_1');

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (deviceList) {
            expect(deviceList.length, 2);
            expect(deviceList.first.name, '华为手环');
            expect(deviceList.first.type, DeviceType.fitnessTracker);
            expect(deviceList.first.status, DeviceStatus.connected);
          },
          failure: (_) => fail('Expected success'),
        );
      });
    });

    group('connectDevice', () {
      test('should connect device successfully', () async {
        // Given
        const device = ConnectedDeviceEntity(
          id: 'device_1',
          name: '华为手环',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connecting,
          macAddress: '00:11:22:33:44:55',
        );

        const connectedDevice = ConnectedDeviceEntity(
          id: 'device_1',
          name: '华为手环',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connected,
          macAddress: '00:11:22:33:44:55',
        );

        when(() => mockRepository.getConnectedDevices('user_1'))
            .thenAnswer((_) async => const Result.success([]));

        when(() => mockRepository.connectDevice('user_1', device))
            .thenAnswer((_) async => const Result.success(connectedDevice));

        // When
        final result = await usecase.connectDevice('user_1', device);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (resultDevice) {
            expect(resultDevice.name, '华为手环');
            expect(resultDevice.status, DeviceStatus.connected);
          },
          failure: (_) => fail('Expected success'),
        );
      });

      test('should validate device name', () async {
        // Given - device with empty name
        const invalidDevice = ConnectedDeviceEntity(
          id: 'device_1',
          name: '',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connecting,
        );

        // When
        final result = await usecase.connectDevice('user_1', invalidDevice);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              validation: (field, message) => {
                expect(field, 'name'),
                expect(message, '设备名称不能为空'),
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.connectDevice(any(), any()));
      });

      test('should validate MAC address format', () async {
        // Given - device with invalid MAC address
        const invalidDevice = ConnectedDeviceEntity(
          id: 'device_1',
          name: '华为手环',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connecting,
          macAddress: 'invalid-mac',
        );

        // When
        final result = await usecase.connectDevice('user_1', invalidDevice);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              validation: (field, message) => {
                expect(field, 'macAddress'),
                expect(message, 'MAC地址格式不正确'),
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.connectDevice(any(), any()));
      });

      test('should allow valid MAC address formats', () async {
        // Given - device with valid MAC address
        const validDevice = ConnectedDeviceEntity(
          id: 'device_1',
          name: '华为手环',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connecting,
          macAddress: '00:11:22:33:44:55',
        );

        when(() => mockRepository.getConnectedDevices('user_1'))
            .thenAnswer((_) async => const Result.success([]));

        when(() => mockRepository.connectDevice('user_1', validDevice))
            .thenAnswer((_) async => const Result.success(validDevice));

        // When
        final result = await usecase.connectDevice('user_1', validDevice);

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRepository.connectDevice('user_1', validDevice)).called(1);
      });

      test('should prevent duplicate device connection', () async {
        // Given - existing device with same MAC address
        const existingDevice = ConnectedDeviceEntity(
          id: 'device_1',
          name: '华为手环',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connected,
          macAddress: '00:11:22:33:44:55',
        );

        const newDevice = ConnectedDeviceEntity(
          id: 'device_2',
          name: '华为手环2',
          type: DeviceType.fitnessTracker,
          status: DeviceStatus.connecting,
          macAddress: '00:11:22:33:44:55',
        );

        when(() => mockRepository.getConnectedDevices('user_1'))
            .thenAnswer((_) async => const Result.success([existingDevice]));

        // When
        final result = await usecase.connectDevice('user_1', newDevice);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              validation: (field, message) => {
                expect(field, 'device'),
                expect(message, '该设备已经连接'),
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.connectDevice(any(), any()));
      });
    });

    group('disconnectDevice', () {
      test('should disconnect device successfully', () async {
        // When
        when(() => mockRepository.disconnectDevice('user_1', 'device_1'))
            .thenAnswer((_) async => const Result.success(null));

        final result = await usecase.disconnectDevice('user_1', 'device_1');

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRepository.disconnectDevice('user_1', 'device_1')).called(1);
      });

      test('should validate device id', () async {
        // When
        final result = await usecase.disconnectDevice('user_1', '');

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              validation: (field, message) => {
                expect(field, 'deviceId'),
                expect(message, '设备ID不能为空'),
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.disconnectDevice(any(), any()));
      });
    });

    group('syncDeviceData', () {
      test('should sync device data successfully', () async {
        // When
        when(() => mockRepository.syncDeviceData('user_1', 'device_1'))
            .thenAnswer((_) async => const Result.success(null));

        final result = await usecase.syncDeviceData('user_1', 'device_1');

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRepository.syncDeviceData('user_1', 'device_1')).called(1);
      });

      test('should validate device id', () async {
        // When
        final result = await usecase.syncDeviceData('user_1', '');

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              validation: (field, message) => {
                expect(field, 'deviceId'),
                expect(message, '设备ID不能为空'),
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.syncDeviceData(any(), any()));
      });
    });
  });
}
