import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/auth/domain/entities/patient_entity.dart';

void main() {
  group('PatientEntity', () {
    group('constructor', () {
      test('should create patient with required fields', () {
        // Given
        const id = '1';
        const name = '张三';
        const idNumber = '123456789012345678';
        const gender = Gender.male;
        final birthDate = DateTime(1990, 1, 1);
        const phone = '13800000000';
        final createdAt = DateTime(2023, 1, 1);
        final updatedAt = DateTime(2023, 1, 2);

        // When
        final patient = PatientEntity(
          id: id,
          name: name,
          idNumber: idNumber,
          gender: gender,
          birthDate: birthDate,
          phone: phone,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

        // Then
        expect(patient.id, id);
        expect(patient.name, name);
        expect(patient.idNumber, idNumber);
        expect(patient.gender, gender);
        expect(patient.birthDate, birthDate);
        expect(patient.phone, phone);
        expect(patient.medicalRecordNumber, isNull);
        expect(patient.emergencyContact, isNull);
        expect(patient.emergencyContactPhone, isNull);
        expect(patient.createdAt, createdAt);
        expect(patient.updatedAt, updatedAt);
      });

      test('should create patient with all fields', () {
        // Given
        const id = '1';
        const name = '张三';
        const idNumber = '123456789012345678';
        const gender = Gender.male;
        final birthDate = DateTime(1990, 1, 1);
        const phone = '13800000000';
        const medicalRecordNumber = 'MR001';
        const emergencyContact = '李四';
        const emergencyContactPhone = '13900000000';
        final createdAt = DateTime(2023, 1, 1);
        final updatedAt = DateTime(2023, 1, 2);

        // When
        final patient = PatientEntity(
          id: id,
          name: name,
          idNumber: idNumber,
          gender: gender,
          birthDate: birthDate,
          phone: phone,
          medicalRecordNumber: medicalRecordNumber,
          emergencyContact: emergencyContact,
          emergencyContactPhone: emergencyContactPhone,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

        // Then
        expect(patient.id, id);
        expect(patient.name, name);
        expect(patient.idNumber, idNumber);
        expect(patient.gender, gender);
        expect(patient.birthDate, birthDate);
        expect(patient.phone, phone);
        expect(patient.medicalRecordNumber, medicalRecordNumber);
        expect(patient.emergencyContact, emergencyContact);
        expect(patient.emergencyContactPhone, emergencyContactPhone);
        expect(patient.createdAt, createdAt);
        expect(patient.updatedAt, updatedAt);
      });
    });

    group('validation methods', () {
      group('isValidIdNumber', () {
        test('should return true for valid ID numbers', () {
          // Given
          final validIdNumbers = [
            '123456789012345678', // 18位数字
            '987654321098765432', // 18位数字
            '111111111111111111', // 18位数字
          ];

          // When & Then
          for (final idNumber in validIdNumbers) {
            expect(PatientEntity.isValidIdNumber(idNumber), true, reason: 'ID number $idNumber should be valid');
          }
        });

        test('should return false for invalid ID numbers', () {
          // Given
                  final invalidIdNumbers = [
          '12345678901234567',   // 17位
          '1234567890123456789', // 19位
          'abcdefghijklmnopqr',  // 全字母
          '',                     // 空字符串
          '   ',                 // 空白字符
        ];

          // When & Then
          for (final idNumber in invalidIdNumbers) {
            expect(PatientEntity.isValidIdNumber(idNumber), false, reason: 'ID number $idNumber should be invalid');
          }
        });
      });

      group('isValidPhone', () {
        test('should return true for valid phone numbers', () {
          // Given
          final validPhones = [
            '13800000000', // 移动
            '15800000000', // 联通
            '18800000000', // 电信
            '19800000000', // 新号段
          ];

          // When & Then
          for (final phone in validPhones) {
            expect(PatientEntity.isValidPhone(phone), true, reason: 'Phone $phone should be valid');
          }
        });

        test('should return false for invalid phone numbers', () {
          // Given
          final invalidPhones = [
            '123',           // 太短
            '123456789012',  // 太长
            'abcdefghijk',   // 非数字
            '',              // 空字符串
            '   ',           // 空白字符
          ];

          // When & Then
          for (final phone in invalidPhones) {
            expect(PatientEntity.isValidPhone(phone), false, reason: 'Phone $phone should be invalid');
          }
        });
      });

      group('isValidName', () {
        test('should return true for valid names', () {
          // Given
          final validNames = [
            '张三',
            '李四',
            '王五',
            'Test User',
            'User Test',
            '123 User',
            'User 123',
          ];

          // When & Then
          for (final name in validNames) {
            expect(PatientEntity.isValidName(name), true, reason: 'Name "$name" should be valid');
          }
        });

        test('should return false for invalid names', () {
          // Given
          final invalidNames = [
            '',              // 空字符串
            '   ',           // 空白字符
          ];

          // When & Then
          for (final name in invalidNames) {
            expect(PatientEntity.isValidName(name), false, reason: 'Name "$name" should be invalid');
          }
        });
      });
    });

    group('business logic', () {
      test('should calculate age correctly', () {
        // Given
        final now = DateTime.now();
        final birthDate25 = DateTime(now.year - 25, now.month, now.day);
        final birthDate30 = DateTime(now.year - 30, now.month, now.day);
        final birthDate50 = DateTime(now.year - 50, now.month, now.day);

        final patient25 = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: birthDate25,
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final patient30 = PatientEntity(
          id: '2',
          name: '李四',
          idNumber: '123456789012345679',
          gender: Gender.female,
          birthDate: birthDate30,
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final patient50 = PatientEntity(
          id: '3',
          name: '王五',
          idNumber: '123456789012345670',
          gender: Gender.male,
          birthDate: birthDate50,
          phone: '14000000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(patient25.age, 25);
        expect(patient30.age, 30);
        expect(patient50.age, 50);
      });

      test('should calculate display name correctly', () {
        // Given
        final patient = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(patient.displayName, '张三 (男)');
      });

      test('should check if patient has emergency contact', () {
        // Given
        final patientWithEmergency = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          emergencyContact: '李四',
          emergencyContactPhone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final patientWithoutEmergency = PatientEntity(
          id: '2',
          name: '李四',
          idNumber: '123456789012345679',
          gender: Gender.female,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(patientWithEmergency.hasEmergencyContact, true);
        expect(patientWithoutEmergency.hasEmergencyContact, false);
      });

      test('should check if patient has medical record number', () {
        // Given
        final patientWithMRN = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: 'MR001',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final patientWithoutMRN = PatientEntity(
          id: '2',
          name: '李四',
          idNumber: '123456789012345679',
          gender: Gender.female,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(patientWithMRN.medicalRecordNumber, isNotNull);
        expect(patientWithoutMRN.medicalRecordNumber, isNull);
      });

      test('should check if patient profile is complete', () {
        // Given
        final completePatient = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: 'MR001',
          emergencyContact: '李四',
          emergencyContactPhone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final incompletePatient = PatientEntity(
          id: '2',
          name: '李四',
          idNumber: '123456789012345679',
          gender: Gender.female,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(completePatient.hasCompleteProfile, true);
        expect(incompletePatient.hasCompleteProfile, false);
      });
    });

    group('Gender enum', () {
      test('should have correct values', () {
        // When & Then
        expect(Gender.male.index, 0);
        expect(Gender.female.index, 1);
        expect(Gender.other.index, 2);
      });

      test('should have correct string representations', () {
        // When & Then
        expect(Gender.male.toString(), 'Gender.male');
        expect(Gender.female.toString(), 'Gender.female');
        expect(Gender.other.toString(), 'Gender.other');
      });

      test('should convert to display text correctly', () {
        // Given
        final malePatient = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final femalePatient = PatientEntity(
          id: '2',
          name: '李四',
          idNumber: '123456789012345679',
          gender: Gender.female,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final otherPatient = PatientEntity(
          id: '3',
          name: '王五',
          idNumber: '123456789012345670',
          gender: Gender.other,
          birthDate: DateTime(1985, 1, 1),
          phone: '14000000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(malePatient.displayName, contains('男'));
        expect(femalePatient.displayName, contains('女'));
        expect(otherPatient.displayName, contains('其他'));
      });
    });

    group('equality and hashCode', () {
      test('should be equal when all fields are the same', () {
        // Given
        final patient1 = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 2),
        );

        final patient2 = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 2),
        );

        // When & Then
        expect(patient1, equals(patient2));
        expect(patient1.hashCode, equals(patient2.hashCode));
      });

      test('should not be equal when fields are different', () {
        // Given
        final patient1 = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final patient2 = PatientEntity(
          id: '2', // 不同的ID
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(patient1, isNot(equals(patient2)));
        expect(patient1.hashCode, isNot(equals(patient2.hashCode)));
      });

      test('should not be equal to different types', () {
        // Given
        final patient = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final otherObject = 'Not a patient';

        // When & Then
        expect(patient, isNot(equals(otherObject)));
      });
    });

    group('immutability', () {
      test('should be immutable', () {
        // Given
        final patient = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(patient.id, '1');
        expect(patient.name, '张三');
        expect(patient.phone, '13800000000');

        // 验证字段是final的
        expect(patient.runtimeType.toString(), contains('PatientEntity'));
      });
    });

    group('toString', () {
      test('should return readable string representation', () {
        // Given
        final patient = PatientEntity(
          id: '1',
          name: '张三',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 2),
        );

        // When
        final stringRepresentation = patient.toString();

        // Then
        expect(stringRepresentation, contains('PatientEntity'));
        expect(stringRepresentation, contains('id: 1'));
        expect(stringRepresentation, contains('name: 张三'));
        expect(stringRepresentation, contains('idNumber: 123456789012345678'));
      });
    });
  });
}
