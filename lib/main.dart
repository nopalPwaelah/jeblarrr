import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Pastikan path ini sesuai dengan folder kamu

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
      // Hapus 'const' jika di HomePage ada variabel yang tidak konstan
      home: HomePage(), 
    );
  }
}