import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'halaman2.dart'; // Import file halaman2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Claude',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const ClaudeSplashScreen(),
    );
  }
}

class ClaudeSplashScreen extends StatelessWidget {
  const ClaudeSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set status bar to transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: GestureDetector(
        onTap: () {
          // Navigasi ke halaman2
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Halaman2()),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Claude Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Asterisk Icon
                        CustomPaint(
                          size: const Size(50, 50),
                          painter: AsteriskPainter(),
                        ),
                        const SizedBox(width: 12),
                        // Claude Text
                        const Text(
                          'Claude',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 52,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1,
                            fontFamily: 'serif',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Bottom text
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Text(
                'BY ANTHROPIC',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AsteriskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCC6B4A)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final rayLength = size.width / 2;
    final rayWidth = 4.0;

    // Draw 8 rays in asterisk pattern
    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * (3.14159 / 180);
      
      final path = Path();
      
      // Start from center
      path.moveTo(center.dx, center.dy);
      
      // Calculate ray endpoint
      final endX = center.dx + rayLength * math.cos(angle);
      final endY = center.dy + rayLength * math.sin(angle);
      
      // Create tapered ray shape
      final perpAngle = angle + 1.5708;
      final halfWidth = rayWidth / 2;
      
      // Left side of ray
      path.lineTo(
        center.dx + halfWidth * math.cos(perpAngle),
        center.dy + halfWidth * math.sin(perpAngle),
      );
      
      // Tip of ray
      path.lineTo(endX, endY);
      
      // Right side of ray
      path.lineTo(
        center.dx - halfWidth * math.cos(perpAngle),
        center.dy - halfWidth * math.sin(perpAngle),
      );
      
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
