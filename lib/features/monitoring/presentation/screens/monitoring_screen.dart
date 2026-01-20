import 'package:flutter/material.dart';
import 'package:agroappflutter/features/home/presentation/widgets/detail_monitoring.dart';
import 'package:agroappflutter/features/home/presentation/widgets/monitoring_top_bar.dart';
import 'package:agroappflutter/features/home/presentation/widgets/realtimeconditions_widget.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              const Align(
                alignment: Alignment.center,
                child: MonitoringTopBar(),
              ),

              const SizedBox(height: 40),

              Align(
                alignment: Alignment.center,
                child: Realtimeconditions(
                  widthFactor: widthFactor,
                  showExtraSection: false,
                  showTitle: false,
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: const Text(
                    'Detail',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: const DetailMonitoring(),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
