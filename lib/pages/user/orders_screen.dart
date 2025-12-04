import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            // Header with logo
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'The UNION',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // Balance the close button
                ],
              ),
            ),

            // User email
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.person_outline, color: Colors.grey),
                      const SizedBox(width: 12),
                      Text(
                        authProvider.firebaseUser?.email ?? 'No email',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Menu items
            _buildMenuItem('Shop', () {
              Navigator.pop(context); // Close drawer first
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }),
            _buildMenuItem('Orders', () {
              Navigator.pop(context); // Close drawer
            }), // Current page, just close drawer

            const Spacer(),

            // Bottom menu items
            _buildMenuItem('Profile', () {
              Navigator.pop(context);
              // Add profile navigation when ready
            }),
            _buildMenuItem('Settings', () {
              Navigator.pop(context);
              // Add settings navigation when ready
            }),
            _buildMenuItem('Sign out', () {
              Navigator.pop(context); // Close drawer first
              Provider.of<AuthProvider>(context, listen: false).signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }),

            const SizedBox(height: 20),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No orders yet',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Go to store to place an order.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
