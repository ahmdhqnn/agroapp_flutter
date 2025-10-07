import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5);
    const text = Color(0xFF111111);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Agro Monitoring',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: text,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to AgriApp 🌾',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: text,
          ),
        ),
      ),
    );
  }
}
