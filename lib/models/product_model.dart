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
}
