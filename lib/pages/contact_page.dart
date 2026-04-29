import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
// Import lainnya pastikan jalurnya benar

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Fungsi Launcher yang diperbaiki (Gunakan try-catch)
  Future<void> _launchWhatsApp() async {
    final String phone = '62812345678'; 
    final String message = 'Halo JEBLARR, saya ingin memesan...';
    final Uri url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
    
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch WhatsApp');
    }
  }

  Future<void> _launchPhone() async {
    final Uri url = Uri(scheme: 'tel', path: '081234567890');
    if (!await launchUrl(url)) debugPrint('Could not launch Phone');
  }

  Future<void> _launchEmail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'info@jeblarr.com',
      queryParameters: {'subject': 'Pertanyaan Tentang JEBLARR'},
    );
    if (!await launchUrl(url)) debugPrint('Could not launch Email');
  }

  @override
  Widget build(BuildContext context) {
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
      // MENGGUNAKAN COLUMN AGAR AREA KLIK TIDAK SALING TUMPANG TINDIH
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header tetap di paling atas (Tinggi tetap 80)
            HeaderBar(
              onNavigate: (section) {
                if (section == 'home') Navigator.popUntil(context, (route) => route.isFirst);
              },
              onMenuPressed: () => scaffoldKey.currentState?.openDrawer(),
              onOrderPressed: () {},
            ),

            // 2. Konten Utama (Scrollable Area)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    
                    // Judul Halaman
                    const Text(
                      'HUBUNGI KAMI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sepedas Ekspresimu, Sekuat Nyalimu',
                      style: TextStyle(
                        color: Color(0xFFEAB308),
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    
                    const SizedBox(height: 50),

                    // Contact Cards Grid
                    const _ContactGrid(),

                    const SizedBox(height: 40),

                    // ACTION BUTTONS (MENGGUNAKAN ELEVATEDBUTTON AGAR RESPONSIF)
                    _actionButton(
                      label: 'Hubungi Kami via WhatsApp',
                      color: const Color(0xFF25D366),
                      icon: Icons.chat,
                      onTap: _launchWhatsApp,
                    ),
                    const SizedBox(height: 16),
                    _actionButton(
                      label: 'Telepon Kami Sekarang',
                      color: const Color(0xFF0066CC),
                      icon: Icons.phone,
                      onTap: _launchPhone,
                    ),
                    const SizedBox(height: 16),
                    _actionButton(
                      label: 'Kirim Email Resmi',
                      color: const Color(0xFFDC2626),
                      icon: Icons.email,
                      onTap: _launchEmail,
                    ),

                    const SizedBox(height: 50),
                    _ContactFormSection(),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk Tombol Aksi
  Widget _actionButton({
    required String label,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
        ),
      ),
    );
  }
}

class _ContactGrid extends StatelessWidget {
  const _ContactGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: _ContactCard(icon: Icons.phone, title: 'TELEPON', value: '0812 3456 7890')),
            SizedBox(width: 15),
            Expanded(child: _ContactCard(icon: Icons.email, title: 'EMAIL', value: 'info@jeblarr.com')),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: const [
            Expanded(child: _ContactCard(icon: Icons.location_on, title: 'LOKASI', value: 'Jl. Spesial No. 123')),
            SizedBox(width: 15),
            Expanded(child: _ContactCard(icon: Icons.access_time, title: 'JAM BUKA', value: '09:00 - 22:00')),
          ],
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const _ContactCard({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDC2626), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFEAB308), size: 28),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Color(0xFFDC2626), fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

class _ContactFormSection extends StatelessWidget {
  final _nameController = TextEditingController();
  final _msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('KIRIM PESAN LANGSUNG', style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _inputField(_nameController, 'Nama Anda', Icons.person),
        const SizedBox(height: 15),
        _inputField(_msgController, 'Pesan Anda', Icons.message, lines: 4),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesan Terkirim!'))),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFDC2626)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('KIRIM SEKARANG', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _inputField(TextEditingController ctrl, String hint, IconData icon, {int lines = 1}) {
    return TextField(
      controller: ctrl,
      maxLines: lines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24),
        prefixIcon: Icon(icon, color: const Color(0xFFDC2626)),
        filled: true,
        fillColor: const Color(0xFF121212),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white12)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFDC2626))),
      ),
    );
  }
}