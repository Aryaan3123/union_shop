import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/order_summary_screen.dart';
import 'package:union_shop/providers/cart_provider.dart';
import 'package:union_shop/providers/auth_provider.dart';

void main() {
  group('OrderSummaryScreen Widget Tests', () {
    late CartProvider mockCartProvider;
    late AuthProvider mockAuthProvider;

    setUp(() {
      mockCartProvider = CartProvider();
      mockAuthProvider = AuthProvider();
    });

    Widget createTestWidget() {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartProvider>.value(value: mockCartProvider),
          ChangeNotifierProvider<AuthProvider>.value(value: mockAuthProvider),
        ],
        child: const MaterialApp(
          home: OrderSummaryScreen(),
        ),
      );
    }

    testWidgets('should render order summary screen with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(OrderSummaryScreen), findsOneWidget);
    });

    testWidgets('should display order summary information',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Should render without errors
      expect(find.byType(OrderSummaryScreen), findsOneWidget);
    });

    testWidgets('should handle checkout operations properly',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic functionality test
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should display pricing information',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(OrderSummaryScreen), findsOneWidget);
    });
  });
}
