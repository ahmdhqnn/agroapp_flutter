import 'package:agroappflutter/features/home/presentation/widgets/history_and_status_sensor_widget.dart';
import 'package:flutter/material.dart';
import 'info_cards_widget.dart';

class Realtimeconditions extends StatelessWidget {
  const Realtimeconditions({
    super.key,
    this.title = "Realtime Conditions",
    this.widthFactor = 0.9,
    this.showExtraSection = true,
    this.showTitle = true,
  });

  final String title;
  final double widthFactor;
  final bool showExtraSection;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * widthFactor;

    return SizedBox(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle) ...[
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 1,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
          ],

          Row(
            children: const [
              Expanded(
                child: InfoCard(
                  iconAsset: 'assets/icons/soilph_icon.png',
                  title: 'Soil pH',
                  value: '6.0',
                  description: 'Normal 6.0 - 7.5',
                  gradientColors: [Color(0xFF34C6EB), Color(0xFF25A8D3)],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: InfoCard(
                  iconAsset: 'assets/icons/humidity_icon.png',
                  title: 'Humidity',
                  value: '35%',
                  description: 'Lembab 20% - 30%',
                  gradientColors: [Color(0xFFFA9C6D), Color(0xFFF77E4A)],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const LargeInfoCard(
            iconAsset: 'assets/icons/soiltemp_icon.png',
            title: 'Soil Temperature',
            value: '12°C',
            description: 'Terlalu dingin, dengan suhu normal 15°C - 30°C.',
            gradientColors: [Color(0xFFAADF7F), Color(0xFF7CCB5B)],
          ),

          if (showExtraSection) ...[
            const SizedBox(height: 12),
            SensorStatusCard(width: w),
            const SizedBox(height: 12),
            DataHistoryCard(width: w),
          ],
        ],
      ),
    );
  }
}
