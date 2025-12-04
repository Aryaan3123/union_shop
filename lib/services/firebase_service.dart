import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';
import '../data/product_data.dart';

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
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  // === PROFESSIONAL DATA MANAGEMENT METHODS ===

  /// Add a single product to Firestore with error handling
  static Future<void> addProduct(Product product) async {
    try {
      await _firestore
          .collection('products')
          .doc(product.id)
          .set(product.toMap());
      print('✅ Product added: ${product.title}');
    } catch (e) {
      print('❌ Error adding product ${product.title}: $e');
      rethrow;
    }
  }

  /// Update an existing product in Firestore
  static Future<void> updateProduct(Product product) async {
    try {
      await _firestore
          .collection('products')
          .doc(product.id)
          .update(product.toMap());
      print('✅ Product updated: ${product.title}');
    } catch (e) {
      print('❌ Error updating product ${product.title}: $e');
      rethrow;
    }
  }

  /// Delete a product from Firestore
  static Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
      print('✅ Product deleted: $productId');
    } catch (e) {
      print('❌ Error deleting product $productId: $e');
      rethrow;
    }
  }

  /// Get total count of products (useful for analytics and migration checks)
  static Future<int> getProductCount() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('products').get();
      return snapshot.docs.length;
    } catch (e) {
      print('❌ Error getting product count: $e');
      return 0;
    }
  }

  /// Get product by ID
  static Future<Product?> getProductById(String productId) async {
    try {
      final DocumentSnapshot doc =
          await _firestore.collection('products').doc(productId).get();

      if (doc.exists) {
        return Product.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('❌ Error getting product $productId: $e');
      return null;
    }
  }

  /// Get products with pagination for better performance
  static Future<List<Product>> getProductsPaginated({
    DocumentSnapshot? lastDocument,
    int limit = 20,
  }) async {
    try {
      Query query = _firestore
          .collection('products')
          .orderBy('popularity', descending: true)
          .limit(limit);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final QuerySnapshot snapshot = await query.get();
      return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch (e) {
      print('❌ Error getting paginated products: $e');
      return [];
    }
  }
}
