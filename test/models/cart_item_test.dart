import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';

void main() {
  group('CartItem Model Tests', () {
    test('should create a CartItem instance with all fields', () {
      // Arrange
      final cartItem = CartItem(
        id: 'cart_1',
        productId: 'product_1',
        title: 'Test Product',
        price: 25.00,
        quantity: 2,
        color: 'Red',
        size: 'M',
        imageUrl: 'https://example.com/image.jpg',
      );

      // Assert
      expect(cartItem.id, 'cart_1');
      expect(cartItem.productId, 'product_1');
      expect(cartItem.title, 'Test Product');
      expect(cartItem.price, 25.00);
      expect(cartItem.quantity, 2);
      expect(cartItem.color, 'Red');
      expect(cartItem.size, 'M');
      expect(cartItem.imageUrl, 'https://example.com/image.jpg');
    });

    test('should calculate total price correctly', () {
      // Arrange
      final cartItem = CartItem(
        id: 'cart_1',
        productId: 'product_1',
        title: 'Test Product',
        price: 15.50,
        quantity: 3,
        color: 'Blue',
        size: 'L',
        imageUrl: 'https://example.com/image.jpg',
      );

      // Assert
      expect(cartItem.totalPrice, 46.50);
    });

    test('should handle single quantity correctly', () {
      // Arrange
      final cartItem = CartItem(
        id: 'cart_1',
        productId: 'product_1',
        title: 'Test Product',
        price: 20.00,
        quantity: 1,
        color: 'Green',
        size: 'S',
        imageUrl: 'https://example.com/image.jpg',
      );

      // Assert
      expect(cartItem.totalPrice, 20.00);
      expect(cartItem.quantity, 1);
    });

    test('should convert to and from Map correctly', () {
      // Arrange
      final cartItem = CartItem(
        id: 'cart_1',
        productId: 'product_1',
        title: 'Test Product',
        price: 25.00,
        quantity: 2,
        color: 'Yellow',
        size: 'XL',
        imageUrl: 'https://example.com/image.jpg',
      );

      // Act
      final itemMap = cartItem.toMap();
      final reconstructedItem = CartItem.fromMap(itemMap);

      // Assert
      expect(reconstructedItem.id, cartItem.id);
      expect(reconstructedItem.productId, cartItem.productId);
      expect(reconstructedItem.title, cartItem.title);
      expect(reconstructedItem.price, cartItem.price);
      expect(reconstructedItem.quantity, cartItem.quantity);
      expect(reconstructedItem.color, cartItem.color);
      expect(reconstructedItem.size, cartItem.size);
    });

    test('should handle zero quantity edge case', () {
      // Arrange
      final cartItem = CartItem(
        id: 'cart_1',
        productId: 'product_1',
        title: 'Test Product',
        price: 15.00,
        quantity: 0,
        color: 'Black',
        size: 'M',
        imageUrl: 'https://example.com/image.jpg',
      );

      // Assert
      expect(cartItem.totalPrice, 0.0);
      expect(cartItem.quantity, 0);
    });
  });
}
