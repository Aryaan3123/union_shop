import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'services/migration_service.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/collection_screen.dart';
import 'providers/auth_provider.dart';
import 'pages/auth/login_screen.dart';
import 'pages/auth/register_screen.dart';
import 'pages/user/orders_screen.dart';
import 'providers/cart_provider.dart';
import '../pages/cart_screen.dart';

/// Professional app initialization with Firebase and data migration
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('🔥 Firebase initialized successfully');

    // Ensure Firestore has product data before starting the app
    await MigrationService.ensureDataExists();
    print('📱 App initialization complete');

    runApp(const UnionShopApp());
  } catch (e) {
    print('💥 App initialization failed: $e');
    // In production, you might want to show an error screen
    runApp(const ErrorApp());
  }
}

/// Error app shown when initialization fails
class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text('Failed to initialize app', style: TextStyle(fontSize: 18)),
              Text('Please check your internet connection'),
            ],
          ),
        ),
      ),
    );
  }
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Wrap MaterialApp with MultiProvider for multiple providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
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
          '/shop/clothing': (context) =>
              const CollectionScreen(categoryName: 'Clothing'),
          '/shop/merchandise': (context) =>
              const CollectionScreen(categoryName: 'Merchandise'),
          '/shop/signature-essentials': (context) =>
              const CollectionScreen(categoryName: 'Signature Essentials'),
          '/shop/portsmouth-city': (context) =>
              const CollectionScreen(categoryName: 'Portsmouth City'),
          '/shop/pride-collection': (context) =>
              const CollectionScreen(categoryName: 'Pride Collection'),
          '/shop/graduation': (context) =>
              const CollectionScreen(categoryName: 'Graduation'),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/orders': (context) => const OrdersScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
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
          arguments: productData ??
              {
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
