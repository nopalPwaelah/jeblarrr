import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProductsPressed;
  const HeroSection({super.key, required this.onProductsPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // KUNCINYA: Tinggi dibuat setinggi layar (Viewport Height)
      height: MediaQuery.of(context).size.height, 
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "JEBLARR",
            style: TextStyle(
              color: Colors.white, 
              fontSize: 80, 
              fontWeight: FontWeight.w900, 
              letterSpacing: 10
            ),
          ),
          const Text(
            "\"Sepedas Ekspresimu, Sekuat Nyalimu\"",
            style: TextStyle(color: Color(0xFFEAB308), fontSize: 24, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: onProductsPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            ),
            child: const Text("COBA SEKARANG", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }
}