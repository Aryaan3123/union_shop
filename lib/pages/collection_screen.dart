import 'package:flutter/material.dart';
import '../page_layout.dart';                    
import '../services/firebase_service.dart';      
import '../models/product.dart';                 
import '../main.dart';  

class CollectionScreen extends StatefulWidget{
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
      return FirebaseService.getProductsByCategory(widget.categoryName);  // Use the category passed in
    } else if (currentFilter == 'Featured') {
      return FirebaseService.getFeaturedProducts();
    } else {
      return FirebaseService.getProductsByCategory(widget.categoryName);
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
                      currentPage = 0;           // Reset pagination
                    });
                  },
                  items: <String>['All', 'Featured']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
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
                  items: <String>['Popularity', 'Featured', 'Price: Low to High', 'Price: High to Low', 'Name: A-Z', 'Name: Z-A']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
          ),

          // StreamBuilder for FireBase

          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width > 600 ? 40.0 : 16.0),
              child: StreamBuilder<List<Product>>(
                stream: productStream, 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()); // Loading icon
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}')); // Error handling
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found')); // No data handling
                  }

                  List<Product> products = snapshot.data!; // Get the products from snapshot
                  _sortProducts(products);

                
                  final totalProducts = products.length;
                  final startIndex = currentPage * itemsPerPage;
                  final endIndex = (startIndex + itemsPerPage).clamp(0, products.length);
                  final paginatedProducts = products.sublist(startIndex, endIndex);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$totalProducts Products Found'),

                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                        crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 24 : 12,
                        mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 48 : 24,
                        childAspectRatio: 1.2,
                        children: paginatedProducts.map((product) {
                          return ProductCard(
                            title: product.title,
                            price: product.price,
                            imageUrl: product.imageUrl,
                            productData: product.toMap(), // Pass full product data
                          );
                        }).toList(),

                      )
                    ]
                  )
                }
              )
            )
          )


  }
}