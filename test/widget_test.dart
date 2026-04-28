import 'package:flutter_test/flutter_test.dart';
import 'package:jeblarrr/main.dart'; // Pastikan import ini sesuai nama projectmu

void main() {
  testWidgets('Memastikan Landing Page Jeblarr muncul', (WidgetTester tester) async {
    // 1. Jalankan aplikasi
    await tester.pumpWidget(const MyApp());

    // 2. Cek apakah teks "JEBLARR" muncul di layar
    // Kita menggunakan findsAtLeastNWidgets(1) karena teks ini muncul di Header dan Hero
    expect(find.text('JEBLARR'), findsAtLeastNWidgets(1));

    // 3. Cek apakah slogan muncul
    expect(find.text('"Sepedas Ekspresimu, Sekuat Nyalimu"'), findsOneWidget);

    // 4. Cek apakah tombol "PESAN SEKARANG" ada
    expect(find.text('PESAN SEKARANG'), findsOneWidget);
  });
}