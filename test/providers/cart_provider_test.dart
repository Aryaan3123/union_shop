// import 'package:flutter_test/flutter_test.dart';
// import 'package:union_shop/providers/cart_provider.dart';
// import 'package:union_shop/models/cart_item.dart';
// import 'package:union_shop/models/product.dart';

// void main() {
//   group('CartProvider Tests', () {
//     late CartProvider cartProvider;
//     late Product testProduct;

//     setUp(() {
//       cartProvider = CartProvider();
//       testProduct = Product(
//         id: 'test_product_1',
//         title: 'Test Product',
//         price: 25.99,
//         imageUrl: 'https://example.com/image.jpg',
//         category: 'Test Category',
//         description: 'Test Description',
//       );
//     });

//     test('should initialize with empty cart', () {
//       // Assert
//       expect(cartProvider.items, isEmpty);
//       expect(cartProvider.totalAmount, 0.0);
//       expect(cartProvider.itemCount, 0);
//     });

//     test('should add item to cart', () {
//       // Act
//       cartProvider.addItem(testProduct, 'Red', 'M');

//       // Assert
//       expect(cartProvider.items.length, 1);
//       expect(cartProvider.itemCount, 1);
//       expect(cartProvider.totalAmount, testProduct.price);
//     });

//     test('should increase quantity when same item added', () {
//       // Arrange
//       cartProvider.addItem(testProduct, 'Red', 'M');

//       // Act
//       cartProvider.addItem(testProduct, 'Red', 'M');

//       // Assert
//       expect(cartProvider.items.length, 1);
//       expect(cartProvider.itemCount, 2);
//       expect(cartProvider.totalAmount, testProduct.price * 2);
//     });

//     test('should add different variants as separate items', () {
//       // Act
//       cartProvider.addItem(testProduct, 'Red', 'M');
//       cartProvider.addItem(testProduct, 'Blue', 'L');

//       // Assert
//       expect(cartProvider.items.length, 2);
//       expect(cartProvider.itemCount, 2);
//     });

//     test('should remove item from cart', () {
//       // Arrange
//       cartProvider.addItem(testProduct, 'Red', 'M');
//       final cartItemId = cartProvider.items.keys.first;

//       // Act
//       cartProvider.removeItem(cartItemId);

//       // Assert
//       expect(cartProvider.items, isEmpty);
//       expect(cartProvider.totalAmount, 0.0);
//     });

//     test('should clear entire cart', () {
//       // Arrange
//       cartProvider.addItem(testProduct, 'Red', 'M');
//       cartProvider.addItem(testProduct, 'Blue', 'L');

//       // Act
//       cartProvider.clearCart();

//       // Assert
//       expect(cartProvider.items, isEmpty);
//       expect(cartProvider.totalAmount, 0.0);
//       expect(cartProvider.itemCount, 0);
//     });

//     test('should update item quantity', () {
//       // Arrange
//       cartProvider.addItem(testProduct, 'Red', 'M');
//       final cartItemId = cartProvider.items.keys.first;

//       // Act
//       cartProvider.updateQuantity(cartItemId, 3);

//       // Assert
//       expect(cartProvider.items[cartItemId]!.quantity, 3);
//       expect(cartProvider.totalAmount, testProduct.price * 3);
//     });

//     test('should calculate total amount correctly', () {
//       // Arrange
//       final product2 = Product(
//         id: 'test_product_2',
//         title: 'Test Product 2',
//         price: 15.50,
//         imageUrl: 'https://example.com/image2.jpg',
//         category: 'Test Category',
//         description: 'Test Description 2',
//       );

//       // Act
//       cartProvider.addItem(testProduct, 'Red', 'M');
//       cartProvider.addItem(product2, 'Blue', 'L');

//       // Assert
//       expect(cartProvider.totalAmount, testProduct.price + product2.price);
//     });

//     test('should notify listeners on cart changes', () {
//       // Arrange
//       int listenerCallCount = 0;
//       cartProvider.addListener(() {
//         listenerCallCount++;
//       });

//       // Act
//       cartProvider.addItem(testProduct, 'Red', 'M');

//       // Assert
//       expect(listenerCallCount, greaterThan(0));
//     });

//     test('should handle edge cases properly', () {
//       // Act & Assert - Should not throw errors
//       expect(() => cartProvider.removeItem('non_existent_id'), returnsNormally);
//       expect(() => cartProvider.updateQuantity('non_existent_id', 5),
//           returnsNormally);
//       expect(() => cartProvider.clearCart(), returnsNormally);
//     });
//   });
// }
