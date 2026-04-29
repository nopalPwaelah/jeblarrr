import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';
import 'contact_page.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'promotion_page.dart';
import 'order_page.dart';


class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Data Anggota Kelompok
  final List<Map<String, dynamic>> teamMembers = [
    {
      'id': 1,
      'name': 'Naufal Ap',
      'role': 'Project Leader',
      'desc': 'Bertanggung jawab atas visi produk dan koordinasi tim Jeblarrr.',
      'image': 'assets/images/foto_1.jpg',
      'color': Colors.orange
    },
    {
      'id': 2,
      'name': 'Teman 1',
      'role': 'Lead Developer',
      'desc': 'Ahli dalam menyusun logika Flutter dan memastikan aplikasi berjalan mulus.',
      'image': 'assets/images/foto_2.jpg',
      'color': Colors.blue
    },
    {
      'id': 3,
      'name': 'Teman 2',
      'role': 'UI/UX Designer',
      'desc': 'Menjaga estetika visual Jeblarrr agar selalu menggugah selera.',
      'image': 'assets/images/foto_3.jpg',
      'color': Colors.green
    },
  ];

  Map<String, dynamic>? selectedMember;

  @override
  void initState() {
    super.initState();
    selectedMember = teamMembers[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: CustomNavigationDrawer(
        onNavigate: (section) {
          if (section == 'home') Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 140),
                const Text(
                  "\"SEPEDAS EKSPRESIMU,\nSEKUAT NYALIMU!\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFFE12027)),
                ),
                const SizedBox(height: 40),

                // AREA TRANSISI DETAIL
                Container(
                  height: 480,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      key: ValueKey<int>(selectedMember!['id']),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: selectedMember!['color'],
                          backgroundImage: AssetImage(selectedMember!['image']),
                          onBackgroundImageError: (e, s) => debugPrint("Error load image"),
                        ),
                        const SizedBox(height: 15),
                        Text(selectedMember!['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(selectedMember!['role'].toUpperCase(), 
                          style: const TextStyle(color: Color(0xFFE12027), fontWeight: FontWeight.w800, letterSpacing: 2)),
                        const SizedBox(height: 15),
                        Text(selectedMember!['desc'], textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
                        const SizedBox(height: 25),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon(Icons.camera_alt_outlined, "Instagram", Colors.pink),
                            _buildSocialIcon(Icons.business_center_outlined, "LinkedIn", Colors.blue[800]!),
                            _buildSocialIcon(Icons.facebook_outlined, "Facebook", Colors.blue[600]!),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // --- BAGIAN SELECTOR (YANG TADI ERROR) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: teamMembers.map((member) {
                      bool isSelected = selectedMember?['id'] == member['id'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMember = member;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFFE12027) : Colors.transparent, 
                              width: 3,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30, 
                            backgroundImage: AssetImage(member['image']),
                          ),
                        ),
                      );
                    }).toList(), // Pastikan ada .toList() dan ditutup dengan benar
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          HeaderBar(
            onNavigate: (section) => section == 'home' ? Navigator.pop(context) : null,
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () {},
          ),
        ],
      ),
    );
  }

  // Fungsi helper diletakkan di dalam class _AboutPageState
  Widget _buildSocialIcon(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          debugPrint("Membuka $label milik ${selectedMember!['name']}");
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 5),
            Text(label, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}