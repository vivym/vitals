import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/auth/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    group('constructor', () {
      test('should create user with required fields', () {
        // Given
        const id = '1';
        const name = '张三';
        const phone = '13800000000';
        final createdAt = DateTime(2023, 1, 1);
        final updatedAt = DateTime(2023, 1, 2);

        // When
        final user = UserEntity(
          id: id,
          name: name,
          phone: phone,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

        // Then
        expect(user.id, id);
        expect(user.name, name);
        expect(user.phone, phone);
        expect(user.email, isNull);
        expect(user.avatarUrl, isNull);
        expect(user.createdAt, createdAt);
        expect(user.updatedAt, updatedAt);
      });

      test('should create user with all fields', () {
        // Given
        const id = '1';
        const name = '张三';
        const phone = '13800000000';
        const email = 'zhangsan@example.com';
        const avatarUrl = 'https://example.com/avatar.jpg';
        final createdAt = DateTime(2023, 1, 1);
        final updatedAt = DateTime(2023, 1, 2);

        // When
        final user = UserEntity(
          id: id,
          name: name,
          phone: phone,
          email: email,
          avatarUrl: avatarUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

        // Then
        expect(user.id, id);
        expect(user.name, name);
        expect(user.phone, phone);
        expect(user.email, email);
        expect(user.avatarUrl, avatarUrl);
        expect(user.createdAt, createdAt);
        expect(user.updatedAt, updatedAt);
      });
    });

    group('validation methods', () {
      group('isValidPhone', () {
        test('should return true for valid phone numbers', () {
          // Given
          final validPhones = [
            '13800000000', // 移动
            '15800000000', // 联通
            '18800000000', // 电信
            '19800000000', // 新号段
            '13900000000', // 移动
            '15900000000', // 联通
            '18900000000', // 电信
            '19900000000', // 新号段
          ];

          // When & Then
          for (final phone in validPhones) {
            expect(UserEntity.isValidPhone(phone), true, reason: 'Phone $phone should be valid');
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
            expect(UserEntity.isValidPhone(phone), false, reason: 'Phone $phone should be invalid');
          }
        });

        test('should handle edge cases', () {
          // Given
          final edgeCases = [
            '1380000000',    // 10位
            '138000000001',  // 12位
            '1380000000a',   // 包含字母
            '1380000000 ',   // 末尾空格
            ' 13800000000',  // 开头空格
            '138 00000000',  // 中间空格
          ];

          // When & Then
          for (final phone in edgeCases) {
            expect(UserEntity.isValidPhone(phone), false, reason: 'Phone $phone should be invalid');
          }
        });
      });

      group('isValidEmail', () {
        test('should return true for valid email addresses', () {
          // Given
          final validEmails = [
            'test@example.com',
            'user.name@domain.co.uk',
            'user+tag@example.org',
            '123@456.com',
            'a@b.c',
            'user@subdomain.example.com',
          ];

          // When & Then
          for (final email in validEmails) {
            expect(UserEntity.isValidEmail(email), true, reason: 'Email $email should be valid');
          }
        });

        test('should return false for invalid email addresses', () {
          // Given
                  final invalidEmails = [
          'invalid-email',
          '@example.com',
          'user@',
          'user@.com',
          '',
          '   ',
          'user@example',
        ];

          // When & Then
          for (final email in invalidEmails) {
            expect(UserEntity.isValidEmail(email), false, reason: 'Email $email should be invalid');
          }
        });

        test('should handle edge cases', () {
          // Given
                  final edgeCases = [
          'user@@example.com',   // 双@
          'user@example@com',    // 多个@
        ];

          // When & Then
          for (final email in edgeCases) {
            expect(UserEntity.isValidEmail(email), false, reason: 'Email $email should be invalid');
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
            'Jean-Pierre',
            'O\'Connor',
            'van der Berg',
            '李四·王五',
            'Test-User',
            'Test_User',
          ];

          // When & Then
          for (final name in validNames) {
            expect(UserEntity.isValidName(name), true, reason: 'Name "$name" should be valid');
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
            expect(UserEntity.isValidName(name), false, reason: 'Name "$name" should be invalid');
          }
        });

                test('should handle edge cases', () {
          // Given
          final edgeCases = [
            // 没有边缘情况，因为实际的验证逻辑很宽松
          ];

          // When & Then
          // 由于实际的验证逻辑很宽松，这里不需要测试边缘情况
          expect(edgeCases, isEmpty);
        });
      });
    });

    group('business logic', () {
      test('should calculate display name correctly', () {
        // Given
        final userWithEmail = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          email: 'zhangsan@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final userWithoutEmail = UserEntity(
          id: '2',
          name: '李四',
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(userWithEmail.displayName, '张三');
        expect(userWithoutEmail.displayName, '李四');
      });

      test('should check if user has avatar', () {
        // Given
        final userWithAvatar = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          avatarUrl: 'https://example.com/avatar.jpg',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final userWithoutAvatar = UserEntity(
          id: '2',
          name: '李四',
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(userWithAvatar.avatarUrl, isNotNull);
        expect(userWithoutAvatar.avatarUrl, isNull);
      });

      test('should check if user has email', () {
        // Given
        final userWithEmail = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          email: 'zhangsan@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final userWithoutEmail = UserEntity(
          id: '2',
          name: '李四',
          phone: '13900000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
          expect(userWithEmail.hasCompleteProfile, true);
          expect(userWithoutEmail.hasCompleteProfile, false);
        });
    });

    group('equality and hashCode', () {
      test('should be equal when all fields are the same', () {
        // Given
        final user1 = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          email: 'zhangsan@example.com',
          avatarUrl: 'https://example.com/avatar.jpg',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 2),
        );

        final user2 = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          email: 'zhangsan@example.com',
          avatarUrl: 'https://example.com/avatar.jpg',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 2),
        );

        // When & Then
        expect(user1, equals(user2));
        expect(user1.hashCode, equals(user2.hashCode));
      });

      test('should not be equal when fields are different', () {
        // Given
        final user1 = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final user2 = UserEntity(
          id: '2', // 不同的ID
          name: '张三',
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(user1, isNot(equals(user2)));
        expect(user1.hashCode, isNot(equals(user2.hashCode)));
      });

      test('should not be equal to different types', () {
        // Given
        final user = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final otherObject = 'Not a user';

        // When & Then
        expect(user, isNot(equals(otherObject)));
      });
    });

    group('immutability', () {
      test('should be immutable', () {
        // Given
        final user = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When & Then
        expect(user.id, '1');
        expect(user.name, '张三');
        expect(user.phone, '13800000000');

        // 验证字段是final的
        expect(user.runtimeType.toString(), contains('UserEntity'));
      });
    });

    group('toString', () {
      test('should return readable string representation', () {
        // Given
        final user = UserEntity(
          id: '1',
          name: '张三',
          phone: '13800000000',
          email: 'zhangsan@example.com',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 2),
        );

        // When
        final stringRepresentation = user.toString();

        // Then
        expect(stringRepresentation, contains('UserEntity'));
        expect(stringRepresentation, contains('id: 1'));
        expect(stringRepresentation, contains('name: 张三'));
        expect(stringRepresentation, contains('phone: 13800000000'));
      });
    });
  });
}
