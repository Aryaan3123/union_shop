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

  // Load cart items from Firestore
  Future<void> loadCart() async {
    if (_cartRef == null) return;

    _loading = true;
    notifyListeners();

    try {
      final snapshot = await _cartRef!.get();
      _items = snapshot.docs
          .map((doc) => CartItem.fromFirestore(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      debugPrint('Error loading cart: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Add item to cart
  Future<void> addToCart({
    required Product product,
    required String color,
    required String size,
    int quantity = 1,
  }) async {
    if (_cartRef == null) return;

    // Check if item already exists in cart
    final existingItemIndex = _items.indexWhere(
      (item) =>
          item.productId == product.id &&
          item.color == color &&
          item.size == size,
    );

    if (existingItemIndex >= 0) {
      // Update existing item quantity
      await updateQuantity(_items[existingItemIndex].id,
          _items[existingItemIndex].quantity + quantity);
    } else {
      // Add new item
      final cartItem = CartItem(
        id: '', // Will be set by Firestore
        productId: product.id,
        title: product.title,
        imageUrl: product.imageUrl,
        color: color,
        size: size,
        quantity: quantity,
        price: product.priceValue,
      );

      try {
        final docRef = await _cartRef!.add(cartItem.toFirestore());
        final newItem = CartItem(
          id: docRef.id,
          productId: cartItem.productId,
          title: cartItem.title,
          imageUrl: cartItem.imageUrl,
          color: cartItem.color,
          size: cartItem.size,
          quantity: cartItem.quantity,
          price: cartItem.price,
        );
        _items.add(newItem);
        notifyListeners();
      } catch (e) {
        debugPrint('Error adding to cart: $e');
      }
    }
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
        imageUrl: existingItem.imageUrl,
        color: existingItem.color,
        size: existingItem.size,
        quantity: newQuantity,
        price: existingItem.price,
      );

      try {
        await _cartRef!.doc(itemId).update(updatedItem.toFirestore());
        _items[itemIndex] = updatedItem;
        notifyListeners();
      } catch (e) {
        debugPrint('Error updating cart item: $e');
      }
    }
  }

  // Remove item from cart
  Future<void> removeFromCart(String itemId) async {
    if (_cartRef == null) return;

    _items.removeWhere((item) => item.id == itemId);
    await _cartRef!.doc(itemId).delete();
    notifyListeners();
  }

  // Clear all items from cart
  Future<void> clearCart() async {
    if (_cartRef == null) return;

    try {
      // Delete all documents in the cart collection
      final batch = FirebaseFirestore.instance.batch();
      final snapshot = await _cartRef!.get();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();

      // Clear local items
      _items.clear();
      notifyListeners();
    } catch (e) {
      debugPrint('Error clearing cart: $e');
    }
  }
}
