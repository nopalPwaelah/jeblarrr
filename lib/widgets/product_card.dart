import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String level;
  final String title;
  final String price;
  final List<Color> colors;

  // Menggunakan super.key (fitur Flutter terbaru agar lebih rapi)
  const ProductCard({
    super.key,
    required this.level,
    required this.title,
    required this.price,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // Menggunakan .withValues() jika Flutter kamu versi paling baru, 
            // atau tetap .withOpacity() tapi pastikan tidak const di atasnya.
            color: Colors.black.withOpacity(0.05), 
            blurRadius: 15, 
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              level, 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title, 
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            price, 
            style: const TextStyle(
              fontSize: 20, 
              color: Color(0xFFDC2626), 
              // PERBAIKAN: Mengganti .black menjadi .w900
              fontWeight: FontWeight.w900, 
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white, // Warna teks tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("PILIH"),
          )
        ],
      ),
    );
  }
}