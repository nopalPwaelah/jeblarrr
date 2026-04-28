import 'package:flutter/material.dart';
import 'order_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _selectedFilter = 'Semua';

  final List<Map<String, dynamic>> _menus = [
    {
      'name': 'Mie Jebew Original',
      'level': 'Original',
      'levelNum': 0,
      'price': 15000,
      'desc': 'Mie dengan kuah gurih khas Jeblarr tanpa rasa pedas. Cocok untuk kamu yang suka rasa original.',
      'ingredients': ['Mie premium', 'Kuah kaldu ayam', 'Sayuran segar', 'Telur'],
      'colors': [const Color(0xFFEAB308), const Color(0xFFF97316)],
      'emoji': '🍜',
    },
    {
      'name': 'Mie Jebew Pedas',
      'level': 'Level 1',
      'levelNum': 1,
      'price': 17000,
      'desc': 'Pedas ringan yang bikin nagih. Level pertama dari seri Jebew — cocok untuk pemula.',
      'ingredients': ['Mie premium', 'Sambal level 1', 'Kuah kaldu', 'Sayuran', 'Telur'],
      'colors': [const Color(0xFFF97316), const Color(0xFFEF4444)],
      'emoji': '🌶',
    },
    {
      'name': 'Mie Jebew Extra',
      'level': 'Level 2',
      'levelNum': 2,
      'price': 17000,
      'desc': 'Pedasnya mulai terasa! Level 2 untuk kamu yang sudah terbiasa dengan pedas.',
      'ingredients': ['Mie premium', 'Sambal level 2', 'Kuah pedas', 'Sayuran', 'Telur'],
      'colors': [const Color(0xFFEF4444), const Color(0xFFDC2626)],
      'emoji': '🌶🌶',
    },
    {
      'name': 'Mie Jebew Gila',
      'level': 'Level 3',
      'levelNum': 3,
      'price': 19000,
      'desc': 'Bukan untuk yang lemah nyali! Level 3 hadir dengan kepedasan ekstrem yang menantang.',
      'ingredients': ['Mie premium', 'Sambal level 3', 'Cabai rawit extra', 'Sayuran', 'Telur'],
      'colors': [const Color(0xFFDC2626), const Color(0xFF991B1B)],
      'emoji': '🌶🌶🌶',
    },
    {
      'name': 'Mie Jebew Spesial',
      'level': 'Spesial',
      'levelNum': 4,
      'price': 22000,
      'desc': 'Menu andalan Jeblarr! Perpaduan rasa gurih, pedas, dan topping spesial yang tidak ada duanya.',
      'ingredients': ['Mie premium', 'Sambal spesial', 'Topping keju', 'Ayam suwir', 'Sayuran', 'Telur'],
      'colors': [const Color(0xFF7C3AED), const Color(0xFFDC2626)],
      'emoji': '👑',
    },
  ];

  final List<String> _filters = ['Semua', 'Original', 'Level 1', 'Level 2', 'Level 3', 'Spesial'];

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
          // Header
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

          // Filter Chips
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
                      border: Border.all(
                        color: isSelected ? const Color(0xFFE53935) : Colors.white12,
                      ),
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

          // Grid
          Expanded(
            child: _filteredMenus.isEmpty
                ? const Center(
                    child: Text('Menu tidak ditemukan', style: TextStyle(color: Colors.white38)),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.78,
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

// ── Menu Card ──────────────────────────────────────────
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
            // Gambar/Emoji placeholder
            Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: menu['colors'],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Text(menu['emoji'], style: const TextStyle(fontSize: 52)),
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
                      gradient: LinearGradient(colors: menu['colors']),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      menu['level'],
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    menu['name'],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 2,
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

// ── Detail Bottom Sheet ────────────────────────────────
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

          // Emoji + gradient header
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: menu['colors'], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: Text(menu['emoji'], style: const TextStyle(fontSize: 64))),
          ),
          const SizedBox(height: 20),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: menu['colors']),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(menu['level'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
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