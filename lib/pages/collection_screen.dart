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
                )
}