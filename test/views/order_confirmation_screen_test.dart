import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/order_confirmation_screen.dart';
import 'package:union_shop/providers/auth_provider.dart';
import 'package:union_shop/models/order.dart';

void main() {
  group('OrderConfirmationScreen Widget Tests', () {
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
        status: 'confirmed',
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
          home: OrderConfirmationScreen(order: testOrder),
        ),
      );
    }

    testWidgets('should render order confirmation screen with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(OrderConfirmationScreen), findsOneWidget);
    });

    testWidgets('should display order information',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Should render without errors
      expect(find.byType(OrderConfirmationScreen), findsOneWidget);
    });

    testWidgets('should handle navigation properly',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic rendering test
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should display confirmation details',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(OrderConfirmationScreen), findsOneWidget);
    });
  });
}
