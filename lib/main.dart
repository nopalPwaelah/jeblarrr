import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const JeblarrApp());
}

class JeblarrApp extends StatelessWidget {
  const JeblarrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JEBLARR - Mie Jebew',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFDC2626),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter', // Pastikan font ini terdaftar di pubspec.yaml
      ),
      home: const HomePage(),
    );
  }
}