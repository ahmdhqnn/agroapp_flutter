import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/smartscore_widget.dart';
import '../widgets/weathercard_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          elevation: 0,
          scrolledUnderElevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: HeaderWidget(),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            const CategorySliderWidget(),
            const SizedBox(height: 16.0),
            const WeatherCardWidget(),
            const SizedBox(height: 16.0),
            const SmartScoreSection()
          ],
        ),
      ),
    );
  }
}