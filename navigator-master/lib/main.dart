import 'package:flutter/material.dart';
import 'screen/first_screen.dart';
//import 'screen/first_screen_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: FirstScreenData(),
      home: FirstScreen(),
    );
  }
}
