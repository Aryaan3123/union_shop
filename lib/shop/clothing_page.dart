import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';
import 'package:union_shop/main.dart'; // For ProductCard

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(40.0),
          color: Colors.white,
          child: Column(
            children: [
              const Text(
                'Clothing',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Explore our wide range of clothing options, from casual wear to formal attire. Find the perfect outfit for any occasion!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 16.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(children: [
                    Row(children: [
                      const Text(
                        'Filter by',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey, letterSpacing: 1),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: 'All',
                        items: <String>[
                          'All',
                          'Clothing',
                          'Merchandise',
                          'Popular',
                          'PSUT'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle filter change
                        },
                      ),
                    ]),
                    const SizedBox(width: 60),
                    Row(children: [
                      const Text(
                        'Sort by',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey, letterSpacing: 1),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: 'Popularity',
                        items: <String>[
                          'Popularity',
                          'Price: Low to High',
                          'Price: High to Low',
                          'A-Z',
                          'Z-A'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle sort change
                        },
                      )
                    ])
                  ]))
            ],
          ),
        ),

        // Product Grid
        Container(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 48,
                    childAspectRatio: 1.2,
                    children: const [
                      ProductCard(
                          title: 'Classic Hoodie - Purple',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'),
                      ProductCard(
                        title: 'University T-Shirt',
                        price: '£15.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                      ),
                      ProductCard(
                        title: 'Sweatshirt - Green',
                        price: '£23.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      ),
                      ProductCard(
                        title: 'Polo Shirt',
                        price: '£18.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                      ),
                      ProductCard(
                        title: 'Zip-Up Hoodie',
                        price: '£30.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      ),
                      ProductCard(
                        title: 'Long Sleeve Tee',
                        price: '£20.00',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                      ),
                    ])))
      ],
    ));
  }
}
