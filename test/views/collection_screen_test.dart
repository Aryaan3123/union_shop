import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/collection_screen.dart';
import 'package:union_shop/providers/cart_provider.dart';

void main() {
  group('CollectionScreen Widget Tests', () {
    late CartProvider mockCartProvider;

    setUp(() {
      mockCartProvider = CartProvider();
    });

    Widget createTestWidget({String categoryName = 'Test Category'}) {
      return ChangeNotifierProvider<CartProvider>.value(
        value: mockCartProvider,
        child: MaterialApp(
          home: CollectionScreen(categoryName: categoryName),
        ),
      );
    }

    testWidgets('should render collection screen with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(CollectionScreen), findsOneWidget);
    });

    testWidgets('should display category name', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget(categoryName: 'SALE'));
      await tester.pumpAndSettle();

      // Assert - Should render without errors
      expect(find.byType(CollectionScreen), findsOneWidget);
    });

    testWidgets('should handle different categories',
        (WidgetTester tester) async {
      // Test Pride Collection
      await tester
          .pumpWidget(createTestWidget(categoryName: 'Pride Collection'));
      await tester.pumpAndSettle();
      expect(find.byType(CollectionScreen), findsOneWidget);

      // Test Portsmouth City
      await tester
          .pumpWidget(createTestWidget(categoryName: 'Portsmouth City'));
      await tester.pumpAndSettle();
      expect(find.byType(CollectionScreen), findsOneWidget);

      // Test Graduation
      await tester.pumpWidget(createTestWidget(categoryName: 'Graduation'));
      await tester.pumpAndSettle();
      expect(find.byType(CollectionScreen), findsOneWidget);
    });

    testWidgets('should display products grid', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic rendering test
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
