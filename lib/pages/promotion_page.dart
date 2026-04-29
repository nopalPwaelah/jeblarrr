import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalKey untuk membuka Drawer
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      drawer: CustomNavigationDrawer(
        onNavigate: (section) {
          if (section == 'home') {
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header tetap di atas
            HeaderBar(
              onNavigate: (section) {
                // Logika navigasi jika diperlukan
              },
              onMenuPressed: () => scaffoldKey.currentState?.openDrawer(),
              onOrderPressed: () {},
            ),

            // 2. Konten Utama
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFDC2626), Color(0xFF7F1D1D)],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animasi atau Icon
                        const Icon(
                          Icons.stars,
                          color: Color(0xFFEAB308),
                          size: 120,
                        ),
                        const SizedBox(height: 30),
                        
                        // Judul Promo
                        const Text(
                          "PROMO HARI INI!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Deskripsi Promo
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Beli 2 Level 5 Gratis Es Teh Manis!\nBerlaku tiap Jumat.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        
                        // Tombol Klaim
                        SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Promo Berhasil Diklaim!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "KLAIM PROMO",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "*Syarat & Ketentuan Berlaku",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}