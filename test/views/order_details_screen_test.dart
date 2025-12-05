// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:union_shop/views/order_details_screen.dart';
// import 'package:union_shop/models/order.dart';

// void main() {
//   testWidgets('OrderDetailsScreen renders basic elements', (WidgetTester tester) async {
//     final testOrder = Order(
//       id: 'test_order_1',
//       userId: 'test_user_1',
//       items: [],
//       subtotal: 50.0,
//       totalAmount: 55.0,
//       status: 'processing',
//       orderDate: DateTime.now(),
//       shippingAddress: ShippingAddress(
//         firstName: 'John',
//         lastName: 'Doe',
//         address1: '123 Test Street',
//         city: 'Portsmouth',
//         postalCode: 'PO1 2AB',
//         country: 'United Kingdom',
//       ),
//     );

//     await tester.pumpWidget(
//       MaterialApp(
//         home: OrderDetailsScreen(orderId: testOrder.id, order: testOrder),
//       ),
//     );

//     expect(find.byType(OrderDetailsScreen), findsOneWidget);
//     expect(find.text('John'), findsOneWidget); // Example: checks for first name
//   });
// }
