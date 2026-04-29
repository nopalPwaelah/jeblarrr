import 'package:flutter/material.dart';
import '../product_card.dart'; // Buat file terpisah untuk ProductCard jika perlu
import '../../pages/order_page.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menu sesuai dengan halaman pesanan
    final List<Map<String, dynamic>> products = [
      {
        'level': 'Original',
        'title': 'Mie Jebew Original',
        'price': 'Rp 15.000',
        'colors': [const Color(0xFFEAB308), const Color(0xFFF97316)],
      },
      {
        'level': 'Pedas 🌶',
        'title': 'Mie Pedas',
        'price': 'Rp 16.000',
        'colors': [const Color(0xFFF97316), const Color(0xFFEF4444)],
      },
      {
        'level': 'Kornet',
        'title': 'Mie Jebew Kornet',
        'price': 'Rp 17.000',
        'colors': [const Color(0xFFF97316), const Color(0xFFEF4444)],
      },
      {
        'level': 'Bakso',
        'title': 'Mie Jebew Bakso',
        'price': 'Rp 17.000',
        'colors': [const Color(0xFFEF4444), const Color(0xFFDC2626)],
      },
      {
        'level': 'Sosis',
        'title': 'Mie Jebew Sosis',
        'price': 'Rp 19.000',
        'colors': [const Color(0xFFDC2626), const Color(0xFF991B1B)],
      },
      {
        'level': 'Spesial 👑',
        'title': 'Mie Jebew Spesial',
        'price': 'Rp 22.000',
        'colors': [const Color(0xFF7C3AED), const Color(0xFFDC2626)],
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "SEMUA MENU",
            style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pilih Menu Favoritmu",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children:products.map((p) => ProductCard(
              level: p['level'],
              title: p['title'],
              price: p['price'],
              colors: p['colors'],
              onPilih: () => Navigator.push( // ← TAMBAH
                context,
                MaterialPageRoute(builder: (_) => const OrderPage()),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}