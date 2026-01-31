import 'package:agroappflutter/features/home/presentation/widgets/realtimeconditions_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/smartscore_widget.dart';
import '../widgets/weathercard_widget.dart';
import '../widgets/plancard_widget.dart';
import '../widgets/landconditions_widget.dart';
import '../widgets/agroindicator_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            SizedBox(height: 12),

            _Centered(child: PlanCardWidget(widthFactor: 0.92)),
            SizedBox(height: 20),

            _Centered(child: Realtimeconditions(widthFactor: 0.92)),
            SizedBox(height: 24),

            _Centered(child: LandConditions(widthFactor: 0.92)),
            SizedBox(height: 24),

            _Centered(child: AgroIndicatorSection(widthFactor: 0.92)),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _Centered extends StatelessWidget {
  final Widget child;
  const _Centered({required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: child);
  }
}
