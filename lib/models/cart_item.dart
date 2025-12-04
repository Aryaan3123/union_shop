class CartItem {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  final String color;
  final String size;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.color,
    required this.size,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'color': color,
      'size': size,
      'imageUrl': imageUrl,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] ?? '',
      productId: map['productId'] ?? '',
      title: map['title'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 0,
      color: map['color'] ?? '',
      size: map['size'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  double get totalPrice => price * quantity;
}
