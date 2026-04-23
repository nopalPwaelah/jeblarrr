import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  // Menggunakan super.key agar lebih modern dan simpel
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          const Text(
            "TENTANG KAMI",
            style: TextStyle(
              color: Color(0xFFDC2626), 
              fontWeight: FontWeight.bold, 
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Kenalan Yuk dengan JEBLARR",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36, 
              // PERBAIKAN: Ganti .black menjadi .w900
              fontWeight: FontWeight.w900, 
            ),
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: const Text(
              "Kami hadir untuk para pencinta pedas sejati yang berani menantang batas kepedasan! "
              "JEBLARR bukan sekadar mie pedas biasa—ini adalah tantangan buat nyali kamu. "
              "Setiap suapan Mie Jebew adalah cerminan keberanian dan ekspresi diri.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey, height: 1.6),
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildFeature(Icons.local_fire_department, "Kualitas Premium", "Bahan pilihan dan cabai segar terbaik."),
              _buildFeature(Icons.verified, "Halal & Higienis", "Proses pembuatan bersih dan terjamin halal."),
              // PERBAIKAN: Nama icon harus huruf kecil semua (sentiment_very_satisfied)
              _buildFeature(Icons.sentiment_very_satisfied, "Nagih Banget", "Rasa gurih pedas yang bikin susah berhenti."),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String desc) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFDC2626), size: 40),
          const SizedBox(height: 16),
          Text(
            title, 
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            desc, 
            textAlign: TextAlign.center, 
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}