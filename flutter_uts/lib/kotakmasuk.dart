import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pembayaran.dart';
import 'beranda.dart';
import 'aktivitas.dart';
import 'kotakmasuk2.dart';

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

        /// 🔥 Terapkan Font Poppins ke seluruh aplikasi
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      home: const KotakMasukPage(),
    );
  }
}

class KotakMasukPage extends StatefulWidget {
  const KotakMasukPage({super.key});

  @override
  State<KotakMasukPage> createState() => _KotakMasukPageState();
}

class _KotakMasukPageState extends State<KotakMasukPage> {
  @override
  Widget build(BuildContext context) {
    const Color gojekGreen = Color(0xFF00AA5B);
    const Color gojekDarkGreen = Color(0xFF006C4F);
    const Color inactiveColor = Color(0xFFE9F4F0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0, // ← buat title menempel ke kiri, lalu atur padding sendiri
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Kotak Masuk',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 8),

          /// TAB (Chat & Notifikasi)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                /// CHAT (aktif)
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: gojekDarkGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// NOTIFIKASI → pindah ke KotakMasuk2
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => KotakMasukPage2()),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: inactiveColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Notifikasi',
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
              ],
            ),
          ),

          const SizedBox(height: 30),

          /// GAMBAR CHAT SUPPORT
          Center(
            child: Image.asset(
              'assets/images/chat_support.png',
              width: 200,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 30),

          /// TEKS UTAMA
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Temukan chat kamu dengan staf\nlayanan pelanggan kami di sini!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// TEKS SUPPORT (Pusat Bantuan)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                      text:
                          'Kamu juga bisa mendapatkan bantuan\ndari mereka melalui '),
                  TextSpan(
                    text: 'Pusat Bantuan',
                    style: TextStyle(
                      color: gojekGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: ' kami.'),
                ],
              ),
            ),
          ),
        ],
      ),

      /// BOTTOM NAVIGATION
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
              child:
                  navItem("assets/images/home.png", "Beranda", false),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => PembayaranPage()),
                );
              },
              child: navItem(
                  "assets/images/pembayaran.png", "Pembayaran", false),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AktivitasPage()),
                );
              },
              child: navItem(
                  "assets/images/aktivitas.png", "Aktivitas", false),
            ),

            navItem("assets/images/kotakmasukg.png", "Kotak Masuk", true),
          ],
        ),
      ),
    );
  }

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
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isActive ? const Color(0xFF01B051) : Colors.black87,
          ),
        ),
      ],
    );
  }
}
