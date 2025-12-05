import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = []; // List of items in the cart
  bool _loading = false;

  CartProvider() {
    // Listen to auth state changes and load cart when user logs in
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        loadCart();
      } else {
        _items = [];
        notifyListeners();
      }
    });
  }

  List<CartItem> get items => _items; //
  bool get loading => _loading;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalAmount =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  // Get reference to Firestore collection for the user's cart
  CollectionReference? get _cartRef {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('cart');
  }

  // Update item quantity in cart
  Future<void> updateQuantity(String itemId, int newQuantity) async {
  if (_cartRef == null) return;

  if (newQuantity <= 0) {
    await removeFromCart(itemId);
    return;
  }

  final itemIndex = _items.indexWhere((item) => item.id == itemId);
  if (itemIndex >= 0) {
    final existingItem = _items[itemIndex];
    final updatedItem = CartItem(
      id: existingItem.id,
      productId: existingItem.productId,
      title: existingItem.title,
      price: existingItem.price,
      quantity: newQuantity,
      color: existingItem.color,
      size: existingItem.size,
      imageUrl: existingItem.imageUrl,
    );

    _items[itemIndex] = updatedItem;
    await _cartRef!.doc(itemId).update({'quantity': newQuantity});
    notifyListeners();
  }
}

  // Load cart items from Firestore
  Future<void> loadCart() async {
    if (_cartRef == null) return; // Check if empty

    _loading = true;
    notifyListeners();
    try {
      final snapshot = await _cartRef!.get(); // Fetch cart items
      _items = snapshot.docs
          .where((doc) => doc.data() != null) // Filter out null documents
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return CartItem.fromMap(data);
            }
            return null;
          })
          .where((item) => item != null) // Remove any null items
          .cast<CartItem>() // Cast to CartItem list
          .toList();
    } catch (e) {
      print('Error loading cart: $e');
      _items = []; // Reset to empty list on error
    }

    _loading = false;
    notifyListeners();
  }

  // Add item to cart
  Future<void> addToCart(
      Product product, String color, String size, int quantity) async {
    if (_cartRef == null) return;

    final itemId = '${product.id}_${color}_$size';

    // Check if item already exists
    final existingIndex = _items.indexWhere((item) => item.id == itemId);

    if (existingIndex >= 0) {
      // Update existing item
      final existingItem = _items[existingIndex];
      final updatedItem = CartItem(
        id: existingItem.id,
        productId: existingItem.productId,
        title: existingItem.title,
        price: existingItem.price,
        quantity: existingItem.quantity + quantity,
        color: existingItem.color,
        size: existingItem.size,
        imageUrl: existingItem.imageUrl,
      );

      _items[existingIndex] = updatedItem;
      await _cartRef!.doc(itemId).set(updatedItem.toMap());
    } else {
      // Add new item
      final newItem = CartItem(
        id: itemId,
        productId: product.id,
        title: product.title,
        price: product.priceValue,
        quantity: quantity,
        color: color,
        size: size,
        imageUrl: product.imageUrls.isNotEmpty ? product.imageUrls.first : '',
      );

      _items.add(newItem);
      await _cartRef!.doc(itemId).set(newItem.toMap());
    }

    notifyListeners();
  }

  // Remove item from cart

  Future<void> removeFromCart(String itemId) async {
    if (_cartRef == null) return;

    _items.removeWhere((item) => item.id == itemId);
    await _cartRef!.doc(itemId).delete();
    notifyListeners();
  }
}
