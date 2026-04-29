import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import 'about_page.dart';
import 'promotion_page.dart';
import 'order_page.dart';
import 'menu_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Pastikan nama file ini persis dengan yang ada di folder assets/images/
  final List<String> bannerImages = [
    'assets/images/anu_1.jpg',
    'assets/images/anu_2.jpg',
  ];

  void _handleNavigation(BuildContext context, String section) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }
    switch (section) {
      case 'home':
        break;
      case 'about':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
        break;
      case 'promotion':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const PromotionPage()));
        break;
      case 'products':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuPage()));
        break;
      case 'order':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // containerWidth digunakan agar konten menu tidak terlalu lebar di layar PC
    double containerWidth = screenWidth > 1200 ? 1100 : screenWidth * 0.9;

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomNavigationDrawer(
        onNavigate: (section) => _handleNavigation(context, section),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // 1. JARAK DARI ATAS (Agar tidak tertutup Header)
                // Ditambah jaraknya agar banner promosi tidak terlalu mepet ke atas
                const SizedBox(height: 120),

                // --- 2. PROMOTION BANNER (FULL WIDTH) ---
                CarouselSlider(
                  options: CarouselOptions(
                    // Tinggi responsif: 500 di web/PC, 250 di HP
                    height: screenWidth > 800 ? 500.0 : 250.0,
                    autoPlay: true,
                    // viewportFraction: 1.0 agar gambar FULL selebar layar
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlayInterval: const Duration(seconds: 4),
                  ),
                  items: bannerImages.map((assetPath) {
                    return Image.asset(
                      assetPath,
                      fit: BoxFit.cover, // Gambar akan memenuhi area tanpa gepeng
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 50),
                      ),
                    );
                  }).toList(),
                ),

                // --- 3. MENU FAVORIT SECTION ---
                Center(
                  child: Container(
                    width: containerWidth,
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "MENU FAVORIT",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE12027), // Merah
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // 3 kolom di layar lebar, 2 kolom di HP
                          crossAxisCount: screenWidth > 900 ? 3 : 2,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 25,
                          childAspectRatio: 0.7,
                          children: [
                            _buildMenuCard("Mi Jebew Spesial", 'assets/images/mi_jebew_1.jpg', "Rp 15.000"),
                            _buildMenuCard("Mi Jebew Kaya Rasa", 'assets/images/mi_jebew_2.jpg', "Rp 18.000"),
                            _buildMenuCard("Jeblarrrr", 'assets/images/mi_jebew_3.jpg', "Rp 20.000"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // --- 4. CALL TO ACTION (KUNING) ---
                Container(
                  width: double.infinity,
                  color: const Color(0xFFFFD100), // Kuning
                  padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Column(
                    children: [
                      const Icon(Icons.timer_outlined, size: 60, color: Color(0xFFE12027)),
                      const SizedBox(height: 15),
                      const Text(
                        "Kami Memastikan",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Produk akan dikirim tepat waktu.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFE12027),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Jika Anda sedang rapat, bekerja hingga larut malam, dan membutuhkan dorongan ekstra.\nBeri tahu kami dan kami akan datang.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _buildCTAButton("Pesan Sekarang"),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Text("ATAU", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          _buildCTAButton("Hubungi Kami Sekarang!"),
                        ],
                      ),
                    ],
                  ),
                ),

                // --- 5. FOOTER ---
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 80,
                        runSpacing: 40,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildFooterColumn("TAUTAN", [
                            "Tentang Kami", "Hubungi kami", "Syarat dan Ketentuan",
                            "Kebijakan Privasi", "Pelacakan Pesanan", "Toko-toko"
                          ]),
                          Column(
                            children: [
                              const Icon(Icons.delivery_dining, size: 80, color: Color(0xFFE12027)),
                              const Text(
                                "1-500-505",
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFE12027)),
                              ),
                              const Text("jeblarrr.co.id", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          _buildFooterColumn("IKUTI KAMI", [
                            "YouTube", "Facebook", "Instagram", "TikTok", "WhatsApp"
                          ]),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Divider(),
                      const SizedBox(height: 20),
                      const Text(
                        "© 2026 PT. Jeblarrr Indonesia. Semua gambar dan materi dilindungi hak cipta.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Header Tetap Melayang di Atas
          HeaderBar(
            onNavigate: (section) => _handleNavigation(context, section),
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () => _handleNavigation(context, 'order'),
          ),
        ],
      ),
    );
  }

  // Helper Widget: Membuat Card Menu
  Widget _buildMenuCard(String title, String assetPath, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(color: Color(0xFFE12027), fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD100), // Kuning
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("PESAN SEKARANG", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget: Tombol Merah CTA
  Widget _buildCTAButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE12027),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  // Helper Widget: Kolom Daftar di Footer
  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () {},
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ),
            )),
      ],
    );
  }
}