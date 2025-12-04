import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/cart_item.dart';
import '../models/product_model.dart';

class CartProvider {
  List<CartItem> _items = []; // List of items in the cart
  bool _loading = false;

  List<CartItem> get items => _items; //
  bool get loading => _loading;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalAmount => _items.fold(0, (sum, item) => sum + item.totalPrice); 
}
