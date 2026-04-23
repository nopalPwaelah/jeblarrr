import 'package:flutter/material.dart';
import '../product_card.dart'; // Buat file terpisah untuk ProductCard jika perlu

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pindahkan list products ke sini
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "MENU SPESIAL",
            style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pilih Level Kepedasanmu",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              // Tambahkan ProductCard di sini
            ],
          ),
        ],
      ),
    );
  }
}