import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back to First Screen',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}