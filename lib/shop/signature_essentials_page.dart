import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';
import 'package:union_shop/main.dart';

class SignatureEssentialsPage extends StatefulWidget {
  const SignatureEssentialsPage({super.key});

  @override
  State<SignatureEssentialsPage> createState() => _SignatureEssentialsPageState();
}

class _SignatureEssentialsPageState extends State<SignatureEssentialsPage> {
  int currentPage = 0;
  int itemsPerPage = 9;

  String currentFilter = 'All';
  String currentSort = 'Popularity';
  
  final List<Map<String, dynamic>> allProducts = [
    {
      'title': 'Essential University Hoodie',
      'price': '£29.99',
      'priceValue': 29.99,
      'category': 'Essentials',
      'popularity': 95,
      'featured': true,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium Leather Notebook',
      'price': '£24.99',
      'priceValue': 24.99,
      'category': 'Premium',
      'popularity': 88,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basic Campus T-Shirt',
      'price': '£12.99',
      'priceValue': 12.99,
      'category': 'Basics',
      'popularity': 75,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Essential Water Bottle',
      'price': '£15.99',
      'priceValue': 15.99,
      'category': 'Essentials',
      'popularity': 92,
      'featured': true,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium Varsity Jacket',
      'price': '£49.99',
      'priceValue': 49.99,
      'category': 'Premium',
      'popularity': 89,
      'featured': true,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basic Drawstring Bag',
      'price': '£8.99',
      'priceValue': 8.99,
      'category': 'Basics',
      'popularity': 71,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Essential Study Planner',
      'price': '£18.99',
      'priceValue': 18.99,
      'category': 'Essentials',
      'popularity': 84,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium Coffee Mug',
      'price': '£16.99',
      'priceValue': 16.99,
      'category': 'Premium',
      'popularity': 86,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basic Ballpoint Pens',
      'price': '£4.99',
      'priceValue': 4.99,
      'category': 'Basics',
      'popularity': 68,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Essential Laptop Sleeve',
      'price': '£22.99',
      'priceValue': 22.99,
      'category': 'Essentials',
      'popularity': 90,
      'featured': true,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium University Scarf',
      'price': '£19.99',
      'priceValue': 19.99,
      'category': 'Premium',
      'popularity': 83,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basic Sticky Notes',
      'price': '£3.99',
      'priceValue': 3.99,
      'category': 'Basics',
      'popularity': 64,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Essential Campus Backpack',
      'price': '£35.99',
      'priceValue': 35.99,
      'category': 'Essentials',
      'popularity': 94,
      'featured': true,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium Leather Wallet',
      'price': '£32.99',
      'priceValue': 32.99,
      'category': 'Premium',
      'popularity': 87,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basic Highlighters Set',
      'price': '£6.99',
      'priceValue': 6.99,
      'category': 'Basics',
      'popularity': 72,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Essential Phone Charger',
      'price': '£14.99',
      'priceValue': 14.99,
      'category': 'Essentials',
      'popularity': 91,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium Wool Beanie',
      'price': '£21.99',
      'priceValue': 21.99,
      'category': 'Premium',
      'popularity': 85,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basic Notebook Pack',
      'price': '£9.99',
      'priceValue': 9.99,
      'category': 'Basics',
      'popularity': 69,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Essential University Lanyard',
      'price': '£7.99',
      'priceValue': 7.99,
      'category': 'Essentials',
      'popularity': 82,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Premium Travel Mug',
      'price': '£26.99',
      'priceValue': 26.99,
      'category': 'Premium',
      'popularity': 88,
      'featured': false,
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    }
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (currentFilter == 'All') {
      return allProducts;
    }

    if (currentFilter == 'Popular') {
      return allProducts.where((product) => product['popularity'] >= 80).toList();
    }

    return allProducts.where((product) => product['category'] == currentFilter).toList();
  }

  List<Map<String, dynamic>> get sortedProducts {
    List<Map<String, dynamic>> products = List.from(filteredProducts);
    
    switch (currentSort) {
      case 'Featured':
        products.sort((a, b) {
          if (a['featured'] && !b['featured']) return -1;
          if (!a['featured'] && b['featured']) return 1;
          return b['popularity'].compareTo(a['popularity']);
        });
        break;
      case 'Popularity':
        products.sort((a, b) => b['popularity'].compareTo(a['popularity']));
        break;
      case 'Price: Low to High':
        products.sort((a, b) => a['priceValue'].compareTo(b['priceValue']));
        break;
      case 'Price: High to Low':
        products.sort((a, b) => b['priceValue'].compareTo(a['priceValue']));
        break;
      case 'A-Z':
        products.sort((a, b) => a['title'].compareTo(b['title']));
        break;
      case 'Z-A':
        products.sort((a, b) => b['title'].compareTo(a['title']));
        break;
    }
    
    return products;
  }

  List<Map<String, dynamic>> get paginatedProducts {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;

    if (endIndex > sortedProducts.length) {
      endIndex = sortedProducts.length;
    }

    return sortedProducts.sublist(startIndex, endIndex);
  }

  int getTotalPages() {
    return (sortedProducts.length / itemsPerPage).ceil();
  }

  void goToNextPage() {
    if (currentPage < getTotalPages() - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  void goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void goToSpecificPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < getTotalPages()) {
      setState(() {
        currentPage = pageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0),
          color: Colors.white,
          child: Column(
            children: [
              const Text(
                'Signature Essentials',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Discover our curated collection of essential items that define the university experience. Premium quality, timeless style.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0,
                      vertical: 16.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: MediaQuery.of(context).size.width > 600
                      ? Row(children: [
                          Row(children: [
                            const Text(
                              'Filter by',
                              style: TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: currentFilter,
                              items: <String>[
                                'All',
                                'Essentials',
                                'Premium',
                                'Basics',
                                'Popular'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentFilter = newValue ?? 'All';
                                  currentPage = 0;
                                });
                              },
                            ),
                          ]),
                          const SizedBox(width: 60),
                          Row(children: [
                            const Text(
                              'Sort by',
                              style: TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: currentSort,
                              items: <String>[
                                'Featured',
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
                                setState(() {
                                  currentSort = newValue ?? 'Featured';
                                  currentPage = 0;
                                });
                              },
                            )
                          ])
                        ])
                      : Column(children: [
                          Row(children: [
                            const Text(
                              'Filter by',
                              style: TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: currentFilter,
                              items: <String>[
                                'All',
                                'Essentials',
                                'Premium',
                                'Basics',
                                'Popular'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentFilter = newValue ?? 'All';
                                  currentPage = 0;
                                });
                              },
                            ),
                          ]),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Text(
                              'Sort by',
                              style: TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: currentSort,
                              items: <String>[
                                'Featured',
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
                                setState(() {
                                  currentSort = newValue ?? 'Featured';
                                  currentPage = 0;
                                });
                              },
                            )
                          ])
                        ]))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0,
            vertical: 12.0
          ),
          color: Colors.white,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Text(
                  '${filteredProducts.length} products found',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                    crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 24 : 12,
                    mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 48 : 24,
                    childAspectRatio: 1.2,
                    children: paginatedProducts.map((product) {
                      return ProductCard(
                        title: product['title']!,
                        price: product['price']!,
                        imageUrl: product['imageUrl']!,
                        productData: product,
                      );
                    }).toList()))),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: currentPage > 0 ? goToPreviousPage : null,
                tooltip: 'Previous Page',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Page ${currentPage + 1} of ${getTotalPages()}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: currentPage < getTotalPages() - 1 ? goToNextPage : null,
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Next Page',
              )
            ],
          ),
        ),
      ],
    ));
  }
}