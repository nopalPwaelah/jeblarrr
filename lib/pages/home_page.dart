import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import '../utils/navigation_helper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Banner Images
  final List<String> bannerImages = [
    'assets/images/anu_1.jpg',
    'assets/images/anu_2.jpg',
    'assets/images/anu_3.jpg',
  ];

  // Social Media Links
  final Map<String, String> socialMediaLinks = {
    'Instagram': 'https://www.instagram.com/jeblarrr/',
    'TikTok': 'https://www.tiktok.com/@j3blarr_meledakk',
  };

  // Nomor WhatsApp
  final String whatsappNumber = '6281234567890'; // GANTI NOMOR KAMU

  // Fungsi buka URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  // Fungsi order via WhatsApp
  Future<void> _orderViaWhatsApp(String menuName) async {
    final String message = Uri.encodeComponent(
      'Halo, saya ingin memesan $menuName',
    );

    final Uri url = Uri.parse(
      'https://wa.me/$whatsappNumber?text=$message',
    );

    try {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        debugPrint('Could not launch WhatsApp');
      }
    } catch (e) {
      debugPrint('Error opening WhatsApp: $e');
    }
  }

  void _handleNavigation(BuildContext context, String section) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }

    navigateToSection(
      context,
      section,
      currentPage: 'home',
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth =
        screenWidth > 2100 ? 1080 : screenWidth * 0.9;

    return Scaffold(
      key: _scaffoldKey,

      drawer: CustomNavigationDrawer(
        onNavigate: (section) =>
            _handleNavigation(context, section),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // JARAK HEADER
                const SizedBox(height: 120),

                // =========================
                // BANNER
                // =========================
                CarouselSlider(
                  options: CarouselOptions(
                    height:
                        MediaQuery.of(context).size.height - 200,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlayInterval:
                        const Duration(seconds: 4),
                  ),
                  items: bannerImages.map((assetPath) {
                    return Image.asset(
                      assetPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height:
                          MediaQuery.of(context).size.height -
                              200,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          size: 50,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // =========================
                // MENU FAVORIT
                // =========================
                Center(
                  child: Container(
                    width: containerWidth,
                    padding:
                        const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "MENU FAVORIT",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE12027),
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: 30),

                        GridView.count(
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(),
                          crossAxisCount:
                              screenWidth > 900 ? 3 : 2,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 25,
                          childAspectRatio: 0.7,

                          children: [
                            _buildMenuCard(
                              context,
                              "Mi Jebew Spesial",
                              'assets/images/mi_jebew_1.jpg',
                              "Rp 15.000",
                            ),

                            _buildMenuCard(
                              context,
                              "Mi Jebew Kaya Rasa",
                              'assets/images/mi_jebew_2.jpg',
                              "Rp 18.000",
                            ),

                            _buildMenuCard(
                              context,
                              "Jeblarrrr",
                              'assets/images/mi_jebew_3.jpg',
                              "Rp 20.000",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // =========================
                // CTA SECTION
                // =========================
                Container(
                  width: double.infinity,
                  color: const Color(0xFFFFD100),
                  padding: EdgeInsets.symmetric(
                    vertical:
                        screenWidth > 600 ? 60 : 40,
                    horizontal: 20,
                  ),

                  child: Column(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size:
                            screenWidth > 600 ? 60 : 50,
                        color: const Color(0xFFE12027),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "Kami Memastikan",
                        style: TextStyle(
                          fontSize:
                              screenWidth > 600 ? 22 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Produk akan dikirim tepat waktu.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:
                              screenWidth > 600 ? 32 : 24,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFFE12027),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "Jika Anda sedang rapat, bekerja hingga larut malam, dan membutuhkan dorongan ekstra.\nBeri tahu kami dan kami akan datang.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:
                              screenWidth > 600 ? 16 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment:
                            WrapCrossAlignment.center,
                        spacing:
                            screenWidth > 600 ? 15 : 10,
                        runSpacing:
                            screenWidth > 600 ? 15 : 10,

                        children: [
                          _buildCTAButton(
                            "Pesan Sekarang",
                            screenWidth,
                            () {
                              _orderViaWhatsApp(
                                  "Menu Jeblarrr");
                            },
                          ),

                          Text(
                            "ATAU",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              fontSize:
                                  screenWidth > 600
                                      ? 14
                                      : 12,
                            ),
                          ),

                          _buildCTAButton(
                            "Hubungi Kami Sekarang!",
                            screenWidth,
                            () async {
                              await _launchURL(
                                'https://wa.me/$whatsappNumber',
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // =========================
                // FOOTER
                // =========================
                Container(
                  width: double.infinity,
                  color: Colors.white,

                  padding: EdgeInsets.symmetric(
                    vertical:
                        screenWidth > 900 ? 60 : 40,
                    horizontal: 20,
                  ),

                  child: Column(
                    children: [
                      screenWidth > 900
                          ? Wrap(
                              spacing: 80,
                              runSpacing: 40,
                              alignment:
                                  WrapAlignment.center,

                              children: [
                                _buildFooterColumn(
                                  "TAUTAN",
                                  [
                                    "Tentang Kami",
                                    "Hubungi kami",
                                    "Syarat dan Ketentuan",
                                    "Kebijakan Privasi",
                                    "Pelacakan Pesanan",
                                    "Toko-toko"
                                  ],
                                  screenWidth,
                                ),

                                Column(
                                  children: [
                                    const Icon(
                                      Icons.delivery_dining,
                                      size: 80,
                                      color:
                                          Color(0xFFE12027),
                                    ),

                                    const Text(
                                      "1-500-505",
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight:
                                            FontWeight.bold,
                                        color: Color(
                                            0xFFE12027),
                                      ),
                                    ),

                                    const Text(
                                      "jeblarrr.co.id",
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                _buildFooterColumn(
                                  "IKUTI KAMI",
                                  [
                                    "Instagram",
                                    "TikTok"
                                  ],
                                  screenWidth,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _buildFooterColumn(
                                  "TAUTAN",
                                  [
                                    "Tentang Kami",
                                    "Hubungi kami",
                                    "Syarat dan Ketentuan",
                                    "Kebijakan Privasi",
                                    "Pelacakan Pesanan",
                                    "Toko-toko"
                                  ],
                                  screenWidth,
                                ),

                                const SizedBox(height: 30),

                                Column(
                                  children: [
                                    const Icon(
                                      Icons.delivery_dining,
                                      size: 60,
                                      color:
                                          Color(0xFFE12027),
                                    ),

                                    const Text(
                                      "1-500-505",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                            FontWeight.bold,
                                        color: Color(
                                            0xFFE12027),
                                      ),
                                    ),

                                    const Text(
                                      "jeblarrr.co.id",
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 30),

                                _buildFooterColumn(
                                  "IKUTI KAMI",
                                  [
                                    "Instagram",
                                    "TikTok"
                                  ],
                                  screenWidth,
                                ),
                              ],
                            ),

                      const SizedBox(height: 50),

                      const Divider(),

                      const SizedBox(height: 20),

                      const Text(
                        "© 2026 PT. Jeblarrr Indonesia. Semua gambar dan materi dilindungi hak cipta.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // HEADER
          HeaderBar(
            currentPage: 'home',

            onNavigate: (section) =>
                _handleNavigation(context, section),

            onMenuPressed: () =>
                _scaffoldKey.currentState?.openDrawer(),

            onOrderPressed: () =>
                _handleNavigation(context, 'order'),
          ),
        ],
      ),
    );
  }

  // =========================
  // MENU CARD
  // =========================
  Widget _buildMenuCard(
    BuildContext context,
    String title,
    String assetPath,
    String price,
  ) {
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
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),

              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                width: double.infinity,

                errorBuilder:
                    (context, error, stackTrace) =>
                        const Center(
                  child: Icon(Icons.broken_image),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 5),

                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFFE12027),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      _orderViaWhatsApp(title);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFFFD100),

                      foregroundColor: Colors.black,

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                    ),

                    child: const Text(
                      "PESAN SEKARANG",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // CTA BUTTON
  // =========================
  Widget _buildCTAButton(
    String label,
    double screenWidth,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE12027),
        foregroundColor: Colors.white,

        padding: EdgeInsets.symmetric(
          horizontal:
              screenWidth > 600 ? 30 : 20,
          vertical:
              screenWidth > 600 ? 18 : 12,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        elevation: 2,
      ),

      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:
              screenWidth > 600 ? 14 : 12,
        ),
      ),
    );
  }

  // =========================
  // FOOTER COLUMN
  // =========================
  Widget _buildFooterColumn(
    String title,
    List<String> items,
    double screenWidth,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.center,

      children: [
        Text(
          title,
          style: TextStyle(
            fontSize:
                screenWidth > 600 ? 18 : 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 15),

        ...items.map(
          (item) => Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4),

            child: InkWell(
              onTap: () async {
                if (socialMediaLinks.containsKey(item)) {
                  await _launchURL(
                    socialMediaLinks[item]!,
                  );
                }
              },

              child: Text(
                item,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize:
                      screenWidth > 600 ? 14 : 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}