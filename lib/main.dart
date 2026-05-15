import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/promotion_page.dart';
import 'pages/menu_page.dart';
import 'pages/order_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JEBLARR - Mie Jebew',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Menggunakan colorScheme agar lebih modern (Material 3)
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDC2626),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => const AboutPage(),
        '/promotion': (context) => const PromotionPage(),
        '/products': (context) => const MenuPage(),
        '/order': (context) => const OrderPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}