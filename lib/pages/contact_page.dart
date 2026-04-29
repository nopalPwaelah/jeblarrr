import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  void _launchWhatsApp() async {
    final String phone = '62812345678'; // Ganti dengan nomor WhatsApp Anda
    final String message = 'Halo JEBLARR, saya ingin memesan...';
    final Uri whatsappUrl = Uri.parse(
        'https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
    
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Tidak bisa buka WhatsApp';
    }
  }

  void _launchPhone() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: '081234567890');
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      throw 'Tidak bisa panggil';
    }
  }

  void _launchEmail() async {
    final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: 'info@jeblarr.com',
      queryParameters: {'subject': 'Pertanyaan Tentang JEBLARR'},
    );
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      throw 'Tidak bisa buka email';
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: CustomNavigationDrawer(
        onNavigate: (section) {
          if (section == 'home') {
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
      ),
      body: Stack(
        children: [
          // Konten Utama dengan Scroll
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100), // Jarak dari header

                // Judul halaman
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: const [
                      Text(
                        'HUBUNGI KAMI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sepedas Ekspresimu, Sekuat Nyalimu',
                        style: TextStyle(
                          color: Color(0xFFEAB308),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                // Konten Contact
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Contact Cards
                      Row(
                        children: const [
                          Expanded(
                            child: _ContactCard(
                              icon: Icons.phone,
                              title: 'TELEPON',
                              value: '081 234 567 890',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: _ContactCard(
                              icon: Icons.email,
                              title: 'EMAIL',
                              value: 'info@jeblarr.com',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: _ContactCard(
                              icon: Icons.location_on,
                              title: 'LOKASI',
                              value: 'Jl. Spesial No. 123,\nJakarta',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: _ContactCard(
                              icon: Icons.access_time,
                              title: 'JAM OPERASIONAL',
                              value: '09:00 - 22:00 WIB\nSetiap Hari',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Action Buttons
                      Column(
                        children: [
                          // Tombol WhatsApp
                          GestureDetector(
                            onTap: _launchWhatsApp,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF25D366),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF25D366)
                                        .withOpacity(0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Hubungi Kami via WhatsApp',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Tombol Telepon
                          GestureDetector(
                            onTap: _launchPhone,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0066CC),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF0066CC).withOpacity(0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Telepon Kami',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Tombol Email
                          GestureDetector(
                            onTap: _launchEmail,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDC2626),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xFFDC2626).withOpacity(0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Kirim Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Form Feedback (Optional)
                      _ContactFormSection(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Header tetap di atas
          HeaderBar(
            onNavigate: (section) {
              if (section == 'home') {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Widget untuk Contact Card
class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFDC2626),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFEAB308),
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFDC2626),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Form Feedback
class _ContactFormSection extends StatefulWidget {
  @override
  State<_ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<_ContactFormSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'KIRIM PESAN LANGSUNG',
          style: TextStyle(
            color: Color(0xFFDC2626),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: _nameController,
          hintText: 'Nama Anda',
          icon: Icons.person,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: _emailController,
          hintText: 'Email Anda',
          icon: Icons.email,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: _messageController,
          hintText: 'Pesan Anda',
          icon: Icons.message,
          maxLines: 4,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            // Implementasi pengiriman pesan
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Terima kasih atas pesan Anda!'),
                backgroundColor: Color(0xFFDC2626),
              ),
            );
            _nameController.clear();
            _emailController.clear();
            _messageController.clear();
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFDC2626),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'KIRIM PESAN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: const Color(0xFFDC2626)),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDC2626)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEAB308), width: 2),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
