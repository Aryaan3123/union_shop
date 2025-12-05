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

  // Get Products by Category with error handling
  static Stream<List<Product>> getProductsByCategory(String category) {
    // Handle special categories that map to multiple subcategories
    if (category == 'Merchandise') {
      return getProductsByMultipleCategories(
          ['Stationery', 'Accessories', 'Bags', 'Tech']);
    }
    if (category == 'Signature Essentials') {
      return getProductsByMultipleCategories(
          ['Essentials', 'Premium', 'Basics']);
    }

    // Default single category query
    return _firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .orderBy('popularity', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList())
        .handleError((error) {
      print('⚠️ Firestore query failed, using local fallback: $error');
      // Don't rethrow, let the UI handle this gracefully
    });
  }

  // Get Products by Multiple Categories (for complex category mappings)
  static Stream<List<Product>> getProductsByMultipleCategories(
      List<String> categories) {
    return _firestore
        .collection('products')
        .where('category', whereIn: categories)
        .orderBy('popularity', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList())
        .handleError((error) {
      print('⚠️ Firestore multi-category query failed: $error');
    });
  }

  // Fallback method using local data when Firebase isn't ready
  static Stream<List<Product>> getProductsByCategoryFallback(String category) {
    return Stream.fromIterable([
      ProductsData.getAllProducts()
          .where((product) => _matchesCategory(product.category, category))
          .toList()
        ..sort((a, b) => b.popularity.compareTo(a.popularity))
    ]);
  }

  // Smart method that tries Firebase first, falls back to local data
  static Stream<List<Product>> getProductsByCategorySmart(
      String category) async* {
    try {
      // Try Firebase first
      await for (final products in getProductsByCategory(category)) {
        print('Firebase returned ${products.length} products for $category');

        // If we have a good number of products (5+), use Firebase data
        if (products.length >= 5) {
          yield products;
          return;
        }
        // If we have some products but not many, combine with local data
        else if (products.isNotEmpty) {
          final localProducts = ProductsData.getAllProducts()
              .where((product) => _matchesCategory(product.category, category))
              .toList()
            ..sort((a, b) => b.popularity.compareTo(a.popularity));

          // Combine Firebase + Local, removing duplicates by ID
          final combined = <Product>[];
          final seenIds = <String>{};

          // Add Firebase products first
          for (final product in products) {
            if (!seenIds.contains(product.id)) {
              combined.add(product);
              seenIds.add(product.id);
            }
          }

          // Add local products that aren't already included
          for (final product in localProducts) {
            if (!seenIds.contains(product.id)) {
              combined.add(product);
              seenIds.add(product.id);
            }
          }

          print(
              'Packages combined: ${combined.length} products (${products.length} Firebase + ${localProducts.length} local)');
          yield combined;
          return;
        }
      }
    } catch (e) {
      print('Firebase not ready, using local data: $e');
    }

    // Fallback to local data only
    final localProducts = ProductsData.getAllProducts()
        .where((product) => _matchesCategory(product.category, category))
        .toList()
      ..sort((a, b) => b.popularity.compareTo(a.popularity));

    print(
        '📦 Using local fallback: ${localProducts.length} products for $category');
    yield localProducts;
  }

  // Helper method to match categories flexibly
  static bool _matchesCategory(
      String productCategory, String requestedCategory) {
    // Handle category mapping
    switch (requestedCategory) {
      case 'Clothing':
        return productCategory == 'Clothing';
      case 'Merchandise':
        return ['Merchandise', 'Stationery', 'Accessories', 'Bags', 'Tech']
            .contains(productCategory);
      case 'Signature Essentials':
        return ['Essentials', 'Premium', 'Basics'].contains(productCategory);
      default:
        return productCategory == requestedCategory;
    }
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

  // Advanced filtering for specific subcategories
  static Stream<List<Product>> getProductsBySubcategory(
      String category, String subcategory) {
    return getAllProducts().map((products) {
      return products.where((product) {
        // First filter by main category
        if (!_matchesCategory(product.category, category)) return false;

        // Then filter by subcategory based on title keywords
        switch (subcategory.toLowerCase()) {
          case 'hoodies':
            return product.title.toLowerCase().contains('hoodie');
          case 't-shirts':
            return product.title.toLowerCase().contains('t-shirt') ||
                product.title.toLowerCase().contains('tee');
          case 'polo shirts':
            return product.title.toLowerCase().contains('polo');
          case 'jackets':
            return product.title.toLowerCase().contains('jacket');
          case 'stationery':
            return product.category == 'Stationery';
          case 'accessories':
            return product.category == 'Accessories';
          case 'bags':
            return product.category == 'Bags';
          case 'tech':
            return product.category == 'Tech';
          case 'essentials':
            return product.category == 'Essentials';
          case 'premium':
            return product.category == 'Premium';
          case 'basics':
            return product.category == 'Basics';
          case 'popular':
            return product.popularity >= 80;
          default:
            return true;
        }
      }).toList()
        ..sort((a, b) => b.popularity.compareTo(a.popularity));
    });
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

  /// Get Popular Products (popularity >= 80)
  static Stream<List<Product>> getPopularProducts() {
    return _firestore
        .collection('products')
        .where('popularity', isGreaterThanOrEqualTo: 80)
        .orderBy('popularity', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  /// Get PSUT Products (filtering by category 'PSUT')
  static Stream<List<Product>> getPSUTProducts() {
    return _firestore
        .collection('products')
        .where('category', isEqualTo: 'PSUT')
        .orderBy('popularity', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }
}
