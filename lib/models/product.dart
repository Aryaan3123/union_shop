import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // Core identification
  final String id;
  final String title;
  
  // Price handling (dual format support)
  final String price;           // "£25.00" for display
  final double priceValue;      // 25.0 for calculations/sorting
  
  // Firebase/display fields
  final String category;        // "Clothing", "Merchandise"
  final int popularity;         // 0-100 rating
  final bool featured;          // featured product flag
  
  // Cart/variant fields  
  final List<String> colors;    // ["Default"] or ["Red", "Blue"]
  final List<String> sizes;     // ["One Size"] or ["S", "M", "L"]
  
  // Image handling (support both single and multiple)
  final String imageUrl;        // Primary image for backward compatibility
  final List<String> imageUrls; // All product images

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.priceValue,
    required this.category,
    required this.popularity,
    required this.featured,
    required this.imageUrl,
    this.colors = const ['Default'],
    this.sizes = const ['One Size'],
    List<String>? imageUrls,
  }) : imageUrls = imageUrls ?? [imageUrl];

  // Convert Firebase DocumentSnapshot to Product
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final imageUrl = data['imageUrl'] ?? '';
    
    return Product(
      id: doc.id,
      title: data['title'] ?? '',
      price: data['price'] ?? '£0.00',
      priceValue: (data['priceValue'] ?? 0.0).toDouble(),
      category: data['category'] ?? 'Unknown',
      popularity: data['popularity'] ?? 0,
      featured: data['featured'] ?? false,
      imageUrl: imageUrl,
      colors: data['colors']?.cast<String>() ?? ['Default'],
      sizes: data['sizes']?.cast<String>() ?? ['One Size'],
      imageUrls: data['imageUrls']?.cast<String>() ?? [imageUrl],
    );
  }

  // Convert Map to Product (for cart/local storage)
  factory Product.fromMap(Map<String, dynamic> map) {
    final imageUrl = map['imageUrl'] ?? '';
    
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: map['price'] ?? '£0.00',
      priceValue: (map['priceValue'] ?? map['price'] ?? 0).toDouble(),
      category: map['category'] ?? 'Unknown',
      popularity: map['popularity'] ?? 0,
      featured: map['featured'] ?? false,
      imageUrl: imageUrl,
      colors: List<String>.from(map['colors'] ?? ['Default']),
      sizes: List<String>.from(map['sizes'] ?? ['One Size']),
      imageUrls: List<String>.from(map['imageUrls'] ?? [imageUrl]),
    );
  }

  // Convert Product to Map (for Firestore/storage)
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
      'colors': colors,
      'sizes': sizes,
      'imageUrls': imageUrls,
    };
  }
}