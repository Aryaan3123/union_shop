import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget child;

  const PageLayout({super.key, required this.child});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF4d2963),
            ),
            child: Image.network(
              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614315854',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  width: 40,
                  height: 40,
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              navigateToHome(context);
            },
          ),
          ListTile(
            title: const Text('Shop'),
            onTap: placeholderCallbackForButtons,
          ),
          ListTile(
            title: const Text('The Print Shack'),
            onTap: placeholderCallbackForButtons,
          ),
          ListTile(
            title: const Text('SALE!'),
            onTap: placeholderCallbackForButtons,
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              navigateToAbout(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;

      return Scaffold(
        drawer: isMobile ? _buildMobileDrawer(context) : null,
        body: Builder(
          builder: (BuildContext scaffoldContext) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Header
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Top banner
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          color: const Color(0xFF4d2963),
                          child: const Text(
                            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ), // Main header
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(children: [
                            GestureDetector(
                              onTap: () {
                                navigateToHome(context);
                              },
                              child: Image.network(
                                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614315854',
                                height: 40,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    width: 40,
                                    height: 40,
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported,
                                          color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (!isMobile) ...[
                              // Desktop Navigation
                              const Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  TextButton(
                                    onPressed: () {
                                      navigateToHome(context);
                                    },
                                    child: const Text(
                                      'Home',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      Navigator.pushNamed(
                                          context, '/shop/$value');
                                    },
                                    child: const Text(
                                      'Shop',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem<String>(
                                        value: 'clothing',
                                        child: Text('Clothing'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'merchandise',
                                        child: Text('Merchandise'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'halloween',
                                        child: Text('Halloween'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'signature-essentials',
                                        child:
                                            Text('Signature & Essential Range'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'portsmouth-city',
                                        child:
                                            Text('Portsmouth City Collection'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'pride-collection',
                                        child: Text('Pride Collection'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'graduation',
                                        child: Text('Graduation'),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: placeholderCallbackForButtons,
                                    child: const Text(
                                      'The Print Shack',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: placeholderCallbackForButtons,
                                    child: const Text(
                                      'SALE!',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateToAbout(context);
                                    },
                                    child: const Text(
                                      'About',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              // Balance the logo on the left with equivalent space on the right
                              SizedBox(width: 160), // Match logo width
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 600),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.person_outline,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                          minWidth: 32, minHeight: 32),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                          minWidth: 32, minHeight: 32),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.menu,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                          minWidth: 32, minHeight: 32),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              // Mobile Navigation
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.search,
                                    size: 20, color: Colors.grey),
                                onPressed: placeholderCallbackForButtons,
                              ),                              Builder(
                                builder: (context) {
                                  bool isExpanded = false; // Move outside StatefulBuilder
                                  return StatefulBuilder(builder: (context, setState) {
                                  
                                    return Stack(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            isExpanded ? Icons.close : Icons.menu,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            print('Hamburger tapped! Current state: $isExpanded');
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                            print('New state: $isExpanded');
                                          },
                                        ),

                                        // Dropdown Menu Overlay
                                        if (isExpanded)
                                          Positioned(
                                            top: 40, // underbutton
                                            right: 0, // align to right edge
                                            child: Material(
                                              elevation: 8,
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              child: Container(
                                                width: 250, // Fixed width for menu
                                                constraints: const BoxConstraints(maxHeight: 400),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      title: const Text('Home'),
                                                      onTap: () {
                                                        setState(() {
                                                          isExpanded = false;
                                                        });
                                                        navigateToHome(context);
                                                      },
                                                    ),
                                                     ExpansionTile(
                                                      title: const Text('Shop'),
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 16),
                                                          child: Column(
                                                            children: [
                                                              ListTile(
                                                                title: const Text('Clothing'),
                                                                onTap: () {
                                                                  setState(() { isExpanded = false; });
                                                                  Navigator.pushNamed(context, '/shop/clothing');
                                                                },
                                                              ),
                                                              ListTile(
                                                                title: const Text('Merchandise'),
                                                                onTap: () {
                                                                  setState(() { isExpanded = false; });
                                                                  Navigator.pushNamed(context, '/shop/merchandise');
                                                                },
                                                              ),
                                                              // ... other categories
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    ListTile(
                                                      title: const Text('The Print Shack'),
                                                      onTap: () {
                                                        setState(() { isExpanded = false; });
                                                        placeholderCallbackForButtons();
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: const Text('SALE!'),
                                                      onTap: () {
                                                        setState(() { isExpanded = false; });
                                                        placeholderCallbackForButtons();
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: const Text('About'),
                                                      onTap: () {
                                                        setState(() { isExpanded = false; });
                                                        navigateToAbout(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  });
                                },
                              ),
                            ],
                          ]),
                        ),
                      ],
                    ),
                  ),
                  // Page content
                  child,
                  // Blank white space before footer
                  Container(
                    height: 40,
                    color: Colors.white,
                  ), // Global Footer
                  Container(
                    width: double.infinity,
                    color: Colors.grey[100],
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Use responsive layout based on available width
                          if (constraints.maxWidth > 800) {
                            // Wide screen: side-by-side layout
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left: Opening Times
                                const Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OPENING HOURS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                          "❄️ Winter Break Closure Dates ❄️ \n\n Closing 4pm 19/12/2025\n\n Reopening 10am 05/01/2026\n\n Last post date: 12pm on 18/12/2025\n\n ------------------------\n\n (Term Time)\n\n Monday - Friday 10am - 4pm\n\n (Outside of Term Time / Consolidation Weeks)\n\n Monday - Friday 10am - 3pm\n\n Purchase online 24/7"),
                                    ],
                                  ),
                                ),
                                // Space between columns
                                const SizedBox(width: 120),
                                // Right: Copyright
                                Text(
                                    '© ${DateTime.now().year} UPSU. All rights reserved.'),
                              ],
                            );
                          } else {
                            // Narrow screen: stacked layout
                            return Column(
                              children: [
                                // Top: Opening Times
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OPENING HOURS',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                        "❄️ Winter Break Closure Dates ❄️ \n\n Closing 4pm 19/12/2025\n\n Reopening 10am 05/01/2026\n\n Last post date: 12pm on 18/12/2025\n\n ------------------------\n\n (Term Time)\n\n Monday - Friday 10am - 4pm\n\n (Outside of Term Time / Consolidation Weeks)\n\n Monday - Friday 10am - 3pm\n\n Purchase online 24/7")
                                  ],
                                ),
                                const SizedBox(height: 24),
                                // Bottom: Copyright
                                Text(
                                    '© ${DateTime.now().year} UPSU. All rights reserved.'),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

class _MobileMenu extends StatefulWidget {
  @override
  __MobileMenuState createState() => __MobileMenuState();
}

class __MobileMenuState extends State<_MobileMenu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            isExpanded ? Icons.close : Icons.menu,
            size: 20,
            color: Colors.grey,
          ),
          onPressed: () {
            print('Hamburger tapped! Current state: $isExpanded'); // Add this
            setState(() {
              isExpanded = !isExpanded;
            });
            print('New state: $isExpanded'); // And this
          },
        ),

        // Dropdown Menu Overlay
        if (isExpanded)
          Positioned(
            top: 40, // underbutton
            right: 0, // align to right edge
            child: Material(
              elevation: 8,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 250, // Fixed width for menu
                constraints: const BoxConstraints(maxHeight: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        setState(() {
                          isExpanded = false;
                        });
                        // Navigate to Home
                      },
                    ),
                    // ... other menu items
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}