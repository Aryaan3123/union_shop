import 'dart:async';
import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';
import 'package:union_shop/main.dart'; // ← Import ProductCard from main

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  void initState() {
    super.initState();
    _pageController = PageController();
    _autoSlide();
  }

  void _autoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < slides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        children: [
          // Hero Section
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),
                // Content overlay
                Positioned(
                  left: 24,
                  right: 24,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'The Print Shack',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Let's create something unique together with our custom printing services -- From £3 for one line of text!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: placeholderCallbackForButtons,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text(
                          'BROWSE PRODUCTS',
                          style: TextStyle(fontSize: 14, letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Products Section
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const Text(
                    'PRODUCTS SECTION',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 2 : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 48,
                    children: const [
                      ProductCard(
                        title: 'Placeholder Product 1',
                        price: '£10.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      ),
                      ProductCard(
                        title: 'Placeholder Product 2',
                        price: '£15.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      ),
                      ProductCard(
                        title: 'Placeholder Product 3',
                        price: '£20.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      ),
                      ProductCard(
                        title: 'Placeholder Product 4',
                        price: '£25.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<CarouselSlide> slides = const [
    CarouselSlide(
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      title: 'The Print Shack',
      subtitle:
          "Let's create something unique together with our custom printing services -- From £3 for one line of text!",
      buttonText: 'BROWSE PRODUCTS',
      route: '/products',
    ),
    CarouselSlide(
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      title: 'Winter Sale!',
      subtitle:
          'Up to 50% off hoodies, sweatshirts and winter essentials. Limited time only!',
      buttonText: 'SHOP SALE',
      route: '/shop/clothing',
    ),
    CarouselSlide(
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      title: 'Portsmouth Pride',
      subtitle:
          'Show your city pride with our exclusive Portsmouth collection. Local designs, global quality.',
      buttonText: 'SHOP COLLECTION',
      route: '/shop/portsmouth-city',
    ),
    CarouselSlide(
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      title: 'Graduation Ready',
      subtitle:
          'Celebrate your achievement with our graduation collection. Perfect for ceremonies and beyond.',
      buttonText: 'SHOP GRADUATION',
      route: '/shop/graduation',
    ),
  ];
}

class CarouselSlide {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final String route;

  const CarouselSlide({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.route,
  });
}
