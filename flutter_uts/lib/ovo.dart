import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ActivateOvoPage(),
    );
  }
}

class ActivateOvoPage extends StatelessWidget {
  const ActivateOvoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ===========================
              // CLOSE BUTTON (IKUT SCROLL)
              // ===========================
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 4),

              // ===========================
              //      KARTU OVO ATAS
              // ===========================
              Container(
                width: double.infinity,
                height: 216,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/ovo_card.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFB5EEE8),
                      blurRadius: 12,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Aktifkan OVO - Praktis Tanpa Tunai!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Dengan OVO, kamu bisa menikmati pembayaran tanpa tunai dan perjalanan nggak pakai ribet!",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Saldo kamu sebelumnya (dalam Grab) bisa dipakai nanti setelah kamu mengaktifkan OVO.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 12),

              Text.rich(
                TextSpan(
                  text: 'Dengan mengaktifkan OVO, kamu menyetujui ',
                  style: const TextStyle(fontSize: 15),
                  children: [
                    TextSpan(
                      text: 'Syarat dan Ketentuan',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(text: ' kami.'),
                  ],
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "AKTIFKAN SEKARANG",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
