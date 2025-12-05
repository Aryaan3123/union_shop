// import 'package:flutter_test/flutter_test.dart';
// import 'package:union_shop/providers/auth_provider.dart';
// import 'package:union_shop/models/user_model.dart';

// void main() {
//   group('AuthProvider Tests', () {
//     late AuthProvider authProvider;

//     setUp(() {
//       authProvider = AuthProvider();
//     });

//     test('should initialize with default values', () {
//       // Assert
//       expect(authProvider.user, isNull);
//       expect(authProvider.isAuthenticated, false);
//       expect(authProvider.isLoading, false);
//     });

//     test('should handle loading state correctly', () {
//       // Act
//       authProvider.setLoading(true);

//       // Assert
//       expect(authProvider.isLoading, true);

//       // Act
//       authProvider.setLoading(false);

//       // Assert
//       expect(authProvider.isLoading, false);
//     });

//     test('should handle user authentication state', () {
//       // Arrange
//       final testUser = UserModel(
//         uid: 'test_uid',
//         email: 'test@example.com',
//         displayName: 'Test User',
//         createdAt: DateTime.now(),
//       );

//       // Act
//       authProvider.setUser(testUser);

//       // Assert
//       expect(authProvider.user, equals(testUser));
//       expect(authProvider.isAuthenticated, true);
//     });

//     test('should handle user sign out', () {
//       // Arrange
//       final testUser = UserModel(
//         uid: 'test_uid',
//         email: 'test@example.com',
//         displayName: 'Test User',
//         createdAt: DateTime.now(),
//       );
//       authProvider.setUser(testUser);

//       // Act
//       authProvider.signOut();

//       // Assert
//       expect(authProvider.user, isNull);
//       expect(authProvider.isAuthenticated, false);
//     });

//     test('should handle error states properly', () {
//       // Act & Assert - Should not throw errors during normal operations
//       expect(() => authProvider.setLoading(true), returnsNormally);
//       expect(() => authProvider.setLoading(false), returnsNormally);
//       expect(() => authProvider.signOut(), returnsNormally);
//     });

//     test('should notify listeners on state changes', () {
//       // Arrange
//       int listenerCallCount = 0;
//       authProvider.addListener(() {
//         listenerCallCount++;
//       });

//       // Act
//       authProvider.setLoading(true);
//       authProvider.setLoading(false);

//       // Assert
//       expect(listenerCallCount, greaterThan(0));
//     });
//   });
// }
