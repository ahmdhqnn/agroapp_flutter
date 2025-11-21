import 'package:flutter/material.dart';

class Realtimeconditions extends StatelessWidget {
  const Realtimeconditions({
    super.key,
    this.title = "Realtime Conditions",
    this.widthFactor = 0.9,
  });

  final String title;
  final double widthFactor;

  Widget _buildInfoCard(
    BuildContext context, {
    required String iconAsset,
    required String title,
    required String value,
    required String description,
    required List<Color> gradientColors,
  }) {
    const double cardHeight = 160;
    const double iconBgSize = 40;

    return Container(
      height: cardHeight,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: iconBgSize,
                height: iconBgSize,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(iconAsset),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLargeInfoCard(
    BuildContext context, {
    required String iconAsset,
    required String title,
    required String value,
    required String description,
    required List<Color> gradientColors,
  }) {
    const double cardHeight = 150;
    const double iconBgSize = 40;

    return Container(
      height: cardHeight,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: iconBgSize,
                height: iconBgSize,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(iconAsset),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSensorStatusCard(BuildContext context, double w) {
    const aspectContent = 350 / 100;
    final hContent = w / aspectContent;
    final radiusContent = BorderRadius.circular(18);

    return Container(
      width: w,
      height: hContent,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radiusContent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sensor Status',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w300,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '7/10 Online',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w300,
                    height: 1.83,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                'Last update 14 Jul 2023 | 14:05:09',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * widthFactor;

    return SizedBox(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Row(
            children: [
              Expanded(
                child: _buildInfoCard(
                  context,
                  iconAsset: 'assets/icons/soilph_icon.png',
                  title: 'Soil pH',
                  value: '6.0',
                  description: 'Normal 6.0 - 7.5',
                  gradientColors: [
                    const Color(0xFF34C6EB),
                    const Color(0xFF25A8D3),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoCard(
                  context,
                  iconAsset: 'assets/icons/humidity_icon.png',
                  title: 'Humidity',
                  value: '35%',
                  description: 'Lembab 20% - 30%',
                  gradientColors: [
                    const Color(0xFFFA9C6D),
                    const Color(0xFFF77E4A),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildLargeInfoCard(
            context,
            iconAsset: 'assets/icons/soiltemp_icon.png',
            title: 'Soil Temperature',
            value: '12°C',
            description: 'Terlalu dingin, dengan suhu normal 15°C - 30°C.',
            gradientColors: [const Color(0xFFAADF7F), const Color(0xFF7CCB5B)],
          ),
          const SizedBox(height: 12),
          _buildSensorStatusCard(context, w),
        ],
      ),
    );
  }
}
