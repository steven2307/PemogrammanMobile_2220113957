import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Menyembunyikan status bar agar fullscreen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const GrabLoginApp());
}

class GrabLoginApp extends StatelessWidget {
  const GrabLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GrabLoginPage(),
    );
  }
}

class GrabLoginPage extends StatelessWidget {
  const GrabLoginPage({super.key});

  static const Color grabGreen = Color(0xFF00B45E);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const horizontalPadding = 28.0;
    final buttonWidth = width - horizontalPadding * 2;

    return Scaffold(
      backgroundColor: grabGreen,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Grab (gambar)
              SizedBox(
                height: 120,
                child: Image.asset(
                  'assets/image/grab.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 12),

              // Teks dua baris
              const Text(
                'Satu aplikasi untuk semua kebutuhan\nharianmu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 48),

              // Tombol Facebook (gambar di kiri)
              _socialButtonFromAsset(
                width: buttonWidth,
                assetPath: 'assets/image/facebook.png',
                text: 'Lanjutkan dengan Facebook',
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Tombol Google (gambar di kiri)
              _socialButtonFromAsset(
                width: buttonWidth,
                assetPath: 'assets/image/google.png',
                text: 'Lanjutkan dengan Google',
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                onTap: () {},
              ),
              const SizedBox(height: 24),

              // Divider “atau”
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.white70, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'atau',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white70, thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),

              // Tombol Nomor Ponsel
              _socialButtonFromAsset(
                width: buttonWidth,
                assetPath: null,
                iconData: Icons.phone,
                text: 'Lanjutkan dengan Nomor Ponsel',
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper tombol sosial (gambar di kiri, teks di tengah)
  Widget _socialButtonFromAsset({
    required double width,
    String? assetPath,
    IconData? iconData,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    const double height = 56;
    const double radius = 40;

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Gambar/logo di kiri
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: SizedBox(
                    height: 28,
                    width: 28,
                    child: assetPath != null
                        ? Image.asset(assetPath, fit: BoxFit.contain)
                        : Icon(iconData, color: Colors.black87, size: 24),
                  ),
                ),
              ),
              // Teks di tengah
              Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
