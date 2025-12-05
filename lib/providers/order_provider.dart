import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import '../models/order.dart';
import '../models/cart_item.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  bool _loading = false;

  OrderProvider() {
    // Listen to auth state changes and load orders when user logs in
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        loadOrders();
      } else {
        _orders = [];
        notifyListeners();
      }
    });
  }

  List<Order> get orders => _orders;
  bool get loading => _loading;

  // Available discount codes
  final Map<String, double> _discountCodes = {
    'WELCOME10': 0.10, // 10% discount
    'SAVE20': 0.20, // 20% discount
    'STUDENT15': 0.15, // 15% discount
  };

  // Load orders from Firestore
  Future<void> loadOrders() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    _loading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('userId', isEqualTo: user.uid)
          .orderBy('orderDate', descending: true)
          .get();

      _orders = snapshot.docs
          .map((doc) => Order.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      debugPrint('Error loading orders: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Validate discount code
  double? validateDiscountCode(String code) {
    return _discountCodes[code.toUpperCase()];
  }

  // Calculate shipping cost based on total
  double calculateShippingCost(double subtotal) {
    if (subtotal >= 50) return 0.0; // Free shipping over £50
    return 4.99; // Standard shipping
  }

  // Create order from cart items
  Future<String?> createOrder({
    required List<CartItem> cartItems,
    required ShippingAddress shippingAddress,
    required double subtotal,
    String? discountCode,
    String? orderNote,
    String paymentMethod = 'card',
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User must be logged in to place an order');
    }

    try {
      // Calculate totals
      final shippingCost = calculateShippingCost(subtotal);
      final discountAmount = discountCode != null
          ? (validateDiscountCode(discountCode) ?? 0.0) * subtotal
          : 0.0;
      final totalAmount = subtotal + shippingCost - discountAmount;

      // Convert cart items to order items
      final orderItems = cartItems
          .map((cartItem) => OrderItem.fromCartItem(cartItem))
          .toList();

      // Create order object
      final order = Order(
        id: '', // Will be set by Firestore
        userId: user.uid,
        items: orderItems,
        subtotal: subtotal,
        shippingCost: shippingCost,
        discountAmount: discountAmount,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        shippingAddress: shippingAddress,
        orderNote: orderNote,
        discountCode: discountCode,
        paymentMethod: paymentMethod,
      );

      // Save to Firestore
      final docRef = await FirebaseFirestore.instance
          .collection('orders')
          .add(order.toFirestore());

      // Add to local list
      final newOrder = Order(
        id: docRef.id,
        userId: order.userId,
        items: order.items,
        subtotal: order.subtotal,
        shippingCost: order.shippingCost,
        discountAmount: order.discountAmount,
        totalAmount: order.totalAmount,
        status: order.status,
        orderDate: order.orderDate,
        shippingAddress: order.shippingAddress,
        orderNote: order.orderNote,
        discountCode: order.discountCode,
        paymentMethod: order.paymentMethod,
      );

      _orders.insert(0, newOrder);
      notifyListeners();

      return docRef.id;
    } catch (e) {
      debugPrint('Error creating order: $e');
      return null;
    }
  }

  // Update order status
  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .update({'status': newStatus});

      // Update local order
      final orderIndex = _orders.indexWhere((order) => order.id == orderId);
      if (orderIndex >= 0) {
        final order = _orders[orderIndex];
        _orders[orderIndex] = Order(
          id: order.id,
          userId: order.userId,
          items: order.items,
          subtotal: order.subtotal,
          shippingCost: order.shippingCost,
          discountAmount: order.discountAmount,
          totalAmount: order.totalAmount,
          status: newStatus,
          orderDate: order.orderDate,
          shippingAddress: order.shippingAddress,
          orderNote: order.orderNote,
          discountCode: order.discountCode,
          paymentMethod: order.paymentMethod,
        );
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating order status: $e');
    }
  }

  // Get order by ID
  Order? getOrderById(String orderId) {
    try {
      return _orders.firstWhere((order) => order.id == orderId);
    } catch (e) {
      return null;
    }
  }

  // Get orders by status
  List<Order> getOrdersByStatus(String status) {
    return _orders.where((order) => order.status == status).toList();
  }
}
