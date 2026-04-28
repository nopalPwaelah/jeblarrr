import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Hapus MediaQuery height agar ukurannya mengikuti Expanded dari AboutPage
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          const Text("TENTANG KAMI", style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text(
            "Kenalan Yuk dengan JEBLARR",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: const Text(
              "Kami hadir untuk para pencinta pedas sejati yang berani menantang batas kepedasan! JEBLARR bukan sekadar mie pedas biasa—ini adalah tantangan buat nyali kamu.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey, height: 1.6),
            ),
          ),
          const SizedBox(height: 60),
          // Baris fitur bisa ditambahkan di sini
        ],
      ),
    );
  }
}