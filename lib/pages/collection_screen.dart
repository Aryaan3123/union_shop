import 'package:flutter/material.dart';
import '../page_layout.dart';
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
    if (currentFilter == 'All') {
      return FirebaseService.getProductsByCategorySmart(
          widget.categoryName); // Use smart fallback method
    } else if (currentFilter == 'Featured') {
      return FirebaseService.getFeaturedProducts();
    } else {
      return FirebaseService.getProductsByCategorySmart(widget.categoryName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        children: [
          // Dynamic header based on category
          Container(
            width: double.infinity,
            color: const Color(0xFF4d2963),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  widget.categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getCategoryDescription(widget.categoryName),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: currentFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      currentFilter = newValue!;
                      currentPage = 0; // Reset pagination
                    });
                  },
                  items: <String>['All', 'Featured']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: currentSort,
                  onChanged: (String? newValue) {
                    setState(() {
                      currentSort = newValue!;
                      currentPage = 0;
                    });
                  },
                  items: <String>[
                    'Popularity',
                    'Featured',
                    'Price: Low to High',
                    'Price: High to Low',
                    'Name: A-Z',
                    'Name: Z-A'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
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
                  }                  // Professional error handling with graceful fallback
                  if (snapshot.hasError) {
                    ErrorService.logError('StreamBuilder error', snapshot.error,
                        null, 'CollectionScreen');
                    
                    // If it's a Firebase index error, show a more helpful message
                    if (snapshot.error.toString().contains('failed-precondition') || 
                        snapshot.error.toString().contains('index')) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(64.0),
                          child: Column(
                            children: [
                              Icon(Icons.cloud_sync, size: 64, color: Colors.orange[300]),
                              SizedBox(height: 16),
                              Text('Setting up database...',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text('Firebase is preparing your data. This may take a few minutes.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey[600])),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => setState(() {}),
                                child: Text('Try Again'),
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
                  _sortProducts(products);

                  final totalProducts = products.length;
                  final startIndex = currentPage * itemsPerPage;
                  final endIndex =
                      (startIndex + itemsPerPage).clamp(0, products.length);
                  final paginatedProducts =
                      products.sublist(startIndex, endIndex);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$totalProducts Products Found'),
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
      case 'Name: A-Z':
        products.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case 'Name: Z-A':
        products.sort(
            (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
        break;
      default:
        break;
    }
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
        return 'Portsmouth City collection items';
      case 'pride collection':
        return 'Pride month celebration items';
      case 'graduation':
        return 'Graduation ceremony essentials';
      default:
        return 'Quality university products';
    }
  }
}
