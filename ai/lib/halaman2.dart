import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class Halaman2 extends StatelessWidget {
  const Halaman2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                // Logo Claude di atas
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(35, 35),
                      painter: AsteriskPainter(),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Claude',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 80),
                
                // Judul
                const Text(
                  'Lakukan pekerjaan\nterbaik Anda\ndengan Claude',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // Tombol Google Sign In
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(28),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPaint(
                              size: const Size(24, 24),
                              painter: GoogleLogoPainter(),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Lanjutkan dengan Google',
                              style: TextStyle(
                                color: Color(0xFF202124),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Divider ATAU
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey[700],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'ATAU',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30),
                
                // Input Email
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.grey[700]!,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Masukkan email Anda',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 50),
                
                // Terms and Privacy
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      height: 1.4,
                    ),
                    children: const [
                      TextSpan(text: 'Dengan melanjutkan, Anda menyetujui '),
                      TextSpan(
                        text: 'Syarat\nKonsumen',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: ' dan '),
                      TextSpan(
                        text: 'Kebijakan Penggunaan',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: '\nAnthropic, serta menyetujui ',
                      ),
                      TextSpan(
                        text: 'Kebijakan Privasi',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: '\nmereka.'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 80),
                
                // ANTHROPIC text at bottom
                Text(
                  'ANTHROPIC',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4,
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
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
    final rayWidth = 3.5;

    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * (math.pi / 180);
      
      final path = Path();
      path.moveTo(center.dx, center.dy);
      
      final endX = center.dx + rayLength * math.cos(angle);
      final endY = center.dy + rayLength * math.sin(angle);
      
      final perpAngle = angle + math.pi / 2;
      final halfWidth = rayWidth / 2;
      
      path.lineTo(
        center.dx + halfWidth * math.cos(perpAngle),
        center.dy + halfWidth * math.sin(perpAngle),
      );
      
      path.lineTo(endX, endY);
      
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

class GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = radius * 0.35;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Blue arc (top right to right)
    paint.color = const Color(0xFF4285F4);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -math.pi / 2,
      math.pi / 2,
      false,
      paint,
    );

    // Green arc (bottom right)
    paint.color = const Color(0xFF34A853);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      0,
      math.pi / 2,
      false,
      paint,
    );

    // Yellow arc (bottom left)
    paint.color = const Color(0xFFFBBC05);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      math.pi / 2,
      math.pi / 2,
      false,
      paint,
    );

    // Red arc (top left)
    paint.color = const Color(0xFFEA4335);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      math.pi,
      math.pi / 2.5,
      false,
      paint,
    );

    // Blue horizontal bar (right side)
    paint.color = const Color(0xFF4285F4);
    paint.strokeCap = StrokeCap.round;
    final barY = center.dy;
    final barStartX = center.dx;
    final barEndX = center.dx + radius * 0.7;
    
    canvas.drawLine(
      Offset(barStartX, barY),
      Offset(barEndX, barY),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}