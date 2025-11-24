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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 400.0),
              child: Text(
                'Welcome to Union Shop!\n\n We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n\n All online purchases are available for delivery or instore collection! \n\n We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net. \n\n Happy shopping! \n\n The Union Shop & Reception Team​​​​​​​​​,',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Placeholder for navigating to the About page
