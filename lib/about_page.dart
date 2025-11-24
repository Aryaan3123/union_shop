import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => navigateToHome(context),
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
// Placeholder for navigating to the About page
