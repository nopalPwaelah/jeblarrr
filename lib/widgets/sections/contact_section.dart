import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  // Menggunakan super.key agar lebih modern
  const ContactSection({super.key});

  Future<void> _openWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/628123456789'); // Ganti dengan nomor asli
    
    // Perbaikan logika launcher untuk versi terbaru
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Tidak dapat membuka WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "HUBUNGI KAMI", 
            style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Lokasi & Pemesanan", 
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _contactBox(
                Icons.location_on, 
                "Outlet Utama", 
                "Jl. Pedas Berapi No. 123, Bandung",
              ),
              // PERBAIKAN: Mengganti Icons.whatsapp menjadi Icons.chat_bubble
              _contactBox(
                Icons.chat_bubble, 
                "WhatsApp", 
                "0812-3456-7890", 
                onTap: _openWhatsApp,
              ),
              _contactBox(
                Icons.access_time, 
                "Jam Buka", 
                "Setiap Hari: 10.00 - 22.00",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactBox(IconData icon, String title, String detail, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFFDC2626), size: 40),
            const SizedBox(height: 15),
            Text(
              title, 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              detail, 
              textAlign: TextAlign.center, 
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}