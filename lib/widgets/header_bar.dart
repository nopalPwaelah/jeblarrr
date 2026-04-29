import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onMenuPressed;
  final VoidCallback onOrderPressed;

  const HeaderBar({
    super.key,
    required this.onNavigate,
    required this.onMenuPressed,
    required this.onOrderPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: Color(0xFFDC2626), width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Section
          InkWell(
            onTap: () => onNavigate('home'),
            child: Row(
              children: [
                const Icon(Icons.local_fire_department, color: Color(0xFFEAB308), size: 30),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'JEBLARR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    Text(
                      'Mie Jebew',
                      style: TextStyle(
                          color: Color(0xFFDC2626),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Navigation Links
          if (!isMobile)
            Row(
              children: [
                _navLink('Home', () => onNavigate('home')),
                _navLink('Tentang', () => onNavigate('about')),
                _navLink('Menu', () => onNavigate('products')),
                _navLink('Promo', () => onNavigate('promotion')),
                _navLink('Kontak', () => onNavigate('contact')),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: onOrderPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC2626),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('PESAN SEKARANG'),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              onPressed: onMenuPressed,
            ),
        ],
      ),
    );
  }

  Widget _navLink(String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}