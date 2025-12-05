// import 'package:flutter_test/flutter_test.dart';
// import 'package:union_shop/providers/order_provider.dart';
// import 'package:union_shop/models/order.dart';

// void main() {
//   group('OrderProvider Tests', () {
//     late OrderProvider orderProvider;
//     late Order testOrder;

//     setUp(() {
//       orderProvider = OrderProvider();

//       testOrder = Order(
//         id: 'test_order_1',
//         userId: 'test_user_1',
//         items: [],
//         subtotal: 50.0,
//         totalAmount: 55.0,
//         status: 'pending',
//         orderDate: DateTime.now(),
//         shippingAddress: ShippingAddress(
//           firstName: 'John',
//           lastName: 'Doe',
//           address1: '123 Test Street',
//           city: 'Portsmouth',
//           postalCode: 'PO1 2AB',
//           country: 'United Kingdom',
//         ),
//       );
//     });

//     test('should initialize with default values', () {
//       // Assert
//       expect(orderProvider.orders, isEmpty);
//       expect(orderProvider.isLoading, false);
//     });

//     test('should handle loading state correctly', () {
//       // Act
//       orderProvider.setLoading(true);

//       // Assert
//       expect(orderProvider.isLoading, true);

//       // Act
//       orderProvider.setLoading(false);

//       // Assert
//       expect(orderProvider.isLoading, false);
//     });

//     test('should add order to list', () {
//       // Act
//       orderProvider.addOrder(testOrder);

//       // Assert
//       expect(orderProvider.orders.length, 1);
//       expect(orderProvider.orders.first, equals(testOrder));
//     });

//     test('should handle multiple orders', () {
//       // Arrange
//       final order2 = Order(
//         id: 'test_order_2',
//         userId: 'test_user_1',
//         items: [],
//         subtotal: 30.0,
//         totalAmount: 35.0,
//         status: 'completed',
//         orderDate: DateTime.now(),
//         shippingAddress: testOrder.shippingAddress,
//       );

//       // Act
//       orderProvider.addOrder(testOrder);
//       orderProvider.addOrder(order2);

//       // Assert
//       expect(orderProvider.orders.length, 2);
//     });

//     test('should update order status', () {
//       // Arrange
//       orderProvider.addOrder(testOrder);

//       // Act
//       orderProvider.updateOrderStatus(testOrder.id, 'shipped');

//       // Assert
//       expect(orderProvider.orders.first.status, 'shipped');
//     });

//     test('should clear orders', () {
//       // Arrange
//       orderProvider.addOrder(testOrder);

//       // Act
//       orderProvider.clearOrders();

//       // Assert
//       expect(orderProvider.orders, isEmpty);
//     });

//     test('should get order by id', () {
//       // Arrange
//       orderProvider.addOrder(testOrder);

//       // Act
//       final foundOrder = orderProvider.getOrderById(testOrder.id);

//       // Assert
//       expect(foundOrder, equals(testOrder));
//     });

//     test('should return null for non-existent order id', () {
//       // Act
//       final foundOrder = orderProvider.getOrderById('non_existent_id');

//       // Assert
//       expect(foundOrder, isNull);
//     });

//     test('should notify listeners on changes', () {
//       // Arrange
//       int listenerCallCount = 0;
//       orderProvider.addListener(() {
//         listenerCallCount++;
//       });

//       // Act
//       orderProvider.addOrder(testOrder);

//       // Assert
//       expect(listenerCallCount, greaterThan(0));
//     });

//     test('should handle error cases gracefully', () {
//       // Act & Assert - Should not throw errors
//       expect(() => orderProvider.updateOrderStatus('non_existent', 'shipped'),
//           returnsNormally);
//       expect(() => orderProvider.clearOrders(), returnsNormally);
//       expect(() => orderProvider.getOrderById(''), returnsNormally);
//     });
//   });
// }
