import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProductsPressed;
  
  // Menggunakan super.key agar lebih ringkas dan modern
  const HeroSection({super.key, required this.onProductsPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "JEBLARR",
            style: TextStyle(
              color: Colors.white, 
              fontSize: 80, 
              // PERBAIKAN: Ganti .black menjadi .w900
              fontWeight: FontWeight.w900, 
              letterSpacing: 5,
            ),
          ),
          const Text(
            "\"Sepedas Ekspresimu, Sekuat Nyalimu\"",
            style: TextStyle(
              color: Color(0xFFEAB308), 
              fontSize: 24, 
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onProductsPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white, // Warna teks tombol
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "COBA SEKARANG", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}