import 'package:flutter/material.dart';

class PageLayout extends StatefulWidget {
  final Widget child;

  const PageLayout({super.key, required this.child});

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  bool isMobileMenuExpanded = false;
  bool isShopSubmenuOpen = false;

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
  void toggleMobileMenu() {
    setState(() {
      isMobileMenuExpanded = !isMobileMenuExpanded;
      if (!isMobileMenuExpanded) {
        isShopSubmenuOpen = false; // Reset submenu when closing main menu
      }
    });
  }

  void openShopSubmenu() {
    setState(() {
      isShopSubmenuOpen = true;
    });
  }

  void closeShopSubmenu() {
    setState(() {
      isShopSubmenuOpen = false;
    });
  }

  Widget _buildMobileMenuOptions() {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      child: IntrinsicHeight(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: isShopSubmenuOpen
                    ? const Offset(-1.0, 0.0)
                    : const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: isShopSubmenuOpen ? _buildShopSubmenu() : _buildMainMenu(),
        ),
      ),
    );
  }

  Widget _buildMainMenu() {
    return Container(
      key: const ValueKey('main_menu'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHoverableListTile(
            title: 'Home',
            onTap: () {
              toggleMobileMenu();
              navigateToHome(context);
            },
          ),
          _buildHoverableListTile(
            title: 'Shop',
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: openShopSubmenu,
          ),
          _buildHoverableListTile(
            title: 'The Print Shack',
            onTap: () {
              toggleMobileMenu();
              placeholderCallbackForButtons();
            },
          ),
          _buildHoverableListTile(
            title: 'SALE!',
            onTap: () {
              toggleMobileMenu();
              placeholderCallbackForButtons();
            },
          ),
          _buildHoverableListTile(
            title: 'About',
            onTap: () {
              toggleMobileMenu();
              navigateToAbout(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShopSubmenu() {
    return Container(
      key: const ValueKey('shop_submenu'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHoverableListTile(
            title: 'Back to Menu',
            leading: const Icon(Icons.arrow_back_ios, size: 16),
            onTap: closeShopSubmenu,
          ),
          const Divider(),
          _buildHoverableListTile(
            title: 'Clothing',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/clothing');
            },
          ),
          _buildHoverableListTile(
            title: 'Merchandise',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/merchandise');
            },
          ),
          _buildHoverableListTile(
            title: 'Halloween',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/halloween');
            },
          ),
          _buildHoverableListTile(
            title: 'Signature & Essential Range',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/signature-essentials');
            },
          ),
          _buildHoverableListTile(
            title: 'Portsmouth City Collection',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/portsmouth-city');
            },
          ),
          _buildHoverableListTile(
            title: 'Pride Collection',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/pride-collection');
            },
          ),
          _buildHoverableListTile(
            title: 'Graduation',
            onTap: () {
              toggleMobileMenu();
              Navigator.pushNamed(context, '/shop/graduation');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHoverableListTile({
    required String title,
    Widget? leading,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            hoverColor: Colors.grey[200],
            child: ListTile(
              leading: leading,
              title: Text(title),
              trailing: trailing,
              dense: true,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;
      return Scaffold(
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
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width > 600 ? 10 : 6,
                              vertical: MediaQuery.of(context).size.width > 600 ? 20 : 12,
                          ),
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
                                        color: Colors.black,
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
                                    size: 20, color: Colors.black),
                                onPressed: placeholderCallbackForButtons,
                                padding: const EdgeInsets.all(4),
                                constraints: const BoxConstraints(
                                  minWidth: 28,
                                  minHeight: 28,
                                ),
                              ),
                               IconButton(
                                icon: const Icon(Icons.person_outline, size: 20, color: Colors.black), 
                                onPressed: placeholderCallbackForButtons,
                                padding: const EdgeInsets.all(4), 
                                constraints: const BoxConstraints(
                                  minWidth: 28,
                                  minHeight: 28,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: Colors.black),
                                onPressed: placeholderCallbackForButtons,
                                padding: const EdgeInsets.all(4), 
                                constraints: const BoxConstraints(
                                  minWidth: 28,
                                  minHeight: 28,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isMobileMenuExpanded
                                      ? Icons.close
                                      : Icons.menu,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                onPressed: toggleMobileMenu,
                                padding: const EdgeInsets.all(4), 
                                constraints: const BoxConstraints(
                                  minWidth: 28,
                                  minHeight: 28,
                                ),
                              ),
                            ],
                          ]),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    child: isMobileMenuExpanded
                        ? _buildMobileMenuOptions()
                        : const SizedBox.shrink(),
                  ), // Page content
                  widget.child,
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
