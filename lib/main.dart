import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';   
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/collection_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        scrollbars: false,
      ),
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/shop/clothing': (context) => const CollectionScreen(categoryName: 'Clothing'),
        '/shop/merchandise': (context) => const CollectionScreen(categoryName: 'Merchandise'),
        '/shop/signature-essentials': (context) => const CollectionScreen(categoryName: 'Signature Essentials'),
        '/shop/portsmouth-city': (context) => const CollectionScreen(categoryName: 'Portsmouth City'),
        '/shop/pride-collection': (context) => const CollectionScreen(categoryName: 'Pride Collection'),
        '/shop/graduation': (context) => const CollectionScreen(categoryName: 'Graduation'),
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final Map<String, dynamic>? productData;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, 
          '/product',
          arguments: productData ?? {
            'title': title,
            'price': price,
            'imageUrl': imageUrl,
            'category': 'Unknown',
            'popularity': 0,
            'featured': false,
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child:
                          Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
