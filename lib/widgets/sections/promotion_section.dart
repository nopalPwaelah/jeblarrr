import 'package:flutter/material.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // Satu layar penuh
      width: double.infinity,
      color: const Color(0xFFDC2626),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.stars, color: Color(0xFFEAB308), size: 100),
          const SizedBox(height: 30),
          const Text(
            "PROMO HARI INI!",
            style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 20),
          const Text(
            "Beli 2 Level 5 Gratis Es Teh Manis! Berlaku tiap Jumat.",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
            child: const Text("KLAIM PROMO", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}