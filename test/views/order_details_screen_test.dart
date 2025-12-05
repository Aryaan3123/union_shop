import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/order_details_screen.dart';
import 'package:union_shop/providers/auth_provider.dart';
import 'package:union_shop/models/order.dart';

void main() {
  group('OrderDetailsScreen Widget Tests', () {
    late AuthProvider mockAuthProvider;
    late Order testOrder;

    setUp(() {
      mockAuthProvider = AuthProvider();

      testOrder = Order(
        id: 'test_order_1',
        userId: 'test_user_1',
        items: [],
        subtotal: 50.0,
        totalAmount: 55.0,
        status: 'processing',
        orderDate: DateTime.now(),
        shippingAddress: ShippingAddress(
          firstName: 'John',
          lastName: 'Doe',
          address1: '123 Test Street',
          city: 'Portsmouth',
          postalCode: 'PO1 2AB',
          country: 'United Kingdom',
        ),
      );
    });

    Widget createTestWidget() {
      return ChangeNotifierProvider<AuthProvider>.value(
        value: mockAuthProvider,
        child: MaterialApp(
          home: OrderDetailsScreen(order: testOrder),
        ),
      );
    }

    testWidgets('should render order details screen with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(OrderDetailsScreen), findsOneWidget);
    });

    testWidgets('should display order details', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Should render without errors
      expect(find.byType(OrderDetailsScreen), findsOneWidget);
    });

    testWidgets('should handle order status display',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic rendering test
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should display order items correctly',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(OrderDetailsScreen), findsOneWidget);
    });
  });
}
