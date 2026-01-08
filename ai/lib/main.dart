import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/* ===================== APP ROOT ===================== */

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? true;
    setState(() {});
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await prefs.setBool('isDarkMode', _isDarkMode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginPage(
        isDarkMode: _isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

/* ===================== LOGIN PAGE ===================== */

class LoginPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const LoginPage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(
            username: usernameController.text,
            password: passwordController.text,
            isDarkMode: widget.isDarkMode,
            onToggleTheme: widget.onToggleTheme,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            widget.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(60, 60),
              painter: AsteriskPainter(),
            ),
            const SizedBox(height: 12),
            const Text(
              'Claude',
              style: TextStyle(
                fontSize: 42,
                fontFamily: 'serif',
              ),
            ),
            const SizedBox(height: 32),

            /// Username
            SizedBox(
              width: 260,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// Password
            SizedBox(
              width: 260,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ===================== HOME PAGE ===================== */

class HomePage extends StatelessWidget {
  final String username;
  final String password;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    Key? key,
    required this.username,
    required this.password,
    required this.isDarkMode,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(60, 60),
              painter: AsteriskPainter(),
            ),
            const SizedBox(height: 12),
            const Text(
              'Claude',
              style: TextStyle(
                fontSize: 42,
                fontFamily: 'serif',
              ),
            ),
            const SizedBox(height: 32),
            Text('username : $username'),
            const SizedBox(height: 8),
            Text('password : $password'),
          ],
        ),
      ),
    );
  }
}

/* ===================== ASTERISK ===================== */

class AsteriskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCC6B4A)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final rayLength = size.width / 2;

    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * (math.pi / 180);
      final path = Path()..moveTo(center.dx, center.dy);

      final endX = center.dx + rayLength * math.cos(angle);
      final endY = center.dy + rayLength * math.sin(angle);
      final perpAngle = angle + math.pi / 2;

      path
        ..lineTo(
          center.dx + 2 * math.cos(perpAngle),
          center.dy + 2 * math.sin(perpAngle),
        )
        ..lineTo(endX, endY)
        ..lineTo(
          center.dx - 2 * math.cos(perpAngle),
          center.dy - 2 * math.sin(perpAngle),
        )
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
