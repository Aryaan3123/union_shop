import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id; // Unique identifier from Firebase
  final String title; // "Classic Hoodie - Purple"
  final String price; // "£25.00"
  final double priceValue; // 25.00 (for sorting)
  final String category; // "Clothing"
  final int popularity; // 95 (0-100 scale)
  final bool featured; // true/false
  final String imageUrl; // URL to product image

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.priceValue,
    required this.category,
    required this.popularity,
    required this.featured,
    required this.imageUrl,
  });

  // Convert Firebase data into an instance of Product
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      title: data['title'] ?? '',
      price: data['price'] ?? '£0.00',
      priceValue: (data['priceValue'] ?? 0.0).toDouble(),
      category: data['category'] ?? 'Unknown',
      popularity: data['popularity'] ?? 0,
      featured: data['featured'] ?? false,
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'priceValue': priceValue,
      'category': category,
      'popularity': popularity,
      'featured': featured,
      'imageUrl': imageUrl,
    };
  }
}
