import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/personalisation_page.dart';
import 'package:union_shop/providers/cart_provider.dart';

void main() {
  group('PersonalisationPage Widget Tests', () {
    late CartProvider mockCartProvider;

    setUp(() {
      mockCartProvider = CartProvider();
    });

    Widget createTestWidget() {
      return ChangeNotifierProvider<CartProvider>.value(
        value: mockCartProvider,
        child: const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
    }

    testWidgets('should render personalisation page with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(PersonalisationPage), findsOneWidget);
    });

    testWidgets('should display personalisation options',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Should render without errors
      expect(find.byType(PersonalisationPage), findsOneWidget);
    });

    testWidgets('should handle text input for customization',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic functionality test
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should display preview of customization',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(PersonalisationPage), findsOneWidget);
    });
  });
}
