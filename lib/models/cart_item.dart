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
}
