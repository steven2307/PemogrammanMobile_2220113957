import 'package:flutter/material.dart';
import 'pembayaran.dart';
import 'beranda.dart';
import 'aktivitas.dart';
import 'kotakmasuk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kotak Masuk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const KotakMasukPage2(),
    );
  }
}

class KotakMasukPage2 extends StatefulWidget {
  const KotakMasukPage2({super.key});

  @override
  State<KotakMasukPage2> createState() => _KotakMasukPage();
}

class _KotakMasukPage extends State<KotakMasukPage2> {
  bool isChatSelected = false;

  static const Color gojekDarkGreen = Color(0xFF006C4F);
  static const Color inactiveColor = Color(0xFFE9F4F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Kotak Masuk",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Image.asset(
              "assets/images/bin.png",
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Column(
        children: [
          const SizedBox(height: 10),

          // TAB CHAT / NOTIF
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                /// CHAT → pindah ke kotakmasuk.dart
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => KotakMasukPage()),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: inactiveColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Chat',
                          style: TextStyle(
                            color: gojekDarkGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// NOTIFIKASI (aktif)
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: gojekDarkGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Notifikasi',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // NOTIFIKASI LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                notifItem(
                  iconPath: 'assets/images/sym1.png',
                  title: "Ayam Goreng Bu Tumbar yuk!",
                  desc: "Diskon s.d. 55%, jadi cuma Rp25rb-an!",
                  time: "Sel",
                ),
                notifItem(
                  iconPath: 'assets/images/sym1.png',
                  title: "William Wongso Picks ✨",
                  desc: "Koleksi rasa terbaik pilihan sang legenda!",
                  time: "Sel",
                ),

                /// PROMO ITEM SYM3 (GAMBAR BESAR)
                notifPromoItem(
                  iconPath: 'assets/images/sym2.png',
                  title: "Harga spesial buat kamu",
                  desc: "",
                  promoImage: "assets/images/sym3.png",
                ),

                notifItem(
                  iconPath: 'assets/images/sym1.png',
                  title: "Diskon s.d. 52% tiap hari 😱",
                  desc: "Banyak resto pilihannya!",
                  time: "Sel",
                ),
                notifItem(
                  iconPath: 'assets/images/sym1.png',
                  title: "Tomoro Coffee diskon 30% + 40%",
                  desc: "Ada diskon khusus buat kamu!",
                  time: "Sel",
                ),
                notifItem(
                  iconPath: 'assets/images/sym1.png',
                  title: "Waktunya self-reward! 🎁",
                  desc: "Cafe Break seru, diskon menanti!",
                  time: "Sen",
                ),
                notifItem(
                  iconPath: 'assets/images/sym1.png',
                  title: "Beard Papa's diskon s.d. Rp45rb!",
                  desc: "Ada diskon khusus buat kamu!",
                  time: "Sen",
                ),
              ],
            ),
          ),
        ],
      ),

      // ========== BOTTOM NAV ==========
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
              child: navItem("assets/images/home.png", "Beranda", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => PembayaranPage()),
                );
              },
              child:
                  navItem("assets/images/pembayaran.png", "Pembayaran", false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AktivitasPage()),
                );
              },
              child:
                  navItem("assets/images/aktivitas.png", "Aktivitas", false),
            ),
            navItem("assets/images/kotakmasukg.png", "Kotak Masuk", true),
          ],
        ),
      ),
    );
  }

  // ================== NOTIF ITEM (SYM1 & SYM2) ==================
  Widget notifItem({
    required String iconPath,
    required String title,
    required String desc,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON TANPA BORDER — dibesarkan
          Image.asset(
            iconPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 12),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          /// TIME + RED DOT
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 4),
              const Icon(Icons.circle, color: Colors.red, size: 10),
            ],
          ),
        ],
      ),
    );
  }

  // ================= PROMO ITEM SYM3 (GAMBAR BESAR) ==================
  Widget notifPromoItem({
    required String iconPath,
    required String title,
    required String desc,
    required String promoImage,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // ← KUNCI AGAR TENGAH
        children: [
          
          /// ICON KIRI
          Image.asset(
            iconPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 12),

          /// TEXT KIRI (TETAP DI KIRI)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,   // ← sejajarkan vertically
              crossAxisAlignment: CrossAxisAlignment.start,  // ← text tetap kiri
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (desc.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(width: 8),

          /// GAMBAR PROMO SAMPING KANAN (136×68)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              promoImage,
              width: 136,
              height: 68,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }


  // ================= BOTTOM NAV ITEM ==================
  Widget navItem(String iconPath, String title, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          width: 26,
          height: 26,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isActive ? Color(0xFF01B051) : Colors.black87,
          ),
        ),
      ],
    );
  }
}
