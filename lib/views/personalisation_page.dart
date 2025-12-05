import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/providers/cart_provider.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  final _personalisationController = TextEditingController();
  String _selectedLines = 'One Line of Text';

  // Personalisation product data
  final Product _personalisationProduct = Product(
    id: 'personalisation_1',
    title: 'Personalisation',
    price: '£3.00',
    priceValue: 3.00,
    category: 'Print Shack',
    popularity: 95,
    featured: true,
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
  );

  @override
  void dispose() {
    _personalisationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Personalisation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.white,
              child: Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          _personalisationProduct.imageUrl,
                          fit: BoxFit.cover,
                          width: 250,
                          height: 250,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image,
                                color: Colors.grey,
                                size: 60,
                              ),
                            );
                          },
                        ),
                      ),
                      // "YOUR NAME HERE" overlay
                      if (_personalisationController.text.isNotEmpty)
                        Positioned(
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            color: Colors.black.withOpacity(0.7),
                            child: Text(
                              _personalisationController.text.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      else
                        const Positioned(
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Text(
                            'YOUR NAME\nHERE',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // Thumbnails
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildThumbnail(_personalisationProduct.imageUrl, true),
                  const SizedBox(width: 16),
                  _buildThumbnail(_personalisationProduct.imageUrl, false),
                ],
              ),
            ),

            // Product Details
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _personalisationProduct.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _personalisationProduct.price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tax included.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Per Line Dropdown
                  const Text(
                    'Per Line:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedLines,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                          value: 'One Line of Text',
                          child: Text('One Line of Text'),
                        ),
                        DropdownMenuItem(
                          value: 'Two Lines of Text',
                          child: Text('Two Lines of Text'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedLines = value!;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Personalisation Text Input
                  const Text(
                    'Personalisation Line 1:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _personalisationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Enter your text here...',
                    ),
                    onChanged: (value) {
                      setState(() {}); // Refresh to update preview
                    },
                  ),

                  const SizedBox(height: 32),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _personalisationController.text.isNotEmpty
                          ? () => _addToCart(context)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1976D2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: Text(
                        'Add to Cart - ${_personalisationProduct.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(String imageUrl, bool isSelected) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF1976D2) : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(
                Icons.image,
                color: Colors.grey,
                size: 20,
              ),
            );
          },
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    // Create a customized product with personalisation text
    final customProduct = Product(
      id: '${_personalisationProduct.id}_${DateTime.now().millisecondsSinceEpoch}',
      title:
          '${_personalisationProduct.title} - "${_personalisationController.text}"',
      price: _personalisationProduct.price,
      priceValue: _personalisationProduct.priceValue,
      category: _personalisationProduct.category,
      popularity: _personalisationProduct.popularity,
      featured: _personalisationProduct.featured,
      imageUrl: _personalisationProduct.imageUrl,
    );

    // Add to cart with required parameters
    await cartProvider.addToCart(
      product: customProduct,
      color: 'Default',
      size: 'One Size',
      quantity: 1,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Added "${_personalisationController.text}" personalisation to cart'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}