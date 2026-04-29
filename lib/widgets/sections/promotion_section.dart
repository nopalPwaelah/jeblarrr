import 'package:flutter/material.dart';
import '../../pages/order_page.dart';
import '../product_card.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> promoProducts = [
  {
    'name': 'Mie Jebew Kornet',
    'price': 'Rp. 15.000',
    'oldPrice': 'Rp. 17.000',
    'image': 'images/mie_jeblarr_kornet.jpg',
  },
  {
    'name': 'Mie Jebew Bakso',
    'price': 'Rp. 15.000',
    'oldPrice': 'Rp. 17.000',
  },
  {
    'name': 'Mie Jebew Sosis',
    'price': 'Rp. 16.000',
    'oldPrice': 'Rp. 19.000',
  },
];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFDC2626),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(Icons.local_offer,
                color: Color(0xFFFACC15), size: 50),
            const SizedBox(height: 20),

            const Text(
              "PROMO SPESIAL HARI INI!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            const Text(
              "Nikmati mie favoritmu dengan harga lebih hemat hari ini!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 50),

            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: promoProducts.map((promo) {
                return ProductCard(
                  level: "DISKON",
                  title: promo['name'],
                  price: promo['price'],
                  oldPrice: promo['oldPrice'],
                  image: promo['image'],
                  colors: const [Color(0xFFDC2626), Color(0xFFF87171)],
                  onPilih: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderPage(),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}