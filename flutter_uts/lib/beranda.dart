import 'package:flutter/material.dart';
import 'transportasi.dart'; 
import 'profil.dart'; 
import 'pembayaran.dart'; 
import 'kotakmasuk.dart'; 
import 'aktivitas.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beranda',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Daftar menu yang ditampilkan di Grid utama (8 item)
  final List menuItems = [
    {"title": "Makanan", "image": "assets/images/makanan.png"},
    {"title": "Motor", "image": "assets/images/motor.png"},
    {"title": "Mobil", "image": "assets/images/mobil.png"},
    {"title": "Express", "image": "assets/images/express.png"},
    {"title": "Belanja", "image": "assets/images/belanja.png"},
    {"title": "Pulsa & Bills", "image": "assets/images/pulsa.png"},
    {"title": "Dine Out", "image": "assets/images/dine.png"},
    {"title": "Semua", "image": "assets/images/semua.png"}, // Item yang akan membuka menu Semua
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =====================================================
              // HEADER DENGAN GRADIENT & BACKGROUND DIPERBESAR
              // =====================================================
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5AD2B5), Color(0xFF7EE8FA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    // SCAN BUTTON
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/scan.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    // SEARCH BAR
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari makanan",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    // PROFILE BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()), // pastikan ProfilPage() ada di profil.dart
                        );
                      },
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              // ===========================
              // GRID MENU UTAMA
              // ===========================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GridView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (menuItems[index]['title'] == "Motor") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransportasiPage()),
                          );
                        } else if (menuItems[index]['title'] == "Semua") {
                          // === ACTION BARU: TAMPILKAN BOTTOM SHEET ===
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true, // Untuk full screen
                            backgroundColor: Colors.transparent,
                            builder: (context) => AllMenuBottomSheet(),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFEDFBFB),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              menuItems[index]['image']!,
                              height: 40,
                              width: 40,
                              // Untuk item "Semua" kita pakai ikon yang lebih generik jika ikon bawaan tidak ada
                            ),
                            SizedBox(height: 6),
                            Text(
                              menuItems[index]['title']!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ===========================
              // TANTANGAN
              // ===========================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selesaikan tantanganmu sekarang",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              'assets/images/kado.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kamu mendapatkan\nDiscount Rp8.000 Jajan ...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Berakhir pada 31 Okt 2025",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Perkembangan Saya",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 26),

              // ===========================
              // PROMO (SCROLL HORIZONTAL)
              // ===========================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Jurus tagihan receh ala Irvan Toge",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Row(
                  children: [
                    promoSquare("assets/images/image1.png"),
                    promoSquare("assets/images/image2.png"),
                    promoSquare("assets/images/image3.png"),
                  ],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // =====================================================
      // CUSTOM NAVBAR
      // =====================================================
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navItem("assets/images/homeg.png", "Beranda", true),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => PembayaranPage()),
                );
              },
              child: navItem("assets/images/pembayaran.png", "Pembayaran", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AktivitasPage()),
                );
              },
              child: navItem("assets/images/aktivitas.png", "Aktivitas", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => KotakMasukPage()),
                );
              },
              child: navItem("assets/images/kotakmasuk.png", "Kotak Masuk", false),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // REUSABLE WIDGETS
  // =====================================================

  Widget navItem(String iconPath, String title, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          width: 26,
          height: 26,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isActive ? Color(0xFF01B051) : Colors.black87, // ← warna hijau
          ),
        ),
      ],
    );
  }

  Widget promoSquare(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// =====================================================
// WIDGET BARU UNTUK BOTTOM SHEET MENU LENGKAP (Telah Dimodifikasi)
// =====================================================
class AllMenuBottomSheet extends StatelessWidget {
  // Daftar menu lengkap tanpa label promo
  final List<Map<String, String>> fullMenuItems = [
    // Untukmu
    {"title": "Jastip", "image": "assets/images/jastip.png"},
    {"title": "Pinjaman", "image": "assets/images/pinjaman.png"},
    {"title": "Paket Diskon", "image": "assets/images/paketdiskon.png"},
    {"title": "Kesehatan", "image": "assets/images/kesehatan.png"},

    // Jasa Lainnya
    {"title": "Motor", "image": "assets/images/motor.png"},
    {"title": "Mobil", "image": "assets/images/mobil.png"},
    {"title": "Makanan", "image": "assets/images/makanan.png"},
    {"title": "Express", "image": "assets/images/express.png"},

    {"title": "Belanja", "image": "assets/images/belanja.png"},
    {"title": "Pulsa & Bills", "image": "assets/images/pulsa.png"},
    {"title": "Dine Out", "image": "assets/images/dine.png"},
    {"title": "Superbank", "image": "assets/images/superbank.png"},

    {"title": "Sewa", "image": "assets/images/sewa.png"},
    {"title": "Hadiah", "image": "assets/images/hadiah.png"},
    {"title": "Jadwalkan", "image": "assets/images/jadwalkan.png"},
    {"title": "Peta", "image": "assets/images/peta.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final menuUntukmu = fullMenuItems.sublist(0, 4);
    final menuJasaLainnya = fullMenuItems.sublist(4);

    return DraggableScrollableSheet(
      initialChildSize: 0.95, // Hampir full screen
      maxChildSize: 1.0,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          // Latar belakang bottom sheet tetap putih
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pegangan (Handle) untuk Bottom Sheet
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ),
                ),
                
                // HEADER (Telah dihapus: Tombol Close dan Search Bar)
                
                // ===========================
                // UNTUKMU SECTION
                // ===========================
                Padding(
                  // Mengatur padding atas agar tidak terlalu mepet setelah handle
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8), 
                  child: Text(
                    "Untukmu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildMenuGrid(context, menuUntukmu),

                // ===========================
                // JASA LAINNYA SECTION
                // ===========================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    "Jasa lainnya",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildMenuGrid(context, menuJasaLainnya),
                
                SizedBox(height: 50), // Ruang di bawah
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget untuk membangun Grid menu (Semua item menggunakan 0xFFEDFBFB)
  Widget _buildMenuGrid(BuildContext context, List<Map<String, String>> items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 1.0, 
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Color(0xFFEDFBFB), 
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ICON
                Image.asset(
                  item['image']!,
                  height: 38,
                  width: 38,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8),

                // TITLE
                Text(
                  item['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

