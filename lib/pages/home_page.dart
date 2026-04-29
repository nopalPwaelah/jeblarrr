import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/sections/hero_section.dart';
import 'about_page.dart';
import 'promotion_page.dart'; 
import 'order_page.dart';
import 'contact_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _handleNavigation(BuildContext context, String section) {
    // Tutup drawer jika sedang terbuka (untuk mobile mode)
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }

    switch (section) {
      case 'home':
        // Karena ini sudah di Home, jangan lakukan apa-apa atau pushReplacement ke diri sendiri
        break;
      case 'about':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
        break;
      case 'promotion':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const PromotionPage()));
        break;
      case 'order':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderPage()));
        break;
      case 'contact':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()));
        break;
      case 'products':
        // Jika produk ada di halaman promo atau halaman tersendiri
        Navigator.push(context, MaterialPageRoute(builder: (_) => const PromotionPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Menggunakan CustomNavigationDrawer yang sudah kamu punya
      drawer: CustomNavigationDrawer(
        onNavigate: (section) => _handleNavigation(context, section),
      ),
      body: Stack(
        children: [
          // Konten Utama
          Column(
            children: [
              const SizedBox(height: 80), // Jarak agar Hero tidak tertutup Header
              Expanded(
                child: HeroSection(
                  // Callback dari tombol di HeroSection
                  onProductsPressed: () => _handleNavigation(context, 'promotion'),
                ),
              ),
            ],
          ),
          
          // Header tetap melayang di paling atas (Stack)
          HeaderBar(
            onNavigate: (section) => _handleNavigation(context, section),
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () => _handleNavigation(context, 'order'),
          ),
        ],
      ),
    );
  }
}