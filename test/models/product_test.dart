import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('should create a Product instance with all required fields', () {
      // Arrange
      final product = Product(
        id: 'test_id',
        title: 'Test Product',
        price: '£25.00',
        priceValue: 25.00,
        category: 'Test Category',
        popularity: 85,
        featured: true,
        imageUrl: 'https://example.com/image.jpg',
      );

      // Assert
      expect(product.id, 'test_id');
      expect(product.title, 'Test Product');
      expect(product.price, '£25.00');
      expect(product.priceValue, 25.00);
      expect(product.category, 'Test Category');
      expect(product.popularity, 85);
      expect(product.featured, true);
      expect(product.imageUrl, 'https://example.com/image.jpg');
    });

    test('should handle optional fields correctly', () {
      // Arrange
      final product = Product(
        id: 'test_id',
        title: 'Test Product',
        price: '£25.00',
        priceValue: 25.00,
        category: 'Test Category',
        popularity: 85,
        featured: false,
        imageUrl: 'https://example.com/image.jpg',
        onSale: true,
        originalPrice: '£35.00',
        discountPercentage: 25.0,
      );

      // Assert
      expect(product.onSale, true);
      expect(product.originalPrice, '£35.00');
      expect(product.discountPercentage, 25.0);
    });

    test('should convert to and from Map correctly', () {
      // Arrange
      final product = Product(
        id: 'test_id',
        title: 'Test Product',
        price: '£25.00',
        priceValue: 25.00,
        category: 'Test Category',
        popularity: 85,
        featured: true,
        imageUrl: 'https://example.com/image.jpg',
      );

      // Act
      final productMap = product.toMap();
      final reconstructedProduct = Product.fromMap(productMap);

      // Assert
      expect(reconstructedProduct.id, product.id);
      expect(reconstructedProduct.title, product.title);
      expect(reconstructedProduct.price, product.price);
      expect(reconstructedProduct.category, product.category);
    });

    test('should handle edge cases for price values', () {
      // Test zero price
      final freeProduct = Product(
        id: 'free_id',
        title: 'Free Product',
        price: '£0.00',
        priceValue: 0.0,
        category: 'Free',
        popularity: 50,
        featured: false,
        imageUrl: 'https://example.com/free.jpg',
      );

      expect(freeProduct.priceValue, 0.0);
      expect(freeProduct.price, '£0.00');
    });

    test('should validate popularity bounds', () {
      // Test boundary values
      final lowPopularityProduct = Product(
        id: 'low_pop',
        title: 'Low Popularity',
        price: '£10.00',
        priceValue: 10.0,
        category: 'Test',
        popularity: 0,
        featured: false,
        imageUrl: 'https://example.com/low.jpg',
      );

      final highPopularityProduct = Product(
        id: 'high_pop',
        title: 'High Popularity',
        price: '£10.00',
        priceValue: 10.0,
        category: 'Test',
        popularity: 100,
        featured: true,
        imageUrl: 'https://example.com/high.jpg',
      );

      expect(lowPopularityProduct.popularity, 0);
      expect(highPopularityProduct.popularity, 100);
    });
  });
}
