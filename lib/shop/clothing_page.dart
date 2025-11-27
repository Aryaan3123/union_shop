import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';
import 'package:union_shop/main.dart'; // For ProductCard

class ClothingPage extends StatelessWidget {
  const ClothingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(40.0),
          color: Colors.white,
          child: const Column(
            children: [
              Text(
                'Clothing',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Explore our wide range of clothing options, from casual wear to formal attire. Find the perfect outfit for any occasion!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              )
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
                    childAspectRatio: 0.7,
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
