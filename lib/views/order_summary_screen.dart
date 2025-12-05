import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/providers/cart_provider.dart';
import 'package:union_shop/providers/order_provider.dart';
import 'package:union_shop/models/order.dart';
import 'package:union_shop/views/order_confirmation_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _discountController = TextEditingController();
  final _orderNoteController = TextEditingController();

  // Shipping address controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedCountry = 'United Kingdom';
  String? _discountCode;
  double _discountAmount = 0.0;
  bool _isProcessing = false;

  @override
  void dispose() {
    _discountController.dispose();
    _orderNoteController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _applyDiscountCode() {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final discount =
        orderProvider.validateDiscountCode(_discountController.text);

    if (discount != null) {
      final cartProvider = Provider.of<CartProvider>(context, listen: false);
      setState(() {
        _discountCode = _discountController.text.toUpperCase();
        _discountAmount = discount * cartProvider.totalAmount;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Discount code applied! You saved £${_discountAmount.toStringAsFixed(2)}'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid discount code'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _removeDiscountCode() {
    setState(() {
      _discountCode = null;
      _discountAmount = 0.0;
      _discountController.clear();
    });
  }

  Future<void> _processOrder() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isProcessing = true;
    });

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    try {
      // Create shipping address
      final shippingAddress = ShippingAddress(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address1: _address1Controller.text.trim(),
        address2: _address2Controller.text.trim(),
        city: _cityController.text.trim(),
        postalCode: _postalCodeController.text.trim(),
        country: _selectedCountry,
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
      );

      // Create order
      final orderId = await orderProvider.createOrder(
        cartItems: cartProvider.items,
        shippingAddress: shippingAddress,
        subtotal: cartProvider.totalAmount,
        discountCode: _discountCode,
        orderNote: _orderNoteController.text.trim().isEmpty
            ? null
            : _orderNoteController.text.trim(),
      );

      if (orderId != null) {
        // Clear cart after successful order
        await cartProvider.clearCart();

        // Navigate to confirmation screen
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OrderConfirmationScreen(orderId: orderId),
            ),
          );
        }
      } else {
        throw Exception('Failed to create order');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error processing order: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer2<CartProvider, OrderProvider>(
        builder: (context, cartProvider, orderProvider, child) {
          if (cartProvider.items.isEmpty) {
            return const Center(
              child: Text(
                'No items in cart',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final subtotal = cartProvider.totalAmount;
          final shippingCost = orderProvider.calculateShippingCost(subtotal);
          final finalTotal = subtotal + shippingCost - _discountAmount;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Order items summary
                        _buildOrderSummary(cartProvider),

                        const SizedBox(height: 24),

                        // Discount code section
                        _buildDiscountSection(),

                        const SizedBox(height: 24),

                        // Shipping address form
                        _buildShippingForm(),

                        const SizedBox(height: 24),

                        // Order note
                        _buildOrderNote(),
                      ],
                    ),
                  ),
                ),

                // Order total and checkout button
                _buildCheckoutBottom(subtotal, shippingCost, finalTotal),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderSummary(CartProvider cartProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...cartProvider.items
            .map((item) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.3)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: item.imageUrl.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.image_not_supported),
                                ),
                              )
                            : const Icon(Icons.image_not_supported),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${item.color} • ${item.size} • Qty: ${item.quantity}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '£${item.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildDiscountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Discount Code',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        if (_discountCode != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Code "$_discountCode" applied - You saved £${_discountAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  onPressed: _removeDiscountCode,
                  icon: const Icon(Icons.close, color: Colors.green, size: 20),
                ),
              ],
            ),
          )
        else
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _discountController,
                  decoration: const InputDecoration(
                    hintText: 'Enter discount code',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                  textCapitalization: TextCapitalization.characters,
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _discountController.text.isEmpty
                    ? null
                    : _applyDiscountCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child:
                    const Text('Apply', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        const SizedBox(height: 8),
        const Text(
          'Try: WELCOME10, SAVE20, or STUDENT15',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildShippingForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping Address',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value?.trim().isEmpty ?? true ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value?.trim().isEmpty ?? true ? 'Required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _address1Controller,
          decoration: const InputDecoration(
            labelText: 'Address *',
            border: OutlineInputBorder(),
          ),
          validator: (value) =>
              value?.trim().isEmpty ?? true ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _address2Controller,
          decoration: const InputDecoration(
            labelText: 'Apartment, suite, etc. (optional)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'City *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value?.trim().isEmpty ?? true ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _postalCodeController,
                decoration: const InputDecoration(
                  labelText: 'Postal Code *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value?.trim().isEmpty ?? true ? 'Required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _selectedCountry,
          decoration: const InputDecoration(
            labelText: 'Country *',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(
                value: 'United Kingdom', child: Text('United Kingdom')),
            DropdownMenuItem(value: 'Ireland', child: Text('Ireland')),
            DropdownMenuItem(
                value: 'United States', child: Text('United States')),
            DropdownMenuItem(value: 'Canada', child: Text('Canada')),
            DropdownMenuItem(value: 'Australia', child: Text('Australia')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedCountry = value!;
            });
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _phoneController,
          decoration: const InputDecoration(
            labelText: 'Phone Number (optional)',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildOrderNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Notes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _orderNoteController,
          decoration: const InputDecoration(
            hintText: 'Special instructions for your order (optional)',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildCheckoutBottom(
      double subtotal, double shippingCost, double finalTotal) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal'),
              Text('£${subtotal.toStringAsFixed(2)}'),
            ],
          ),
          if (_discountAmount > 0) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount ($_discountCode)',
                    style: const TextStyle(color: Colors.green)),
                Text('-£${_discountAmount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green)),
              ],
            ),
          ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping ${shippingCost == 0 ? '(Free)' : ''}'),
              Text('£${shippingCost.toStringAsFixed(2)}'),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('£${finalTotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isProcessing ? null : _processOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                padding: const EdgeInsets.symmetric(vertical: 16),
                disabledBackgroundColor: Colors.grey,
              ),
              child: _isProcessing
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'COMPLETE ORDER',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
