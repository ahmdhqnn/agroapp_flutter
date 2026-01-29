import 'package:flutter/material.dart';

class GDDComparisonCard extends StatelessWidget {
  const GDDComparisonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'GDD Comparison',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              fontFamily: 'Plus Jakarta Sans',
              height: 1,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Standar 900 → 1300\nKalibrasi 880 → 1280',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              fontFamily: 'Plus Jakarta Sans',
              height: 1.57,
            ),
          ),
        ],
      ),
    );
  }
}
