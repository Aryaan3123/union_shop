import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';
import 'package:union_shop/main.dart'; // For ProductCard

class MerchandisePage extends StatefulWidget {
  const MerchandisePage({super.key});

  @override
  State<MerchandisePage> createState() => _MerchandisePageState();
}

class _MerchandisePageState extends State<MerchandisePage> {
  int currentPage = 0;
  int itemsPerPage = 9;

  String currentFilter = 'All';
  String currentSort = 'Popularity';
  final List<Map<String, dynamic>> allProducts = [
    // Stationery Products (Page 1 - items 0-8):
    {
      'title': 'University Notebook - Ruled',
      'price': '£8.99',
      'priceValue': 8.99,
      'category': 'Stationery',
      'popularity': 92,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Pen Set - Blue',
      'price': '£12.50',
      'priceValue': 12.50,
      'category': 'Stationery',
      'popularity': 87,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Keychain - Metal',
      'price': '£4.99',
      'priceValue': 4.99,
      'category': 'Accessories',
      'popularity': 95,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Tote Bag - Canvas',
      'price': '£15.99',
      'priceValue': 15.99,
      'category': 'Bags',
      'popularity': 89,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University USB Drive - 16GB',
      'price': '£18.99',
      'priceValue': 18.99,
      'category': 'Tech',
      'popularity': 84,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Folder Set - A4',
      'price': '£6.99',
      'priceValue': 6.99,
      'category': 'Stationery',
      'popularity': 78,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Pin Badge Set',
      'price': '£9.99',
      'priceValue': 9.99,
      'category': 'Accessories',
      'popularity': 91,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Backpack - Navy',
      'price': '£35.99',
      'priceValue': 35.99,
      'category': 'Bags',
      'popularity': 93,
      'featured': true,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Highlighter Set',
      'price': '£7.50',
      'priceValue': 7.50,
      'category': 'Stationery',
      'popularity': 75,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    // Page 2 products (9-17):
    {
      'title': 'Campus Phone Case - Clear',
      'price': '£14.99',
      'priceValue': 14.99,
      'category': 'Tech',
      'popularity': 88,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Magnet Set',
      'price': '£5.99',
      'priceValue': 5.99,
      'category': 'Accessories',
      'popularity': 72,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Diary - 2024',
      'price': '£11.99',
      'priceValue': 11.99,
      'category': 'Stationery',
      'popularity': 82,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Laptop Sleeve',
      'price': '£22.99',
      'priceValue': 22.99,
      'category': 'Tech',
      'popularity': 85,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Drawstring Bag',
      'price': '£12.99',
      'priceValue': 12.99,
      'category': 'Bags',
      'popularity': 79,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Lanyard - Woven',
      'price': '£3.99',
      'priceValue': 3.99,
      'category': 'Accessories',
      'popularity': 86,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Calculator - Scientific',
      'price': '£24.99',
      'priceValue': 24.99,
      'category': 'Tech',
      'popularity': 81,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'University Sticky Notes Set',
      'price': '£4.50',
      'priceValue': 4.50,
      'category': 'Stationery',
      'popularity': 77,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Water Bottle - Steel',
      'price': '£19.99',
      'priceValue': 19.99,
      'category': 'Accessories',
      'popularity': 90,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    // Page 3 products (18-19):
    {
      'title': 'University Eraser Set - Fancy',
      'price': '£3.50',
      'priceValue': 3.50,
      'category': 'Stationery',
      'popularity': 74,
      'featured': false,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'
    },
    {
      'title': 'Campus Power Bank - Portable',
      'price': '£29.99',
      'priceValue': 29.99,
      'category': 'Tech',
      'popularity': 94,
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
      return allProducts
          .where((product) => product['popularity'] >= 80)
          .toList();
    }

    return allProducts
        .where((product) => product['category'] == currentFilter)
        .toList();
  }

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

  