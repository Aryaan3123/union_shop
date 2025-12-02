import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> productData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String title = productData?['title'] ?? 'Placeholder Product Name';
    final String price = productData?['price'] ?? '£15.00';
    final String imageUrl = productData?['imageUrl'] ??
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282';
    final String category = productData?['category'] ?? 'Unknown Category';
    final int popularity = productData?['popularity'] ?? 0;
    final bool featured = productData?['featured'] ?? false;

    return PageLayout(
      child: Column(
        children: [
          // Product details
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Image unavailable',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Product name
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                Row(children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  if (featured)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.amber,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ]),

                const SizedBox(height: 16),

                // Product price
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4d2963),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Popularity: $popularity/100', // ✅ NEW: Shows actual popularity rating from product data
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Product description
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getProductDescription(category, title),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // Footer
          Container(
            width: double.infinity,
            color: Colors.grey[50],
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title added to cart!'),
                      backgroundColor: const Color(0xFF4d2963),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

String _getProductDescription(String category, String title) {
  switch (category.toLowerCase()) {
    case 'clothing':
      return 'High-quality apparel perfect for representing your university style. Comfortable, durable, and designed for everyday wear.';
    case 'merchandise':
    case 'stationery':
      return 'Essential university merchandise to support your academic journey. Perfect for students, staff, and university supporters.';
    case 'accessories':
      return 'Stylish accessories to complement your university lifestyle. Perfect for adding a touch of university pride to your daily routine.';
    case 'bags':
      return 'Practical and stylish bags designed for university life. Durable construction with ample space for all your academic needs.';
    case 'tech':
      return 'University-branded tech accessories to enhance your digital lifestyle. Perfect for students and tech enthusiasts.';
    case 'essentials':
      return 'Core items every university student needs. Carefully selected for quality, functionality, and university pride.';
    case 'premium':
      return 'Premium quality university merchandise for those who appreciate the finest details. Exceptional craftsmanship and materials.';
    case 'basics':
      return 'Fundamental university items at accessible prices. Great value without compromising on quality or style.';
    default:
      return 'Quality university merchandise designed to represent your academic institution with pride and style.';
  }
}
