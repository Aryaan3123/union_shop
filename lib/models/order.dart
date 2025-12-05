class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double subtotal;
  final double shippingCost;
  final double discountAmount;
  final double totalAmount;
  final String status; // 'pending', 'processing', 'shipped', 'delivered', 'cancelled'
  final DateTime orderDate;
  final ShippingAddress shippingAddress;
  final String? orderNote;
  final String? discountCode;
  final String paymentMethod; // 'card', 'paypal', etc.

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    this.shippingCost = 0.0,
    this.discountAmount = 0.0,
    required this.totalAmount,
    this.status = 'pending',
    required this.orderDate,
    required this.shippingAddress,
    this.orderNote,
    this.discountCode,
    this.paymentMethod = 'card',
  });

  factory Order.fromFirestore(Map<String, dynamic> data, String id) {
    return Order(
      id: id,
      userId: data['userId'] ?? '',
      items: (data['items'] as List<dynamic>?)
              ?.map((item) => OrderItem.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      subtotal: (data['subtotal'] ?? 0.0).toDouble(),
      shippingCost: (data['shippingCost'] ?? 0.0).toDouble(),
      discountAmount: (data['discountAmount'] ?? 0.0).toDouble(),
      totalAmount: (data['totalAmount'] ?? 0.0).toDouble(),
      status: data['status'] ?? 'pending',
      orderDate: data['orderDate'] != null 
          ? (data['orderDate'] as Timestamp).toDate()
          : DateTime.now(),
      shippingAddress: ShippingAddress.fromMap(
          data['shippingAddress'] as Map<String, dynamic>? ?? {}),
      orderNote: data['orderNote'],
      discountCode: data['discountCode'],
      paymentMethod: data['paymentMethod'] ?? 'card',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(),
      'subtotal': subtotal,
      'shippingCost': shippingCost,
      'discountAmount': discountAmount,
      'totalAmount': totalAmount,
      'status': status,
      'orderDate': Timestamp.fromDate(orderDate),
      'shippingAddress': shippingAddress.toMap(),
      'orderNote': orderNote,
      'discountCode': discountCode,
      'paymentMethod': paymentMethod,
    };
  }
}

class OrderItem {
  final String productId;
  final String title;
  final String imageUrl;
  final String color;
  final String size;
  final int quantity;
  final double price;
  final double totalPrice;

  OrderItem({
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  factory OrderItem.fromCartItem(dynamic cartItem) {
    return OrderItem(
      productId: cartItem.productId ?? '',
      title: cartItem.title ?? '',
      imageUrl: cartItem.imageUrl ?? '',
      color: cartItem.color ?? '',
      size: cartItem.size ?? '',
      quantity: cartItem.quantity ?? 1,
      price: cartItem.price?.toDouble() ?? 0.0,
      totalPrice: cartItem.totalPrice?.toDouble() ?? 0.0,
    );
  }

  factory OrderItem.fromMap(Map<String, dynamic> data) {
    return OrderItem(
      productId: data['productId'] ?? '',
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      color: data['color'] ?? '',
      size: data['size'] ?? '',
      quantity: data['quantity'] ?? 1,
      price: (data['price'] ?? 0.0).toDouble(),
      totalPrice: (data['totalPrice'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'imageUrl': imageUrl,
      'color': color,
      'size': size,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
    };
  }
}

class ShippingAddress {
  final String firstName;
  final String lastName;
  final String address1;
  final String address2;
  final String city;
  final String postalCode;
  final String country;
  final String? phone;

  ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.address1,
    this.address2 = '',
    required this.city,
    required this.postalCode,
    required this.country,
    this.phone,
  });

  factory ShippingAddress.fromMap(Map<String, dynamic> data) {
    return ShippingAddress(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      address1: data['address1'] ?? '',
      address2: data['address2'] ?? '',
      city: data['city'] ?? '',
      postalCode: data['postalCode'] ?? '',
      country: data['country'] ?? 'United Kingdom',
      phone: data['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'address1': address1,
      'address2': address2,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      'phone': phone,
    };
  }

  String get fullAddress {
    final parts = [
      '$firstName $lastName',
      address1,
      if (address2.isNotEmpty) address2,
      city,
      postalCode,
      country,
    ];
    return parts.join(', ');
  }
}
