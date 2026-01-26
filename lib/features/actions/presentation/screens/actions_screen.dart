import 'package:flutter/material.dart';
import 'package:agroappflutter/features/home/presentation/widgets/plan_top_bar.dart';
import 'package:agroappflutter/features/home/presentation/widgets/plan_section_card.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  static const bg = Color(0xFFF5F5F5);
  static const widthFactor = 0.92;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth * widthFactor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.center,
                child: PlanTopBar(width: contentWidth),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: PlanSectionCard.today(width: contentWidth),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.center,
                child: PlanSectionCard.progress(width: contentWidth),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.center,
                child: PlanSectionCard.completed(width: contentWidth),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
