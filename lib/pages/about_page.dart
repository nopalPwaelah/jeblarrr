import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Wajib ada
import '../widgets/header_bar.dart';
import '../widgets/navigation_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // --- DATA ANGGOTA TIM DENGAN LINK SOSIAL MEDIA ---
  final List<Map<String, dynamic>> teamMembers = [
    {
      'id': 1,
      'name': 'Naufal Ap',
      'role': 'Project Leader',
      'desc': 'Bertanggung jawab atas visi produk dan koordinasi tim Jeblarrr.',
      'image': 'assets/images/aku.png',
      'color': Colors.orange,
      'instagram': 'https://www.instagram.com/fallsapprdn05_?igsh=aHRscm5udTJhazd5', // Ganti dengan link asli
      'github': 'https://github.com/nopalPwaelah', 
    },
    {
      'id': 2,
      'name': 'Dava Firmansyah',
      'role': 'Lead Developer',
      'desc': 'Ahli dalam menyusun logika Flutter dan memastikan aplikasi berjalan mulus.',
      'image': 'assets/images/dava.png',
      'color': Colors.blue,
      'instagram': 'https://www.instagram.com/amad_firmn?igsh=MWtqa3htdWFjNW9kcA==',
      'github': 'https://github.com/mdavafirmansyah',
    },
    {
      'id': 3,
      'name': 'Naufal Yudantara',
      'role': 'UI/UX Designer',
      'desc': 'Menjaga estetika visual Jeblarrr agar selalu menggugah selera.',
      'image': 'assets/images/nopal_y.png',
      'color': Colors.green,
      'instagram': 'https://www.instagram.com/nuflydtr7?igsh=OHR6cG9hNTYzMWNy&utm_source=qr',
      'github': 'https://github.com/naufalyudantara07',
    },
  ];

  Map<String, dynamic>? selectedMember;

  @override
  void initState() {
    super.initState();
    selectedMember = teamMembers[0];
  }

  // --- FUNGSI UNTUK MEMBUKA LINK ---
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal membuka link: $urlString')),
      );
    }
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
                  style: TextStyle(
                    fontSize: 32, 
                    fontWeight: FontWeight.w900, 
                    color: Color(0xFFE12027),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),

                // --- AREA DETAIL ANGGOTA ---
                Container(
                  height: 480,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), 
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      key: ValueKey<int>(selectedMember!['id']),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: selectedMember!['color'],
                          backgroundImage: AssetImage(selectedMember!['image']),
                          onBackgroundImageError: (e, s) => debugPrint("Error load image"),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          selectedMember!['name'], 
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          selectedMember!['role'].toUpperCase(), 
                          style: const TextStyle(
                            color: Color(0xFFE12027), 
                            fontWeight: FontWeight.w800, 
                            letterSpacing: 2,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            selectedMember!['desc'], 
                            textAlign: TextAlign.center, 
                            style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        // --- TOMBOL SOSIAL MEDIA ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon(
                              Icons.camera_alt_outlined, 
                              "Instagram", 
                              Colors.pink, 
                              selectedMember!['instagram'],
                            ),
                            const SizedBox(width: 25),
                            _buildSocialIcon(
                              Icons.code_rounded, 
                              "GitHub", 
                              const Color(0xFF24292E), 
                              selectedMember!['github'],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // --- SELECTOR ANGGOTA (KECIL) ---
                const Text(
                  "Kenali Tim Kami",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 15),
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
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          
          // --- HEADER BAR ---
          HeaderBar(
            onNavigate: (section) => section == 'home' ? Navigator.pop(context) : null,
            onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onOrderPressed: () {},
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER UNTUK IKON SOSIAL MEDIA ---
  Widget _buildSocialIcon(IconData icon, String label, Color color, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label, 
            style: TextStyle(
              fontSize: 12, 
              color: color, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}