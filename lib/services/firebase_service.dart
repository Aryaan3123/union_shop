import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:union_shop/models/product.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get all Products
  static Stream<List<Product>> getAllProducts() {
    return _firestore
        .collection('products')
        .orderBy('popularity', descending: true)
        .snapshots() // Updates in real-time
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  // Get Products by Category
  static Stream<List<Product>> getProductsByCategory(String category) {
    return _firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .orderBy('popularity', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  // Get Featured Products
  static Stream<List<Product>> getFeaturedProducts() {
    return _firestore
        .collection('products')
        .where('featured', isEqualTo: true)
        .orderBy('popularity', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  // Search Products by Title
  static Stream<List<Product?>> searchProducts(String searchTerm) {
    return _firestore
        .collection('products')
        .where('title', isGreaterThanOrEqualTo: searchTerm.toLowerCase())
        .where('title', isLessThan: '${searchTerm.toLowerCase()}z')
        .snapshots()
        .map((snapshot) => snapshot.docs
          .map((doc) => Product.fromFirestore(doc))        
          .toList());                                     
  }
}
