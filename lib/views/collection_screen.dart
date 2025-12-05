import 'package:flutter/material.dart';
import '../widgets/page_layout.dart';
import '../services/firebase_service.dart';
import '../services/error_service.dart';
import '../models/product.dart';
import '../main.dart';

class CollectionScreen extends StatefulWidget {
  final String categoryName;

  const CollectionScreen({super.key, required this.categoryName});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  int currentPage = 0;
  int itemsPerPage = 9;
  String currentFilter = 'All';
  String currentSort = 'Popularity';

  Stream<List<Product>> get productStream {
    // First filter by the page's category, then apply additional filters
    Stream<List<Product>> baseStream;

    switch (widget.categoryName) {
      case 'Clothing':
        baseStream = FirebaseService.getProductsByCategorySmart('Clothing');
        break;
      case 'Merchandise':
        baseStream = FirebaseService.getProductsByCategorySmart('Merchandise');
        break;
      case 'Signature Essentials':
        baseStream =
            FirebaseService.getProductsByCategorySmart('Signature Essentials');
        break;
      case 'Portsmouth City':
        baseStream = FirebaseService.getPSUTProducts(); // Already exists
        break;
      case 'Pride Collection':
        baseStream =
            FirebaseService.getProductsByCategorySmart('Pride Collection');
        break;
      case 'Graduation':
        baseStream = FirebaseService.getProductsByCategorySmart('Graduation');
        break;
      case 'SALE':
        baseStream = FirebaseService.getSaleProducts(); // New method needed
        break;
      default:
        baseStream = FirebaseService.getAllProducts();
        break;
    }
    
    // Apply additional filtering based on dropdown selection
    if (currentFilter == 'All') {
      return baseStream;
    } else if (currentFilter == 'Clothing') {
      return FirebaseService.getProductsByCategorySmart('Clothing');
    } else if (currentFilter == 'Merchandise') {
      return FirebaseService.getProductsByCategorySmart('Merchandise');
    } else if (currentFilter == 'Popular') {
      return baseStream.map((products) =>
          products.where((product) => product.popularity >= 80).toList());
    } else if (currentFilter == 'PSUT') {
      return baseStream.map((products) => products
          .where((product) =>
              product.title.toLowerCase().contains('psut') ||
              product.title.toLowerCase().contains('portsmouth'))
          .toList());
    } else {
      return baseStream;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        children: [
          // Restore original clean header style
          Container(
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  widget.categoryName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _getCategoryDescription(widget.categoryName),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ), // Restore original professional filter UI
          Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0,
                vertical: 16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
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
                            fontSize: 16, color: Colors.grey, letterSpacing: 1),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: currentFilter,
                        items: _getFilterOptions().map((String value) {
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
                            fontSize: 16, color: Colors.grey, letterSpacing: 1),
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
                            fontSize: 16, color: Colors.grey, letterSpacing: 1),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: currentFilter,
                        items: _getFilterOptions().map((String value) {
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
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey, letterSpacing: 1),
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
                  ]),
          ),

