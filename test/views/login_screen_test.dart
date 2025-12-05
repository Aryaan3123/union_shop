import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/login_screen.dart';
import 'package:union_shop/providers/auth_provider.dart';

void main() {
  group('LoginScreen UI Tests', () {
    Widget createTestWidget() {
      return ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      );
    }

    testWidgets('renders Scaffold and LoginScreen', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('shows email and password TextFormFields', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets('shows login button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    });

    testWidgets('shows MaterialApp', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
