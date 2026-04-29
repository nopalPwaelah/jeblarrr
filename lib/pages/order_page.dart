// lib/pages/order_page.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import 'contact_page.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'promotion_page.dart';
import 'order_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedDelivery = 'delivery';

  final List<Map<String, dynamic>> _menuItems = [
    {'name': 'Mie Jebew Original', 'price': 15000, 'qty': 0},
    {'name': 'Mie Pedas', 'price': 16000, 'qty': 0},
    {'name': 'Mie Jebew Kornet', 'price': 17000, 'qty': 0},
    {'name': 'Mie Jebew Bakso', 'price': 17000, 'qty': 0},
    {'name': 'Mie Jebew Sosis', 'price': 19000, 'qty': 0},
    {'name': 'Mie Jebew Spesial', 'price': 22000, 'qty': 0},
  ];

  int get _totalPrice {
    return _menuItems.fold(0, (sum, item) => sum + (item['price'] as int) * (item['qty'] as int));
  }

  int get _totalItems {
    return _menuItems.fold(0, (sum, item) => sum + (item['qty'] as int));
  }

  String _formatRupiah(int amount) {
    return 'Rp ${amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    )}';
  }

  List<Map<String, dynamic>> get _selectedItems =>
      _menuItems.where((item) => (item['qty'] as int) > 0).toList();

  void _submitOrder() {
    if (_totalItems == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilih minimal 1 menu terlebih dahulu!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFFE53935), size: 28),
              SizedBox(width: 8),
              Text('Pesanan Dikirim!', style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terima kasih ${_nameController.text}!',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ..._selectedItems.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '• ${item['name']} x${item['qty']}',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              )),
              const Divider(color: Colors.white24, height: 16),
              Text(
                'Total: ${_formatRupiah(_totalPrice)}',
                style: const TextStyle(color: Color(0xFFFFB300), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Pesanan kamu sedang diproses. Kami akan menghubungi kamu segera.',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pop(context);
              },
              child: const Text('OK', style: TextStyle(color: Color(0xFFE53935))),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'PESAN SEKARANG',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '"Sepedas Ekspresimu, Sekuat Nyalimu"',
                            style: TextStyle(color: Color(0xFFFFB300), fontStyle: FontStyle.italic, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Pilih Menu
                    _sectionTitle('🍜 Pilih Menu'),
                    const SizedBox(height: 4),
                    const Text('Bisa pilih lebih dari 1 menu', style: TextStyle(color: Colors.white38, fontSize: 12)),
                    const SizedBox(height: 12),

                    ...List.generate(_menuItems.length, (i) {
                      final item = _menuItems[i];
                      final qty = item['qty'] as int;
                      final isSelected = qty > 0;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFE53935).withOpacity(0.12) : const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? const Color(0xFFE53935) : Colors.white12,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Info Menu
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'] as String,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.white70,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatRupiah(item['price'] as int),
                                    style: TextStyle(
                                      color: isSelected ? const Color(0xFFFFB300) : Colors.white38,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Subtotal
                            if (isSelected)
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Text(
                                  _formatRupiah((item['price'] as int) * qty),
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                            // Qty Control
                            Row(
                              children: [
                                _qtyButton(
                                  Icons.remove,
                                  qty > 0
                                      ? () => setState(() => _menuItems[i]['qty'] = qty - 1)
                                      : null,
                                ),
                                SizedBox(
                                  width: 36,
                                  child: Text(
                                    '$qty',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.white38,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _qtyButton(
                                  Icons.add,
                                  () => setState(() => _menuItems[i]['qty'] = qty + 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 24),

                    // Metode Pengiriman
                    _sectionTitle('🚗 Metode Pengiriman'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _deliveryOption('delivery', Icons.delivery_dining, 'Delivery')),
                        const SizedBox(width: 12),
                        Expanded(child: _deliveryOption('pickup', Icons.store, 'Ambil Sendiri')),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Data Diri
                    _sectionTitle('👤 Data Diri'),
                    const SizedBox(height: 12),
                    _inputField(
                      controller: _nameController,
                      label: 'Nama Lengkap',
                      icon: Icons.person_outline,
                      validator: (v) => v!.isEmpty ? 'Nama wajib diisi' : null,
                    ),
                    const SizedBox(height: 12),
                    _inputField(
                      controller: _phoneController,
                      label: 'Nomor WhatsApp',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                      validator: (v) => v!.isEmpty ? 'Nomor HP wajib diisi' : null,
                    ),
                    if (_selectedDelivery == 'delivery') ...[
                      const SizedBox(height: 12),
                      _inputField(
                        controller: _addressController,
                        label: 'Alamat Lengkap',
                        icon: Icons.location_on_outlined,
                        maxLines: 3,
                        validator: (v) => v!.isEmpty ? 'Alamat wajib diisi' : null,
                      ),
                    ],
                    const SizedBox(height: 12),
                    _inputField(
                      controller: _notesController,
                      label: 'Catatan (opsional)',
                      icon: Icons.note_outlined,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 28),

                    // Ringkasan Pesanan
                    if (_selectedItems.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE53935).withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('📋 Ringkasan Pesanan',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                            const Divider(color: Colors.white12, height: 24),
                            ..._selectedItems.map((item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${item['name']} x${item['qty']}',
                                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    _formatRupiah((item['price'] as int) * (item['qty'] as int)),
                                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                                  ),
                                ],
                              ),
                            )),
                            const Divider(color: Colors.white12, height: 24),
                            _summaryRow('Total Item', '$_totalItems porsi'),
                            _summaryRow('Pengiriman', _selectedDelivery == 'delivery' ? 'Delivery' : 'Ambil Sendiri'),
                            const Divider(color: Colors.white12, height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('TOTAL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                Text(
                                  _formatRupiah(_totalPrice),
                                  style: const TextStyle(color: Color(0xFFFFB300), fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // Bottom Bar Total + Tombol Order
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              border: const Border(top: BorderSide(color: Color(0xFFE53935), width: 1)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, -4)),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$_totalItems item dipilih',
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                    Text(
                      _formatRupiah(_totalPrice),
                      style: const TextStyle(color: Color(0xFFFFB300), fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submitOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    child: const Text(
                      'PESAN SEKARANG',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      );

  Widget _qtyButton(IconData icon, VoidCallback? onTap) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: onTap != null ? const Color(0xFFE53935) : Colors.white12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: onTap != null ? Colors.white : Colors.white24, size: 16),
        ),
      );

  Widget _deliveryOption(String value, IconData icon, String label) {
    final isSelected = _selectedDelivery == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedDelivery = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE53935).withOpacity(0.15) : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFE53935) : Colors.white12,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFFE53935) : Colors.white38, size: 28),
            const SizedBox(height: 6),
            Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.white54, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white38, size: 20),
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE53935)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        errorStyle: const TextStyle(color: Colors.orange),
      ),
    );
  }

  Widget _summaryRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white54, fontSize: 13)),
            Text(value, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          ],
        ),
      );
}