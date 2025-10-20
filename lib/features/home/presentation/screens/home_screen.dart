import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';
import '../widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5);
    const text = Color(0xFF111111);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          elevation: 0,
          scrolledUnderElevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Column(
              children: [
                HeaderWidget(),
                CategorySliderWidget(),
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(
            'ALL Content', // Placeholder, update as needed
            style: const TextStyle(color: text),
          ),
        ),
      ),
    );
  }
}