import 'package:agroappflutter/features/home/presentation/widgets/realtimeconditions_widget.dart';
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
  static const bg = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderWidget(),
              SizedBox(height: 8),

              CategorySliderWidget(),
              SizedBox(height: 16),

              _Centered(child: WeatherCardWidget()),
              SizedBox(height: 20),

              _Centered(child: SmartScoreSection(widthFactor: 0.92)),
              SizedBox(height: 20),

              _Centered(child: Realtimeconditions(widthFactor: 0.92)),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Centered extends StatelessWidget {
  final Widget child;
  const _Centered({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: child,
    );
  }
}
