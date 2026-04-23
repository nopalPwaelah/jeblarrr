import 'package:flutter/material.dart';

class PromotionSection extends StatelessWidget {
  // Menggunakan super.key agar lebih modern
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFDC2626),
        image: const DecorationImage(
          image: NetworkImage('https://www.transparenttextures.com/patterns/carbon-fibre.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.1, // Di beberapa versi Flutter, opacity di dalam DecorationImage bisa menyebabkan error jika boxdecoration-nya const
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.stars, color: Color(0xFFEAB308), size: 50),
          const SizedBox(height: 20),
          const Text(
            "PROMO HARI INI!",
            style: TextStyle(
              color: Colors.white, 
              fontSize: 40, 
              // PERBAIKAN: Ganti .black menjadi .w900
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Beli 2 Level 5 Gratis Es Teh Manis! Berlaku tiap Jumat.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 40),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              // Menambahkan warna teks agar tetap putih saat ditekan
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "KLAIM PROMO", 
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}