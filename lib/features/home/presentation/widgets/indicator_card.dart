import 'package:flutter/material.dart';
import 'indicator_tile.dart';

class IndicatorOnlyCard extends StatelessWidget {
  const IndicatorOnlyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Indicator',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              fontFamily: 'Plus Jakarta Sans',
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'With GDD Calibration',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
          const SizedBox(height: 12),

          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 153 / 81,
            ),
            children: const [
              IndicatorTile(
                title: 'VDP',
                subtitle: 'Moderat',
                value: '1.7 kPa',
                color: Color(0xFFFFC038),
              ),
              IndicatorTile(
                title: 'GDD',
                subtitle: 'ERep',
                value: '854°C',
                color: Color(0xFFC6CCFD),
              ),
              IndicatorTile(
                title: 'WFPS',
                subtitle: 'Cukup',
                value: '54%',
                color: Color(0xFFEDC2CF),
              ),
              IndicatorTile(
                title: 'ETc',
                subtitle: '10%',
                value: '6.2 mm',
                color: Color(0xFFF0C9FF),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
