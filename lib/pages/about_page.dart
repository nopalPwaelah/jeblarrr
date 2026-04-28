import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/sections/about_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white, // Sesuaikan dengan warna AboutSection
      drawer: CustomNavigationDrawer(
        onNavigate: (section) {
          if (section == 'home') Navigator.popUntil(context, (route) => route.isFirst);
          // Tambahkan logika pindah halaman lain
        },
      ),
      body: Stack(
        children: [
          // Halaman statis tanpa scroll
          Column(
            children: [
              const SizedBox(height: 80), // Jarak agar tidak tertutup Header
              const Expanded(
                child: AboutSection(), // Memanggil widget AboutSection yang sudah kamu buat
              ),
            ],
          ),
          HeaderBar(
            onNavigate: (section) {
               if (section == 'home') Navigator.pop(context);
               // Logika navigasi lainnya
            },
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () {}, // Tambahkan navigasi order jika perlu
          ),
        ],
      ),
    );
  }
}