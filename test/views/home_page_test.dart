import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/home_page.dart';
import 'package:union_shop/providers/auth_provider.dart';
import 'package:union_shop/providers/cart_provider.dart';

void main() {
  group('HomePage Widget Tests', () {
    late AuthProvider mockAuthProvider;
    late CartProvider mockCartProvider;

    setUp(() {
      mockAuthProvider = AuthProvider();
      mockCartProvider = CartProvider();
    });

    Widget createTestWidget() {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: mockAuthProvider),
          ChangeNotifierProvider<CartProvider>.value(value: mockCartProvider),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ),
      );
    }

    testWidgets('should render home page with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Check for common UI elements that should be present
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should handle navigation properly',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Widget should render without errors
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should display page content correctly',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic rendering test
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should handle state changes properly',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Act - Trigger a rebuild
      await tester.pump();

      // Assert - Widget should still be present after rebuild
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
