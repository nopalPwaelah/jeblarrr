import 'package:flutter/material.dart';
import '../../pages/order_page.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> promoProducts = [
      {
        'name': 'PROMO BUNDLING HOKA OISHII BER-2',
        'price': 'Rp. 84.546',
        'icon': '🍜',
      },
      {
        'name': 'PROMO BUNDLING HOKA OISHII BER-3',
        'price': 'Rp. 108.182',
        'icon': '🍜',
      },
      {
        'name': 'PROMO BUNDLING HOKA OISHII BER-3 - KARUBI SERIES',
        'price': 'Rp. 108.182',
        'icon': '🍜',
      },
      {
        'name': 'PROMO BUNDLING HOKA OISHII BER-4',
        'price': 'Rp. 126.364',
        'icon': '🍜',
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFDC2626),
        image: const DecorationImage(
          image: NetworkImage('https://www.transparenttextures.com/patterns/carbon-fibre.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.1,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(Icons.stars, color: Color(0xFFEAB308), size: 50),
            const SizedBox(height: 20),
            const Text(
              "PROMO HARI INI!",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 40, 
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Beli 2 Level 5 Gratis Es Teh Manis! Berlaku tiap Jumat.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 50),
            // Grid Promo Products
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: promoProducts.map((promo) {
                return Container(
                  width: 280,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Product Icon Area
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        ),
                        child: Center(
                          child: Text(
                            promo['icon'],
                            style: const TextStyle(fontSize: 60),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Promo Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDC2626),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'PROMO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Product Name
                      Text(
                        promo['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Price
                      Text(
                        promo['price'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFDC2626),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Buttons Row
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                  color: Color(0xFFDC2626),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const OrderPage()),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFACC15),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                '+ Order',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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