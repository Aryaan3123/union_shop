import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/order.dart';

void main() {
  group('Order Model Tests', () {
    late List<OrderItem> testItems;
    late ShippingAddress testShippingAddress;

    setUp(() {
      testItems = [
        OrderItem(
          productId: 'product_1',
          title: 'Test Product 1',
          price: 20.00,
          quantity: 2,
          color: 'Red',
          size: 'M',
          imageUrl: 'https://example.com/image1.jpg',
          totalPrice: 40.00,
        ),
        OrderItem(
          productId: 'product_2',
          title: 'Test Product 2',
          price: 15.00,
          quantity: 1,
          color: 'Blue',
          size: 'L',
          imageUrl: 'https://example.com/image2.jpg',
          totalPrice: 15.00,
        ),
      ];

      testShippingAddress = ShippingAddress(
        firstName: 'John',
        lastName: 'Doe',
        address1: '123 Test Street',
        city: 'Portsmouth',
        postalCode: 'PO1 2AB',
        country: 'United Kingdom',
        phone: '07123456789',
      );
    });

    test('should create an Order instance with all fields', () {
      // Arrange
      final orderDate = DateTime.now();
      final order = Order(
        id: 'order_1',
        userId: 'user_1',
        items: testItems,
        subtotal: 55.00,
        shippingCost: 5.00,
        discountAmount: 0.00,
        totalAmount: 60.00,
        status: 'pending',
        orderDate: orderDate,
        shippingAddress: testShippingAddress,
        paymentMethod: 'card',
      );

      // Assert
      expect(order.id, 'order_1');
      expect(order.userId, 'user_1');
      expect(order.items.length, 2);
      expect(order.subtotal, 55.00);
      expect(order.shippingCost, 5.00);
      expect(order.totalAmount, 60.00);
      expect(order.status, 'pending');
      expect(order.orderDate, orderDate);
      expect(order.shippingAddress.firstName, 'John');
      expect(order.shippingAddress.lastName, 'Doe');
    });

    // test('should calculate total amount correctly based on items', () {
    //   // Arrange
    //   final expectedTotal = testItems.fold(0.0, (sum, item) => sum + (item.totalPrice ?? 0.0));

    //   final order = Order(
    //     id: 'order_1',
    //     userId: 'user_1',
    //     items: testItems,
    //     subtotal: expectedTotal,
    //     totalAmount: expectedTotal,
    //     status: 'pending',
    //     orderDate: DateTime.now(),
    //     shippingAddress: testShippingAddress,
    //   );

    //   // Assert - Total should be (20*2) + (15*1) = 55.00
    //   expect(order.totalAmount, 55.00);
    //   expect(expectedTotal, 55.00);
    // });

    test('should handle different order statuses', () {
      final statuses = [
        'pending',
        'processing',
        'shipped',
        'delivered',
        'cancelled'
      ];

      for (String status in statuses) {
        final order = Order(
          id: 'order_$status',
          userId: 'user_1',
          items: testItems,
          subtotal: 55.00,
          totalAmount: 55.00,
          status: status,
          orderDate: DateTime.now(),
          shippingAddress: testShippingAddress,
        );

        expect(order.status, status);
      }
    });

    test('should convert to Map correctly', () {
      // Arrange
      final orderDate = DateTime.now();
      final order = Order(
        id: 'order_1',
        userId: 'user_1',
        items: testItems,
        subtotal: 55.00,
        totalAmount: 55.00,
        status: 'processing',
        orderDate: orderDate,
        shippingAddress: testShippingAddress,
      );

      // Act
      final orderMap = order.toFirestore();

      // Assert
      expect(orderMap['userId'], order.userId);
      expect(orderMap['subtotal'], order.subtotal);
      expect(orderMap['totalAmount'], order.totalAmount);
      expect(orderMap['status'], order.status);
      expect(orderMap['items'], isA<List>());
      expect(orderMap['shippingAddress'], isA<Map<String, dynamic>>());
    });

    test('should handle empty order', () {
      // Arrange
      final order = Order(
        id: 'order_empty',
        userId: 'user_1',
        items: [],
        subtotal: 0.00,
        totalAmount: 0.00,
        status: 'pending',
        orderDate: DateTime.now(),
        shippingAddress: testShippingAddress,
      );

      // Assert
      expect(order.items.isEmpty, true);
      expect(order.totalAmount, 0.00);
    });

    test('should handle shipping address correctly', () {
      // Arrange
      final order = Order(
        id: 'order_with_address',
        userId: 'user_1',
        items: testItems,
        subtotal: 55.00,
        totalAmount: 55.00,
        status: 'pending',
        orderDate: DateTime.now(),
        shippingAddress: testShippingAddress,
      );

      // Assert
      expect(order.shippingAddress.firstName, 'John');
      expect(order.shippingAddress.lastName, 'Doe');
      expect(order.shippingAddress.address1, '123 Test Street');
      expect(order.shippingAddress.city, 'Portsmouth');
      expect(order.shippingAddress.postalCode, 'PO1 2AB');
      expect(order.shippingAddress.country, 'United Kingdom');
    });
  });

  group('OrderItem Tests', () {
    test('should create OrderItem with all fields', () {
      // Arrange
      final orderItem = OrderItem(
        productId: 'product_1',
        title: 'Test Product',
        price: 25.00,
        quantity: 3,
        color: 'Blue',
        size: 'L',
        imageUrl: 'https://example.com/image.jpg',
        totalPrice: 75.00,
      );

      // Assert
      expect(orderItem.productId, 'product_1');
      expect(orderItem.title, 'Test Product');
      expect(orderItem.price, 25.00);
      expect(orderItem.quantity, 3);
      expect(orderItem.color, 'Blue');
      expect(orderItem.size, 'L');
      expect(orderItem.imageUrl, 'https://example.com/image.jpg');
      expect(orderItem.totalPrice, 75.00);
    });

    test('should convert OrderItem to Map', () {
      // Arrange
      final orderItem = OrderItem(
        productId: 'product_1',
        title: 'Test Product',
        price: 25.00,
        quantity: 2,
        color: 'Red',
        size: 'M',
        imageUrl: 'https://example.com/image.jpg',
        totalPrice: 50.00,
      );

      // Act
      final itemMap = orderItem.toMap();

      // Assert
      expect(itemMap['productId'], 'product_1');
      expect(itemMap['title'], 'Test Product');
      expect(itemMap['price'], 25.00);
      expect(itemMap['quantity'], 2);
      expect(itemMap['color'], 'Red');
      expect(itemMap['size'], 'M');
      expect(itemMap['imageUrl'], 'https://example.com/image.jpg');
      expect(itemMap['totalPrice'], 50.00);
    });
  });

  group('ShippingAddress Tests', () {
    test('should create ShippingAddress with all fields', () {
      // Arrange
      final address = ShippingAddress(
        firstName: 'Jane',
        lastName: 'Smith',
        address1: '456 Another Street',
        address2: 'Apt 2B',
        city: 'London',
        postalCode: 'SW1A 1AA',
        country: 'United Kingdom',
        phone: '07987654321',
      );

      // Assert
      expect(address.firstName, 'Jane');
      expect(address.lastName, 'Smith');
      expect(address.address1, '456 Another Street');
      expect(address.address2, 'Apt 2B');
      expect(address.city, 'London');
      expect(address.postalCode, 'SW1A 1AA');
      expect(address.country, 'United Kingdom');
      expect(address.phone, '07987654321');
    });

    test('should convert ShippingAddress to Map', () {
      // Arrange
      final address = ShippingAddress(
        firstName: 'Jane',
        lastName: 'Smith',
        address1: '456 Another Street',
        city: 'London',
        postalCode: 'SW1A 1AA',
        country: 'United Kingdom',
        phone: '07987654321',
      );

      // Act
      final addressMap = address.toMap();

      // Assert
      expect(addressMap['firstName'], 'Jane');
      expect(addressMap['lastName'], 'Smith');
      expect(addressMap['address1'], '456 Another Street');
      expect(addressMap['city'], 'London');
      expect(addressMap['postalCode'], 'SW1A 1AA');
      expect(addressMap['country'], 'United Kingdom');
      expect(addressMap['phone'], '07987654321');
    });

    test('should generate full address correctly', () {
      // Arrange
      final address = ShippingAddress(
        firstName: 'John',
        lastName: 'Doe',
        address1: '123 Test Street',
        address2: 'Unit 5',
        city: 'Portsmouth',
        postalCode: 'PO1 2AB',
        country: 'United Kingdom',
      );

      // Act
      final fullAddress = address.fullAddress;

      // Assert
      expect(fullAddress, contains('John Doe'));
      expect(fullAddress, contains('123 Test Street'));
      expect(fullAddress, contains('Unit 5'));
      expect(fullAddress, contains('Portsmouth'));
      expect(fullAddress, contains('PO1 2AB'));
      expect(fullAddress, contains('United Kingdom'));
    });
  });
}
