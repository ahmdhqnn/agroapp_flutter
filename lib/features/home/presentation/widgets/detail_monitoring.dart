import 'package:flutter/material.dart';

class DetailMonitoring extends StatelessWidget {
  const DetailMonitoring({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: const [
          MonitoringCard(
            iconPath: 'assets/icons/nitrogen_icon.png',
            value: '120',
            unit: 'ppm',
            label: 'Nitrogen',
            status: 'Cukup',
          ),
          MonitoringCard(
            iconPath: 'assets/icons/potassium_icon.png',
            value: '180',
            unit: 'ppm',
            label: 'Kalium',
            status: 'Optimal',
          ),
          MonitoringCard(
            iconPath: 'assets/icons/fosfor_detail_icon.png',
            value: '45',
            unit: 'ppm',
            label: 'Fosfor',
            status: 'Kurang',
          ),
          MonitoringCard(
            iconPath: 'assets/icons/temp_detail_icon.png',
            value: '28',
            unit: '°C',
            label: 'Suhu udara',
            status: 'Cukup',
          ),
          MonitoringCard(
            iconPath: 'assets/icons/humidity_detail_icon.png',
            value: '78',
            unit: '%',
            label: 'Kel. Udara',
            status: 'Cukup',
          ),
          MonitoringCard(
            iconPath: 'assets/icons/sun_detail_icon.png',
            value: '8500',
            unit: 'lux',
            label: 'Matahari',
            status: 'Cukup',
          ),
        ],
      ),
    );
  }
}

class MonitoringCard extends StatelessWidget {
  final String iconPath;
  final String value;
  final String unit;
  final String label;
  final String status;

  const MonitoringCard({
    super.key,
    required this.iconPath,
    required this.value,
    required this.unit,
    required this.label,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 201,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
          ),

          Positioned.fill(
            bottom: 34,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Image.asset(iconPath, fit: BoxFit.contain),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    unit,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 34,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5CC941), Color(0xFF3BAC1E)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
