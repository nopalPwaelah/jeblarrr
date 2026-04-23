import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final Function(String) onNavigate;

  const CustomNavigationDrawer({Key? key, required this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFDC2626)),
            child: Center(
              child: Icon(Icons.local_fire_department, color: Colors.white, size: 80),
            ),
          ),
          _drawerTile('Home', Icons.home, () => onNavigate('home')),
          _drawerTile('Tentang Kami', Icons.info, () => onNavigate('about')),
          _drawerTile('Menu Spesial', Icons.restaurant_menu, () => onNavigate('products')),
          _drawerTile('Promo', Icons.discount, () => onNavigate('promotion')),
          _drawerTile('Hubungi Kami', Icons.phone, () => onNavigate('contact')),
        ],
      ),
    );
  }

  Widget _drawerTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFDC2626)),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}