import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/order.dart';
import 'package:union_shop/models/cart_item.dart';

void main() {
  group('Order Model Tests', () {
    late List<CartItem> testItems;

    setUp(() {
      testItems = [
        CartItem(
          id: 'item_1',
          productId: 'product_1',
          title: 'Test Product 1',
          price: 20.00,
          quantity: 2,
          color: 'Red',
          size: 'M',
          imageUrl: 'https://example.com/image1.jpg',
        ),
        CartItem(
          id: 'item_2',
          productId: 'product_2',
          title: 'Test Product 2',
          price: 15.00,
          quantity: 1,
          color: 'Blue',
          size: 'L',
          imageUrl: 'https://example.com/image2.jpg',
        ),
      ];
    });

    test('should create an Order instance with all fields', () {
      // Arrange
      final orderDate = DateTime.now();
      final order = Order(
        id: 'order_1',
        userId: 'user_1',
        items: testItems,
        totalAmount: 55.00,
        status: 'pending',
        orderDate: orderDate,
        shippingAddress: '123 Test Street',
      );

      // Assert
      expect(order.id, 'order_1');
      expect(order.userId, 'user_1');
      expect(order.items.length, 2);
      expect(order.totalAmount, 55.00);
      expect(order.status, 'pending');
      expect(order.orderDate, orderDate);
      expect(order.shippingAddress, '123 Test Street');
    });

    test('should calculate total amount correctly based on items', () {
      // Arrange
      final expectedTotal =
          testItems.fold(0.0, (sum, item) => sum + item.totalPrice);

      final order = Order(
        id: 'order_1',
        userId: 'user_1',
        items: testItems,
        totalAmount: expectedTotal,
        status: 'pending',
        orderDate: DateTime.now(),
        shippingAddress: '123 Test Street',
      );

      // Assert - Total should be (20*2) + (15*1) = 55.00
      expect(order.totalAmount, 55.00);
      expect(expectedTotal, 55.00);
    });

    test('should handle different order statuses', () {
      final statuses = [
        'pending',
        'processing',
        'shipped',
        'delivered',
        'cancelled'
      ];

      for (String status in statuses) {
        final order = Order(
          id: 'order_$status',
          userId: 'user_1',
          items: testItems,
          totalAmount: 55.00,
          status: status,
          orderDate: DateTime.now(),
          shippingAddress: '123 Test Street',
        );

        expect(order.status, status);
      }
    });

    test('should convert to and from Map correctly', () {
      // Arrange
      final orderDate = DateTime.now();
      final order = Order(
        id: 'order_1',
        userId: 'user_1',
        items: testItems,
        totalAmount: 55.00,
        status: 'processing',
        orderDate: orderDate,
        shippingAddress: '123 Test Street',
      );

      // Act
      final orderMap = order.toMap();
      final reconstructedOrder = Order.fromMap(orderMap);

      // Assert
      expect(reconstructedOrder.id, order.id);
      expect(reconstructedOrder.userId, order.userId);
      expect(reconstructedOrder.items.length, order.items.length);
      expect(reconstructedOrder.totalAmount, order.totalAmount);
      expect(reconstructedOrder.status, order.status);
      expect(reconstructedOrder.shippingAddress, order.shippingAddress);
    });

    test('should handle empty items list', () {
      // Arrange
      final order = Order(
        id: 'order_empty',
        userId: 'user_1',
        items: [],
        totalAmount: 0.00,
        status: 'pending',
        orderDate: DateTime.now(),
        shippingAddress: '123 Test Street',
      );

      // Assert
      expect(order.items.isEmpty, true);
      expect(order.totalAmount, 0.00);
    });

    test('should handle optional fields correctly', () {
      // Arrange - Order with minimal required fields
      final order = Order(
        id: 'order_minimal',
        userId: 'user_1',
        items: testItems,
        totalAmount: 55.00,
        status: 'pending',
        orderDate: DateTime.now(),
      );

      // Assert
      expect(order.id, 'order_minimal');
      expect(order.shippingAddress, isNull);
    });
  });
}
