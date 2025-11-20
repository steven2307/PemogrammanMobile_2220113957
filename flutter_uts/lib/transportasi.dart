import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'beranda.dart';

void main() {
  runApp(const TransportasiApp());
}

class TransportasiApp extends StatelessWidget {
  const TransportasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transportasi',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const TransportasiPage(),
    );
  }
}

class TransportasiPage extends StatelessWidget {
  const TransportasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER + SEARCH BAR =================
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: const Color(0xFFB3ECFF),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bar atas
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // 🔹 Panah kembali ke main.dart
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               HomePage()
                                      ), // ubah sesuai nama halaman utama
                                    );
                                  },
                                  child: const Icon(Icons.arrow_back,
                                      color: Colors.black
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Transportasi",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC5F0FF),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.1),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.map_outlined,
                                      color: Colors.black),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Peta",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Jadwalkan perjalanan untuk\nmomen pentingmu. Tepat wa...",
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Coba sekarang, diskon 30%",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4), // jarak kecil antara teks dan gambar
                            Image.asset(
                              'assets/images/arrow.png', // ganti sesuai nama file panahmu
                              width: 14,
                              height: 14,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  // Gambar kalender di kanan bawah
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Image.asset(
                      'assets/images/calendar.png',
                      height: 149,
                      width: 213,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // ================= SEARCH BAR =================
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: -30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset('assets/images/redloc.png',
                              width: 22, height: 22),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mau ke mana?",
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEFAFA),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/KM.png',
                                  width: 16,
                                  height: 16,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Nanti",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF24433E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // ================= RECENT LOCATIONS =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    timeItem(
                      "22A, Gang Pilitan Sidorejo",
                      "Jl. Rela, Gg. Pilitan No. 22a, Sidorejo, Medan Tembung",
                    ),
                    const SizedBox(height: 12),
                    locationItem(
                      "No.4A Gang Sejahtera Sidorejo",
                      "Jl. Perjuangan, Gg. Sejahtera No. 4a, Sidorejo, Medan",
                    ),
                    const SizedBox(height: 12),
                    locationItem(
                      "PT Eldivo Tunas Artha",
                      "Jl. Williem Iskandar Pasar V Barat, Kenangan Baru",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ================= GRID FITUR =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Perjalanan untuk setiap kebutuhanmu",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    buildMenuCard(
                      title: 'Advance Booking',
                      image: 'assets/images/AB.png',
                      color: const Color(0xFFB3ECFF),
                      height: 170,
                      specialLayout: true,
                    ),
                    buildMenuCard(
                      title: 'Pesan untuk\nKeluarga',
                      image: 'assets/images/PK.png',
                      color: const Color(0xFFFFEC8E),
                      height: 80,
                    ),
                    buildMenuCard(
                      title: 'Sewa Mobil',
                      image: 'assets/images/SM.png',
                      color: const Color(0xFFFFD3AB),
                      height: 80,
                    ),
                    buildMenuCard(
                      title: 'Mobil 6 Kursi',
                      image: 'assets/images/M6K.png',
                      color: const Color(0xFFFFEC8E),
                      height: 80,
                    ),
                    buildMenuCard(
                      title: 'Jemputan Airport',
                      image: 'assets/images/JA.png',
                      color: const Color(0xFFB3ECFF),
                      height: 80,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Pesan perjalananmu di awal",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SUB-WIDGETS =================

  Widget locationItem(String title, String subtitle) {
    return Row(
      children: [
        Image.asset(
          'assets/images/greenloc.png',
          width: 22,
          height: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget timeItem(String title, String subtitle) {
    return Row(
      children: [
        Image.asset(
          'assets/images/time.png',
          width: 22,
          height: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildMenuCard({
    required String title,
    required String image,
    required Color color,
    double height = 120,
    bool specialLayout = false,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: specialLayout
          ? Stack(
              children: [
                Positioned(
                  left: 12,
                  top: 12,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Image.asset(
                    image,
                    width: 65,
                    height: 65,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
    );
  }
}
