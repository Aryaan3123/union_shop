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
}