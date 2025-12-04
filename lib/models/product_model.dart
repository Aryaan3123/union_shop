class Product {
  final String id;
  final String title;
  final double price;
  final List<String> imageUrls;
  final List<String> colors;
  final List<String> sizes;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrls,
    required this.colors,
    required this.sizes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrls': imageUrls,
      'colors': colors,
      'sizes': sizes,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      colors: List<String>.from(map['colors'] ?? []),
      sizes: List<String>.from(map['sizes'] ?? []),
    );
  }
}
