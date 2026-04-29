import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String level;
  final String title;
  final String price;
  final String? oldPrice;
  final String? image;
  final List<Color> colors;
  final VoidCallback onPilih;

  const ProductCard({
    super.key,
    required this.level,
    required this.title,
    required this.price,
    required this.colors,
    required this.onPilih,
    this.oldPrice,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 340, // 🔥 FIX OVERFLOW (tinggi dibuat tetap)
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              level,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 🍜 Icon / Image
          Center(
            child: image != null
                ? Image.asset(
                    image!,
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("🍜", style: TextStyle(fontSize: 55));
                    },
                  )
                : const Text("🍜", style: TextStyle(fontSize: 55)),
          ),

          const SizedBox(height: 10),

          // 📝 Nama
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),

          const Spacer(), // 🔥 BIAR RAPI & TIDAK NGE-PUSH KE BAWAH

          // 💸 Harga (FIX coret harga lama)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (oldPrice != null) ...[
                Text(
                  oldPrice!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough, // 🔥 CORET
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFDC2626),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔘 Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPilih,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Pesan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}