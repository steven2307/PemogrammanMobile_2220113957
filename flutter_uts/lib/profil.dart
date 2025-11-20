import 'package:flutter/material.dart';
import 'beranda.dart'; 

void main() {
  runApp(const GrabAccountApp());
}

class GrabAccountApp extends StatelessWidget {
  const GrabAccountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab Account Page',
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER + PROFILE + CONTAINER DASBOR =================
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  height: 180,
                  color: const Color(0xFFEEFAFA),
                  padding: const EdgeInsets.fromLTRB(16, 15, 16, 110),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),
                ),
                // Container Dasbor
                Container(
                  margin: const EdgeInsets.only(top: 170),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // TAB DASBOR/AKTIVITAS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Dasbor",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D7A50),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 100,
                                height: 3,
                                color: const Color(0xFF0D7A50),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Aktivitas",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 100,
                                height: 1,
                                color: Colors.grey[500],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: const [
                          Expanded(child: SuperBankImageCard()),
                          SizedBox(width: 12),
                          Expanded(
                              child: CustomImageCard(
                                  imagePath: "assets/images/image4.png")),
                        ],
                      ),
                    ],
                  ),
                ),
                // Profile
                // PROFILE CARD
                Positioned(
                  top: 80,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row utama: gambar profile + nama + tombol Profil
                        Row(
                          children: [
                            Image.asset("assets/images/profile.png", width: 52, height: 52),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                "Steven",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEFF9F8), elevation: 0),
                              child: const Text(
                                "Profil",
                                style: TextStyle(
                                  color: Color(0xFF22423D),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Kotak kecil di bawah
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,         
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/unlimitedm.png", width: 24, height: 24),
                              const SizedBox(width: 8),
                              const Text(
                                "Bergabung dengan Grab Unlimited",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )


              ],
            ),
            const SizedBox(height: 20), // memberi ruang untuk profile menindih container

            // ========================== ROW 2 ==========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Expanded(child: Family()),
                  SizedBox(width: 12),
                  Expanded(child: CustomCard(title: "Profil Bisnis")),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ========================== LEBIH BANYAK KEUNTUNGAN ==========================
            // ========================== BAGIAN LEBIH BANYAK KEUNTUNGAN ==========================
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16), // padding atas bawah
              child: Column(
                children: [
                  // Baris 1: Lebih banyak keuntungan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lebih banyak keuntungan",
                        style: TextStyle(
                          fontSize: 20, // lebih besar
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  // Baris 2: GrabRewards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "GrabRewards",
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: const [
                            Text("0 OVO Points"),
                            SizedBox(width: 6),
                            Icon(Icons.chevron_right),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey[300]),

                  // Baris 3: Langganan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Langganan", style: TextStyle(fontSize: 16)),
                        Icon(Icons.chevron_right),
                      ],
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

// ========================== SUPERBANK IMAGE CARD ==========================
class SuperBankImageCard extends StatelessWidget {
  const SuperBankImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 181,
      child: Image.asset("assets/images/sb.png", fit: BoxFit.cover),
    );
  }
}

// ========================== CUSTOM IMAGE CARD ==========================
class CustomImageCard extends StatelessWidget {
  final String imagePath;
  const CustomImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 181,
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

// ========================== FAMILY CARD ==========================
class Family extends StatelessWidget {
  const Family({super.key});

  final double cardRadius = 15.0;
  final double quarterCircleSize = 65.0;
  final double fullRadius = 65.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: quarterCircleSize,
              height: quarterCircleSize,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(fullRadius),
                  bottomRight: Radius.circular(cardRadius),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Buat Akun Keluarga',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(221, 0, 0, 0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 15.0),
              child: Image.asset('assets/images/family.png', width: 40, height: 40),
            ),
          ),
        ],
      ),
    );
  }
}

// ========================== CUSTOM CARD ==========================
class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title});

  final double cardRadius = 15.0;
  final double quarterCircleSize = 65.0;
  final double fullRadius = 65.0;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: quarterCircleSize,
              height: quarterCircleSize,
              decoration: BoxDecoration(
                color: const Color(0xFFFEF8D5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(fullRadius),
                  bottomRight: Radius.circular(cardRadius),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(221, 0, 0, 0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 15.0),
              child: Image.asset('assets/images/koper.png', width: 40, height: 40),
            ),
          ),
        ],
      ),
    );
  }
}
