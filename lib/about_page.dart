import 'package:flutter/material.dart';
import 'package:union_shop/page_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Container(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'About Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Union Shop! We are committed to providing the best products and services to our customers. Our mission is to create a seamless shopping experience for everyone.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
// Placeholder for navigating to the About page