          // StreamBuilder for FireBase

          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0),
              child: StreamBuilder<List<Product>>(
                stream: productStream,
                builder: (context, snapshot) {
                  // Professional loading state
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(64.0),
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Loading products...',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    );
                  } // Professional error handling with graceful fallback
                  if (snapshot.hasError) {
                    ErrorService.logError('StreamBuilder error', snapshot.error,
                        null, 'CollectionScreen');

                    // If it's a Firebase index error, show a more helpful message
                    if (snapshot.error
                            .toString()
                            .contains('failed-precondition') ||
                        snapshot.error.toString().contains('index')) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(64.0),
                          child: Column(
                            children: [
                              Icon(Icons.cloud_sync,
                                  size: 64, color: Colors.orange[300]),
                              const SizedBox(height: 16),
                              const Text('Setting up database...',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text(
                                  'Firebase is preparing your data. This may take a few minutes.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey[600])),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => setState(() {}),
                                child: const Text('Try Again'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    // For other errors, show generic error
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(64.0),
                        child: Column(
                          children: [
                            Icon(Icons.error_outline,
                                size: 64, color: Colors.red[300]),
                            SizedBox(height: 16),
                            Text('Unable to load products',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text(
                                ErrorService.getFirebaseErrorMessage(
                                    snapshot.error!),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey[600])),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => setState(() {}),
                              child: Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Professional empty state
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(64.0),
                        child: Column(
                          children: [
                            Icon(Icons.inventory_2_outlined,
                                size: 64, color: Colors.grey[400]),
                            SizedBox(height: 16),
                            Text('No products found',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text(
                                'Try adjusting your filters or check back later',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    );
                  }

                  List<Product> products =
                      snapshot.data!; // Get the products from snapshot
                  print(
                      '🔥 DEBUG: Received ${products.length} products from Firebase');
                  for (int i = 0; i < products.length && i < 5; i++) {
                    print(
                        '📦 Product $i: ${products[i].title} (${products[i].category})');
                  }
                  _sortProducts(products);

                  final totalProducts = products.length;
                  final startIndex = currentPage * itemsPerPage;
                  final endIndex =
                      (startIndex + itemsPerPage).clamp(0, products.length);
                  final paginatedProducts =
                      products.sublist(startIndex, endIndex);
                  final totalPages = (totalProducts / itemsPerPage).ceil();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(4),
                          border:
                              Border.all(color: Colors.grey[300]!, width: 1),
                        ),
                        child: Text(
                          '$totalProducts products found',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
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
                            title: product.title,
                            price: product.price,
                            imageUrl: product.imageUrl,
                            productData:
                                product.toMap(), // Pass full product data
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 40),
                      // Pagination Controls
                      if (totalPages > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: currentPage > 0
                                  ? () {
                                      setState(() {
                                        currentPage--;
                                      });
                                    }
                                  : null,
                              tooltip: 'Previous Page',
                            ),
                            const SizedBox(width: 20),
                            Text(
                              'Page ${currentPage + 1} of $totalPages',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: currentPage < totalPages - 1
                                  ? () {
                                      setState(() {
                                        currentPage++;
                                      });
                                    }
                                  : null,
                              tooltip: 'Next Page',
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sortProducts(List<Product> products) {
    switch (currentSort) {
      case 'Featured':
        products.sort((a, b) {
          if (a.featured && !b.featured) return -1;
          if (!a.featured && b.featured) return 1;
          return b.popularity.compareTo(a.popularity);
        });
        break;
      case 'Popularity':
        products.sort((a, b) => b.popularity.compareTo(a.popularity));
        break;
      case 'Price: Low to High':
        products.sort((a, b) => a.priceValue.compareTo(b.priceValue));
        break;
      case 'Price: High to Low':
        products.sort((a, b) => b.priceValue.compareTo(a.priceValue));
        break;
      case 'A-Z':
        products.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case 'Z-A':
        products.sort(
            (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
        break;
      default:
        break;
    }
  }

  List<String> _getFilterOptions() {
    return ['All', 'Clothing', 'Merchandise', 'Popular', 'PSUT'];
  }

  String _getCategoryDescription(String category) {
    switch (category.toLowerCase()) {
      case 'clothing':
        return 'University branded clothing and apparel';
      case 'merchandise':
        return 'University merchandise and accessories';
      case 'signature essentials':
        return 'Essential university items at great prices';
      case 'portsmouth city':
        return 'We\'re excited to launch the Portsmouth City Collection, featuring products by renowned British illustrator Julia Gash, now available in our Students\' Union Shop!';
      case 'pride collection':
        return 'Celebrate diversity and inclusion with our Pride Collection';
      case 'graduation':
        return 'Graduation ceremony essentials and commemorative items';
      case 'sale':
        return 'Don\'t miss out! Get yours before they\'re all gone!';
      default:
        return 'Quality university products';
    }
  }
}
