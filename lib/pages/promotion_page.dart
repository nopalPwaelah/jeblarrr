import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/sections/promotion_section.dart';
import 'home_page.dart';
import 'about_page.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    void _handleNavigation(String section) {
      if (section == 'home') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
      } else if (section == 'about') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AboutPage()));
      }
      // Jika di halaman promo klik promo, tidak perlu pindah
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFDC2626), // Warna dasar merah promo
      drawer: CustomNavigationDrawer(
        onNavigate: (section) => _handleNavigation(section),
      ),
      body: Stack(
        children: [
          // Isi Konten
          Column(
            children: [
              const SizedBox(height: 80), // Biar nggak ketutupan Header
              const Expanded(
                child: PromotionSection(), // Memanggil widget yang kamu kirim tadi
              ),
            ],
          ),
          
          // Header tetap melayang di atas
          HeaderBar(
            onNavigate: (section) => _handleNavigation(section),
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () {
              // Navigasi ke halaman order jika ada
            },
          ),
        ],
      ),
    );
  }
}