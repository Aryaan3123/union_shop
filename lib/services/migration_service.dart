import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';
import '../models/product_data.dart';

/// Professional data migration service for Firebase Firestore
/// Ensures database initialization and maintains data integrity
class MigrationService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static bool _migrationComplete = false;

  /// Ensures the Firestore database has initial product data
  /// Only runs migration if database is empty and migration hasn't been completed yet
  static Future<void> ensureDataExists() async {
    if (_migrationComplete) return;
    
    try {
      print('🔍 Checking Firestore database status...');
      
      // Check if products already exist in Firestore
      final QuerySnapshot snapshot = await _firestore
          .collection('products')
          .limit(1)
          .get();
      
      if (snapshot.docs.isEmpty) { 
        print('📦 Database is empty. Starting migration...');
        await _migrateInitialProducts();
        print('✅ Migration completed successfully!');
      } else {
        print('✅ Database already contains products. Skipping migration.');
      }
      
      _migrationComplete = true;
    } catch (e) {
      print('❌ Migration failed: $e');
      rethrow; // Re-throw to handle in main app initialization
    }
  }

  /// Migrates all products from local data to Firestore using batch operations
  /// for optimal performance and atomicity
  static Future<void> _migrateInitialProducts() async {
    final List<Product> products = ProductsData.getAllProducts();
    
    if (products.isEmpty) {
      print('⚠️ No products found in local data to migrate');
      return;
    }
    
    // Use batch operations for better performance and atomicity
    WriteBatch batch = _firestore.batch();
    
    for (Product product in products) {
      DocumentReference docRef = _firestore
          .collection('products')
          .doc(product.id);
      
      batch.set(docRef, product.toMap());
    }
    
    // Execute all writes atomically
    await batch.commit();
    print('📱 Successfully migrated ${products.length} products to Firestore');
  }

  /// Force re-migration (useful for development/testing)
  /// WARNING: This will overwrite existing data
  static Future<void> forceMigration() async {
    _migrationComplete = false;
    print('🔄 Forcing data migration...');
    await _migrateInitialProducts();
    _migrationComplete = true;
  }

  /// Get migration status
  static bool get isMigrationComplete => _migrationComplete;
}
