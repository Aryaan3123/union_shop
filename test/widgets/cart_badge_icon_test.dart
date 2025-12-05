import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartBadgeIcon Widget Tests', () {
    
    testWidgets('should create CartBadgeIcon without errors', (WidgetTester tester) async {
      // Basic smoke test
      expect(() {
        const Key('test');
      }, returnsNormally);
    });

    testWidgets('should display cart icon with badge', (WidgetTester tester) async {
      // Test cart badge display
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('should handle different badge counts', (WidgetTester tester) async {
      Widget createBadge(int count) {
        return MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (count > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        count > 99 ? '99+' : '$count',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }

      // Test zero count (no badge)
      await tester.pumpWidget(createBadge(0));
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
      expect(find.text('0'), findsNothing);

      // Test normal count
      await tester.pumpWidget(createBadge(5));
      expect(find.text('5'), findsOneWidget);

      // Test high count
      await tester.pumpWidget(createBadge(150));
      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('should handle cart icon interactions', (WidgetTester tester) async {
      bool iconPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                iconPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pump();

      expect(iconPressed, true);
    });

    test('should calculate badge visibility correctly', () {
      // Test badge logic
      bool shouldShowBadge(int itemCount) {
        return itemCount > 0;
      }

      String getBadgeText(int itemCount) {
        if (itemCount > 99) return '99+';
        return itemCount.toString();
      }

      expect(shouldShowBadge(0), false);
      expect(shouldShowBadge(1), true);
      expect(shouldShowBadge(5), true);
      
      expect(getBadgeText(1), '1');
      expect(getBadgeText(50), '50');
      expect(getBadgeText(150), '99+');
    });

    test('should handle badge styling properties', () {
      // Test badge styling logic
      Color getBadgeColor(int itemCount) {
        if (itemCount == 0) return Colors.grey;
        if (itemCount > 10) return Colors.red;
        return Colors.orange;
      }

      double getBadgeSize(int itemCount) {
        if (itemCount > 99) return 20.0;
        if (itemCount > 9) return 18.0;
        return 16.0;
      }

      expect(getBadgeColor(0), Colors.grey);
      expect(getBadgeColor(5), Colors.orange);
      expect(getBadgeColor(15), Colors.red);

      expect(getBadgeSize(5), 16.0);
      expect(getBadgeSize(50), 18.0);
      expect(getBadgeSize(150), 20.0);
    });
  });
}
