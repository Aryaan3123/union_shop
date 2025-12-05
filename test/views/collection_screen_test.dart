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
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(CollectionScreen), findsOneWidget);
    });

    testWidgets('should display category name in the app bar', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(categoryName: 'SALE'));
      await tester.pumpAndSettle();

      expect(find.text('SALE'), findsWidgets);
    });

    testWidgets('should handle different categories and display their names', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(categoryName: 'Pride Collection'));
      await tester.pumpAndSettle();
      expect(find.text('Pride Collection'), findsWidgets);

      await tester.pumpWidget(createTestWidget(categoryName: 'Portsmouth City'));
      await tester.pumpAndSettle();
      expect(find.text('Portsmouth City'), findsWidgets);

      await tester.pumpWidget(createTestWidget(categoryName: 'Graduation'));
      await tester.pumpAndSettle();
      expect(find.text('Graduation'), findsWidgets);
    });

    testWidgets('should display products grid or list', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Try to find a GridView or ListView, depending on your implementation
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
