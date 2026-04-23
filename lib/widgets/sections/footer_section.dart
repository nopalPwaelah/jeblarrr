import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  // Menggunakan super.key agar lebih simpel
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.local_fire_department, color: Color(0xFFDC2626), size: 40),
              SizedBox(width: 10),
              Text(
                "JEBLARR",
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 28, 
                  // PERBAIKAN: Ganti .black menjadi .w900
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Nikmati sensasi Mie Jebew autentik dengan bumbu rahasia yang bikin nagih.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),
          const Divider(color: Color(0xFF333333)),
          const SizedBox(height: 20),
          const Text(
            "© 2026 JEBLARR Indonesia. Dibuat dengan 🔥 untuk Pencinta Pedas.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}