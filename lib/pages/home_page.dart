import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/products_section.dart';
import '../widgets/sections/promotion_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  // Keys untuk navigasi scroll
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _productsKey = GlobalKey();
  final GlobalKey _promotionKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _handleNavigation(String section) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }
    
    switch (section) {
      case 'home': _scrollToSection(_homeKey); break;
      case 'about': _scrollToSection(_aboutKey); break;
      case 'products': _scrollToSection(_productsKey); break;
      case 'promotion': _scrollToSection(_promotionKey); break;
      case 'contact': _scrollToSection(_contactKey); break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomNavigationDrawer(onNavigate: _handleNavigation),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _homeKey, onProductsPressed: () => _handleNavigation('products')),
                AboutSection(key: _aboutKey),
                ProductsSection(key: _productsKey),
                PromotionSection(key: _promotionKey),
                ContactSection(key: _contactKey),
                const FooterSection(),
              ],
            ),
          ),
          HeaderBar(
            onNavigate: _handleNavigation,
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ],
      ),
    );
  }
}