import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onMenuPressed;
  final VoidCallback onOrderPressed;
  // Tambahkan variabel untuk melacak halaman aktif
  final String currentPage;

  const HeaderBar({
    super.key,
    required this.onNavigate,
    required this.onMenuPressed,
    required this.onOrderPressed,
    this.currentPage = 'home', // Default ke home
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
                Image.asset(
                  'assets/images/logo_jeblarrr.png',
                  height: 40,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.local_fire_department, color: Color(0xFFEAB308), size: 30),
                ),
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

          // Tombol Navigasi Desktop
          if (!isMobile)
            Row(
              children: [
                _navLink('Home', 'home'),
                _navLink('Tentang', 'about'),
                _navLink('Menu', 'products'),
                _navLink('Promo', 'promotion'),
                _navLink('Kontak', 'contact'),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: onOrderPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC2626),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('PESAN SEKARANG', style: TextStyle(fontWeight: FontWeight.bold)),
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

  // Widget navigasi yang lebih cerdas
  Widget _navLink(String title, String route) {
    // Cek apakah tombol ini adalah halaman yang sedang dibuka
    final bool isActive = currentPage == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () => onNavigate(route),
        style: TextButton.styleFrom(
          // Memberikan feedback warna saat diklik/aktif
          foregroundColor: isActive ? const Color(0xFFDC2626) : Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                fontSize: 15,
              ),
            ),
            // Indikator garis bawah jika aktif
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 2), // Perbaikan di sini
                height: 2,
                width: 20,
                color: const Color(0xFFDC2626),
             )
          ],
        ),
      ),
    );
  }
}