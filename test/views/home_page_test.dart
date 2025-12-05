// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:provider/provider.dart';
// import 'package:union_shop/views/home_page.dart';
// import 'package:union_shop/providers/auth_provider.dart';
// import 'package:union_shop/providers/cart_provider.dart';

// void main() {
//   group('HomePage Widget Tests', () {
//     late AuthProvider mockAuthProvider;
//     late CartProvider mockCartProvider;

//     setUp(() {
//       mockAuthProvider = AuthProvider();
//       mockCartProvider = CartProvider();
//     });

//     Widget createTestWidget() {
//       return MultiProvider(
//         providers: [
//           ChangeNotifierProvider<AuthProvider>.value(value: mockAuthProvider),
//           ChangeNotifierProvider<CartProvider>.value(value: mockCartProvider),
//         ],
//         child: MaterialApp(
//           home: HomePage(),
//         ),
//       );
//     }

//     testWidgets('renders Scaffold and HomePage', (WidgetTester tester) async {
//       await tester.pumpWidget(createTestWidget());
//       await tester.pumpAndSettle();

//       expect(find.byType(Scaffold), findsOneWidget);
//       expect(find.byType(HomePage), findsOneWidget);
//     });

//     testWidgets('renders MaterialApp', (WidgetTester tester) async {
//       await tester.pumpWidget(createTestWidget());
//       await tester.pumpAndSettle();

//       expect(find.byType(MaterialApp), findsOneWidget);
//     });

//     testWidgets('remains after state change', (WidgetTester tester) async {
//       await tester.pumpWidget(createTestWidget());
//       await tester.pumpAndSettle();

//       // Simulate a state change
//       mockAuthProvider.notifyListeners();
//       await tester.pump();

//       expect(find.byType(HomePage), findsOneWidget);
//     });
//   });
// }
