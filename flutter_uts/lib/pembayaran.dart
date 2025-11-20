import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ovo.dart';
import 'beranda.dart';
import 'kotakmasuk.dart';
import 'aktivitas.dart';

void main() {
  runApp(const PembayaranApp());
}

const Color headerColor = Color(0xFFF5F6FB);
const Color bodyColor = Color.fromARGB(255, 255, 255, 255);

class PembayaranApp extends StatelessWidget {
  const PembayaranApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pembayaran',
      theme: ThemeData(
        scaffoldBackgroundColor: bodyColor,
        primaryColor: const Color(0xFF00A94F),
      ),
      home: const PembayaranPage(),
    );
  }
}

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =============================================
              // HEADER
              // =============================================
              // =============================================
// HEADER
// =============================================
Container(
  width: double.infinity,
  height: 250,
  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
  decoration: const BoxDecoration(color: headerColor),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      // Teks Header
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembayaran',
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Pembayaran harian fleksibel\ndan mudah',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: const Icon(Icons.settings_outlined, color: Colors.black54),
          ),
        ],
      ),

      // Gambar Dekor di kanan atas
      Positioned(
        right: -30,
        top: -20,
        child: Image.asset(
          'assets/images/pbg.png',
          width: 260,
          height: 240,
          fit: BoxFit.cover,
        ),
      ),
    ],
  ),
),


              // =============================================
              // HORIZONTAL SCROLLING PAYMENT CARD
              // =============================================
              Transform.translate(
  offset: const Offset(0, -40), // geser ke atas 40 px
  child: SizedBox(
    height: 240,
    child: ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        PaymentCard(
          titleTop: 'Aktifkan',
          titleMain: 'OVO',
          badgeText: 'Baru',
          badgeColor: const Color(0xFFF85338),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ActivateOvoPage()),
            );
          },
        ),
        const SizedBox(width: 12),
        const PaymentCard(
          titleTop: 'Aktifkan',
          titleMain: 'Superbank',
          badgeText: 'Bunga 5% p.a.',
          badgeColor: Color(0xFF00AF4C),
        ),
        const SizedBox(width: 12),
        const PaymentCard(
          titleTop: 'Aktifkan',
          titleMain: 'OVO\nPayLater',
          badgeText: 'Baru',
          badgeColor: Color(0xFFF85338),
        ),
      ],
    ),

  ),
),

              const SizedBox(height: 10),

              // =============================================
              // GREEN BUTTONS
              // =============================================
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _greenButton(
                      imagePath: 'assets/images/kartu.png',
                      titleMain: "Tambahkan Kartu",
                      titleSub: "Pembayaran nontunai dengan kar...",
                      backgroundColor: const Color(0xFF00B14F),
                      textColor: Colors.white,
                      subTextColor: Colors.white70,
                    ),
                    _greenButton(
                      imagePath: 'assets/images/topup.png',
                      titleMain: "Top up GrabPay balance",
                      titleSub: "Gunakan saldo untuk pembayaran...",
                      backgroundColor: const Color(0xFF00B14F),
                      textColor: Colors.white,
                      subTextColor: Colors.white70,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // =============================================
              // WHITE BUTTONS
              // =============================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _whiteButton(
                      imagePath: "assets/images/topupw.png",
                      text: "Isi Ulang",
                      textColor: Colors.black,
                      imageSize: 26,
                    ),
                    const SizedBox(width: 12),
                    _whiteButton(
                      imagePath: "assets/images/scannerw.png",
                      text: "Scan untuk Bayar",
                      textColor: Colors.black,
                      imageSize: 26,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Layanan keuangan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

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

            
            navItem("assets/images/pembayarang.png", "Pembayaran", true),

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

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => KotakMasukPage()),
                );
              },
              child: navItem(
                  "assets/images/kotakmasuk.png", "kotak Masuk", false),
            ),
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

  Widget _whiteButton({
    required String imagePath,
    required String text,
    required Color textColor,
    required double imageSize,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: imageSize, height: imageSize),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 15, color: textColor)),
        ],
      ),
    );
  }

  Widget _greenButton({
    required String imagePath,
    required String titleMain,
    required String titleSub,
    required Color backgroundColor,
    required Color textColor,
    required Color subTextColor,
  }) {
    return Container(
      width: 290,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 36, height: 36, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleMain, style: TextStyle(color: textColor, fontSize: 16)),
              Text(titleSub, style: TextStyle(color: subTextColor, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String titleTop;
  final String titleMain;
  final String badgeText;
  final Color badgeColor;
  final VoidCallback? onTap; 

  const PaymentCard({
    Key? key,
    required this.titleTop,
    required this.titleMain,
    required this.badgeText,
    required this.badgeColor,
    this.onTap, // <-- Tambahkan
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleTop, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 6),
              Text(titleMain, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFEDF8FA),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onTap, // <-- Ganti onPressed jadi onTap
                icon: const Icon(Icons.add, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
