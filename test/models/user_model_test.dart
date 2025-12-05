import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/user_model.dart';

void main() {
  group('UserModel Tests', () {
    test('should create a UserModel instance with all required fields', () {
      // Arrange
      final createdAt = DateTime.now();
      final lastLoginAt = DateTime.now();

      final userModel = UserModel(
        uid: 'test_uid_123',
        email: 'test@example.com',
        displayName: 'Test User',
        photoURL: 'https://example.com/photo.jpg',
        createdAt: createdAt,
        lastLoginAt: lastLoginAt,
        favoriteProducts: ['product_1', 'product_2'],
        shippingAddress: {
          'street': '123 Test Street',
          'city': 'Test City',
          'zip': '12345'
        },
        emailVerified: true,
      );

      // Assert
      expect(userModel.uid, 'test_uid_123');
      expect(userModel.email, 'test@example.com');
      expect(userModel.displayName, 'Test User');
      expect(userModel.photoURL, 'https://example.com/photo.jpg');
      expect(userModel.createdAt, createdAt);
      expect(userModel.lastLoginAt, lastLoginAt);
      expect(userModel.favoriteProducts, ['product_1', 'product_2']);
      expect(userModel.shippingAddress!['street'], '123 Test Street');
      expect(userModel.emailVerified, true);
    });

    test('should create UserModel with minimal required fields', () {
      // Arrange
      final createdAt = DateTime.now();

      final userModel = UserModel(
        uid: 'test_uid_minimal',
        email: 'minimal@example.com',
        displayName: 'Minimal User',
        createdAt: createdAt,
      );

      // Assert
      expect(userModel.uid, 'test_uid_minimal');
      expect(userModel.email, 'minimal@example.com');
      expect(userModel.displayName, 'Minimal User');
      expect(userModel.photoURL, isNull);
      expect(userModel.lastLoginAt, isNull);
      expect(userModel.favoriteProducts, isEmpty);
      expect(userModel.shippingAddress, isNull);
      expect(userModel.emailVerified, false);
    });
    test('should convert to Map correctly', () {
      // Arrange
      final userModel = UserModel(
        uid: 'test_uid',
        email: 'test@example.com',
        displayName: 'Test User',
        photoURL: 'https://example.com/photo.jpg',
        createdAt: DateTime.now(),
        favoriteProducts: ['product_1'],
        shippingAddress: {'street': '123 Test St'},
        emailVerified: true,
      );

      // Act
      final userMap = userModel.toMap();

      // Assert
      expect(userMap['email'], 'test@example.com');
      expect(userMap['displayName'], 'Test User');
      expect(userMap['photoURL'], 'https://example.com/photo.jpg');
      expect(userMap['favoriteProducts'], ['product_1']);
      expect(userMap['shippingAddress'], {'street': '123 Test St'});
      expect(userMap['emailVerified'], true);
      // Note: uid is not included in toMap() as it's handled separately in Firestore
      expect(userMap.containsKey('uid'), false);
    });
    test('should copy with new values correctly', () {
      // Arrange
      final originalUser = UserModel(
        uid: 'test_uid',
        email: 'test@example.com',
        displayName: 'Original Name',
        createdAt: DateTime.now(),
        favoriteProducts: ['product_1'],
        emailVerified: false,
      );

      // Act
      final updatedUser = originalUser.copyWith(
        displayName: 'Updated Name',
        favoriteProducts: ['product_1', 'product_2'],
        emailVerified: true,
      );

      // Assert
      expect(updatedUser.uid, originalUser.uid);
      expect(updatedUser.email, originalUser.email);
      expect(updatedUser.displayName, 'Updated Name');
      expect(updatedUser.favoriteProducts, ['product_1', 'product_2']);
      expect(updatedUser.emailVerified, true);
    });

    test('should handle equality correctly', () {
      // Arrange
      final createdAt = DateTime.now();

      final user1 = UserModel(
        uid: 'same_uid',
        email: 'test@example.com',
        displayName: 'Test User',
        createdAt: createdAt,
      );

      final user2 = UserModel(
        uid: 'same_uid',
        email: 'test@example.com',
        displayName: 'Test User',
        createdAt: createdAt,
      );

      final user3 = UserModel(
        uid: 'different_uid',
        email: 'jane@example.com',
        displayName: 'Jane Doe',
        createdAt: createdAt,
      );

      // Assert
      expect(user1.uid, equals(user2.uid));
      expect(user1.uid, isNot(equals(user3.uid)));
    });

    test('should handle favorite products operations', () {
      // Arrange
      final user = UserModel(
        uid: 'test_uid',
        email: 'test@example.com',
        displayName: 'Test User',
        createdAt: DateTime.now(),
        favoriteProducts: ['product_1'],
      );

      // Act - Add a product
      final updatedUser = user.copyWith(
        favoriteProducts: [...user.favoriteProducts, 'product_2'],
      );

      // Assert
      expect(updatedUser.favoriteProducts, contains('product_1'));
      expect(updatedUser.favoriteProducts, contains('product_2'));
      expect(updatedUser.favoriteProducts.length, 2);
    });

    test('should handle shipping address updates', () {
      // Arrange
      final user = UserModel(
        uid: 'test_uid',
        email: 'test@example.com',
        displayName: 'Test User',
        createdAt: DateTime.now(),
      );

      final shippingAddress = {
        'street': '123 Test Street',
        'city': 'Portsmouth',
        'zip': 'PO1 2AB',
        'country': 'UK',
      };

      // Act
      final updatedUser = user.copyWith(shippingAddress: shippingAddress);

      // Assert
      expect(updatedUser.shippingAddress, isNotNull);
      expect(updatedUser.shippingAddress!['street'], '123 Test Street');
      expect(updatedUser.shippingAddress!['city'], 'Portsmouth');
      expect(updatedUser.shippingAddress!['zip'], 'PO1 2AB');
    });
  });
}
