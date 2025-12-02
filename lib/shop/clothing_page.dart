import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';
import 'package:union_shop/main.dart'; // For ProductCard

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  int currentPage = 0;
  int itemsPerPage = 9;

  String currentFilter = 'All';
  String currentSort = 'Popularity';
  final List<Map<String, dynamic>> allProducts = [
    // Page 1 products (0-8):
    {
      'title': 'Classic Hoodie - Purple',
      'price': '£25.00',
      'priceValue': 25.00, // For numeric sorting
      'category': 'Clothing', // For filtering
      'popularity': 95, // For popularity sorting (0-100)
      'featured': true, // For featured sorting
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University T-Shirt',
      'price': '£15.00',
      'priceValue': 15.00,
      'category': 'Merchandise',
      'popularity': 87,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Sweatshirt - Green',
      'price': '£23.00',
      'priceValue': 23.00,
      'category': 'Clothing',
      'popularity': 76,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Polo Shirt',
      'price': '£18.00',
      'priceValue': 18.00,
      'category': 'Clothing',
      'popularity': 82,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Zip-Up Hoodie',
      'price': '£30.00',
      'priceValue': 30.00,
      'category': 'Clothing',
      'popularity': 91,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Long Sleeve Tee',
      'price': '£20.00',
      'priceValue': 20.00,
      'category': 'Clothing',
      'popularity': 74,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Sports Jacket',
      'price': '£45.00',
      'priceValue': 45.00,
      'category': 'Clothing',
      'popularity': 88,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Casual Shorts',
      'price': '£16.00',
      'priceValue': 16.00,
      'category': 'Clothing',
      'popularity': 69,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Varsity Sweater',
      'price': '£35.00',
      'priceValue': 35.00,
      'category': 'Merchandise',
      'popularity': 93,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    }, // Page 2 products (9-17):
    {
      'title': 'Denim Jacket',
      'price': '£40.00',
      'priceValue': 40.00,
      'category': 'Clothing',
      'popularity': 85,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Track Pants',
      'price': '£22.00',
      'priceValue': 22.00,
      'category': 'Clothing',
      'popularity': 78,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Graphic Tee',
      'price': '£14.00',
      'priceValue': 14.00,
      'category': 'Merchandise',
      'popularity': 89,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Bomber Jacket',
      'price': '£38.00',
      'priceValue': 38.00,
      'category': 'Clothing',
      'popularity': 92,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Cargo Shorts',
      'price': '£19.00',
      'priceValue': 19.00,
      'category': 'Clothing',
      'popularity': 73,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Henley Shirt',
      'price': '£21.00',
      'priceValue': 21.00,
      'category': 'Clothing',
      'popularity': 79,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Fleece Pullover',
      'price': '£28.00',
      'priceValue': 28.00,
      'category': 'Clothing',
      'popularity': 84,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Basketball Shorts',
      'price': '£17.00',
      'priceValue': 17.00,
      'category': 'Clothing',
      'popularity': 71,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Crew Neck Sweatshirt',
      'price': '£26.00',
      'priceValue': 26.00,
      'category': 'Merchandise',
      'popularity': 86,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },

    // Page 3 products (18-19):
    {
      'title': 'Windbreaker',
      'price': '£33.00',
      'priceValue': 33.00,
      'category': 'Clothing',
      'popularity': 77,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Thermal Shirt',
      'price': '£24.00',
      'priceValue': 24.00,
      'category': 'PSUT',
      'popularity': 81,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
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
  // Function 1: Calculate which products to show on current page

  List<Map<String, dynamic>> get paginatedProducts {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;

    if (endIndex > allProducts.length) {
      endIndex = allProducts.length;
    }

    return allProducts.sublist(startIndex, endIndex);
  }

  int getTotalPages() {
    return (allProducts.length / itemsPerPage).ceil();
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
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0),
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
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0,
                      vertical: 16.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: MediaQuery.of(context).size.width > 600
                      ? Row(children: [
                          // Desktop: Side-by-side layout
                          Row(children: [
                            const Text(
                              'Filter by',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  letterSpacing: 1),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: currentFilter,
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
                                setState(() {
                                  currentFilter = newValue ?? 'All';
                                  currentPage = 0; // Reset to first page
                                });
                              },
                            ),
                          ]),
                          const SizedBox(width: 60),
                          Row(children: [
                            const Text(
                              'Sort by',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  letterSpacing: 1),
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
                                // Handle sort change
                                setState(() {
                                  currentSort = newValue ?? 'Featured';
                                  currentPage = 0; // Reset to first page
                                });
                              },
                            )
                          ])
                        ])
                      : Column(children: [
                          // Mobile: Stacked vertically
                          Row(children: [
                            const Text(
                              'Filter by',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  letterSpacing: 1),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: currentFilter,
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
                                setState(() {
                                  currentFilter = newValue ?? 'All';
                                  currentPage =
                                      0; // Reset to first page when filtering
                                });
                              },
                            ),
                          ]),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Text(
                              'Sort by',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  letterSpacing: 1),
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
                                  currentPage =
                                      0; // Reset to first page when sorting
                                });
                              },
                            )
                          ])
                        ]))
            ],
          ),
        ), 
        
        Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0, 
          vertical: 12.0
          ),
          child: Text(
            '${filteredProducts.length} products found',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        // Product Grid
        Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 3 : 2,
                    crossAxisSpacing:
                        MediaQuery.of(context).size.width > 600 ? 24 : 12,
                    mainAxisSpacing:
                        MediaQuery.of(context).size.width > 600 ? 48 : 24,
                    childAspectRatio: 1.2,
                    children: paginatedProducts.map((product) {
                      return ProductCard(
                        title: product['title']!,
                        price: product['price']!,
                        imageUrl: product['imageUrl']!,
                      );
                    }).toList()))),
        // Pagination Controls
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
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

              // Next Page Button
              IconButton(
                onPressed:
                    currentPage < getTotalPages() - 1 ? goToNextPage : null,
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
