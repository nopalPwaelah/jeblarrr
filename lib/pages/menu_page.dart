import 'package:flutter/material.dart';
import 'order_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _selectedFilter = 'Semua';

  // --- DATA MENU (Struktur sudah diperbarui menggunakan Image Asset) ---
  final List<Map<String, dynamic>> _menus = [
    {
      'name': 'Mie Jebew Original',
      'level': 'Original',
      'levelNum': 0,
      'price': 15000,
      'desc': 'Mie dengan kuah gurih khas Jeblarr tanpa rasa pedas.',
      'ingredients': ['Mie premium', 'Kuah kaldu ayam', 'Sayuran segar', 'Telur'],
      'image': 'assets/images/mi_jebew_1.jpg', // Path ke gambar
      'color': const Color(0xFFF97316), // Warna identitas menu (opsional)
    },
    {
      'name': 'Mie Pedas',
      'level': 'Pedas',
      'levelNum': 1,
      'price': 16000,
      'desc': 'Pedas ringan yang bikin nagih. Cocok untuk pemula.',
      'ingredients': ['Mie premium', 'Sambal pedas', 'Kuah kaldu', 'Sayuran', 'Telur'],
      'image': 'assets/images/mi_jebew_2.jpg',
      'color': const Color(0xFFEF4444),
    },
    {
      'name': 'Mie Jebew Kornet',
      'level': 'Kornet',
      'levelNum': 2,
      'price': 17000,
      'desc': 'Mie spesial dengan topping daging kornet yang empuk.',
      'ingredients': ['Mie premium', 'Daging kornet', 'Kuah kaldu', 'Sayuran', 'Telur'],
      'image': 'assets/images/mi_jebew_6.jpg',
      'color': const Color(0xFFDC2626),
    },
    {
      'name': 'Mie Jebew Bakso',
      'level': 'Bakso',
      'levelNum': 3,
      'price': 17000,
      'desc': 'Mie dengan bakso sapi premium yang lembut.',
      'ingredients': ['Mie premium', 'Bakso sapi', 'Kuah kaldu', 'Sayuran', 'Telur'],
      'image': 'assets/images/mi_jebew_4.jpg',
      'color': const Color(0xFF991B1B),
    },
    {
      'name': 'Mie Jebew Sosis',
      'level': 'Sosis',
      'levelNum': 4,
      'price': 19000,
      'desc': 'Mie dengan sosis premium yang gurih dan juicy.',
      'ingredients': ['Mie premium', 'Sosis berkualitas', 'Kuah kaldu', 'Sayuran', 'Telur'],
      'image': 'assets/images/mi_jebew_5.jpg',
      'color': const Color(0xFFDC2626),
    },
    {
      'name': 'Mie Jebew Spesial',
      'level': 'Spesial',
      'levelNum': 5,
      'price': 22000,
      'desc': 'Menu andalan Jeblarr! Perpaduan rasa gurih dan topping lengkap.',
      'ingredients': ['Mie premium', 'Topping keju', 'Ayam suwir', 'Sosis', 'Bakso'],
      'image': 'assets/images/mi_jebew_3.jpg',
      'color': const Color(0xFF7C3AED),
    },
  ];

  final List<String> _filters = ['Semua', 'Original', 'Pedas', 'Kornet', 'Bakso', 'Sosis', 'Spesial'];

  List<Map<String, dynamic>> get _filteredMenus {
    if (_selectedFilter == 'Semua') return _menus;
    return _menus.where((m) => m['level'] == _selectedFilter).toList();
  }

  String _formatRupiah(int amount) {
    return 'Rp ${amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    )}';
  }

  void _showDetail(Map<String, dynamic> menu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _DetailSheet(
        menu: menu,
        formatRupiah: _formatRupiah,
        onOrder: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderPage()));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Icon(Icons.local_fire_department, color: Color(0xFFFFB300), size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('JEBLARR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Mie Jebew', style: TextStyle(color: Color(0xFFE53935), fontSize: 11)),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFE53935)),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: const Column(
              children: [
                Text('MENU KAMI', style: TextStyle(color: Color(0xFFE53935), fontWeight: FontWeight.bold, letterSpacing: 2)),
                SizedBox(height: 6),
                Text('Pilih Level Kepedasanmu', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final isSelected = _selectedFilter == _filters[i];
                return GestureDetector(
                  onTap: () => setState(() => _selectedFilter = _filters[i]),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFE53935) : const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isSelected ? const Color(0xFFE53935) : Colors.white12),
                    ),
                    child: Text(
                      _filters[i],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white54,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _filteredMenus.isEmpty
                ? const Center(child: Text('Menu tidak ditemukan', style: TextStyle(color: Colors.white38)))
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.7, // Disesuaikan agar muat gambar + teks
                    ),
                    itemCount: _filteredMenus.length,
                    itemBuilder: (_, i) => _MenuCard(
                      menu: _filteredMenus[i],
                      formatRupiah: _formatRupiah,
                      onTap: () => _showDetail(_filteredMenus[i]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Perbaikan Menu Card (Menggunakan Image.asset) ────────────────
class _MenuCard extends StatelessWidget {
  final Map<String, dynamic> menu;
  final String Function(int) formatRupiah;
  final VoidCallback onTap;

  const _MenuCard({required this.menu, required this.formatRupiah, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN GAMBAR (Ganti Emoji) ---
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 1.2, // Mengunci rasio gambar agar seragam
                child: Image.asset(
                  menu['image'],
                  fit: BoxFit.cover, // Gambar memenuhi area
                  errorBuilder: (context, error, stackTrace) {
                    // Jika gambar gagal dimuat, tampilkan placeholder
                    return Container(
                      color: Colors.grey[800],
                      child: const Icon(Icons.fastfood, color: Colors.white30, size: 40),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge level
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: menu['color'].withOpacity(0.2), // Pakai warna menu
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: menu['color'], width: 1),
                    ),
                    child: Text(
                      menu['level'],
                      style: TextStyle(color: menu['color'], fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    menu['name'],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRupiah(menu['price']),
                    style: const TextStyle(color: Color(0xFFFFB300), fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE53935),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text('Detail', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Perbaikan Detail Sheet (Menggunakan Image.asset) ────────────
class _DetailSheet extends StatelessWidget {
  final Map<String, dynamic> menu;
  final String Function(int) formatRupiah;
  final VoidCallback onOrder;

  const _DetailSheet({required this.menu, required this.formatRupiah, required this.onOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40, height: 4,
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(height: 20),

          // --- GAMBAR DI DETAIL SHEET ---
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              menu['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
               errorBuilder: (context, error, stackTrace) => Container(
                height: 200, color: Colors.grey[800],
                child: const Icon(Icons.fastfood, color: Colors.white30, size: 60),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: menu['color'].withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: menu['color']),
            ),
            child: Text(menu['level'], style: TextStyle(color: menu['color'], fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          const SizedBox(height: 10),

          // Nama & Harga
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(menu['name'],
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Text(formatRupiah(menu['price']),
                style: const TextStyle(color: Color(0xFFFFB300), fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),

          // Deskripsi
          Text(menu['desc'], style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.5)),
          const SizedBox(height: 16),

          // Bahan
          const Text('Bahan-bahan:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (menu['ingredients'] as List<String>).map((ing) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: Text(ing, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            )).toList(),
          ),
          const SizedBox(height: 24),

          // Tombol
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: onOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: const Text('PESAN SEKARANG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }
}