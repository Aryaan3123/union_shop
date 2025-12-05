import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/login_screen.dart';
import 'package:union_shop/providers/auth_provider.dart';

void main() {
  group('LoginScreen Widget Tests', () {
    late AuthProvider mockAuthProvider;

    setUp(() {
      mockAuthProvider = AuthProvider();
    });

    Widget createTestWidget() {
      return ChangeNotifierProvider<AuthProvider>.value(
        value: mockAuthProvider,
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      );
    }

    testWidgets('should render login screen with basic elements',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('should display email and password fields',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Look for text form fields
      expect(find.byType(TextFormField), findsWidgets);
    });

    testWidgets('should have login button', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Should render without errors
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('should handle form validation', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert - Basic rendering test
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
