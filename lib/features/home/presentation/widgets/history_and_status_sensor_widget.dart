import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SensorStatusCard extends StatelessWidget {
  final double width;

  const SensorStatusCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    const aspectContent = 350 / 100;
    final hContent = width / aspectContent;

    return Container(
      width: width,
      height: hContent,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Sensor Status',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '7/10 Online',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
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
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataHistoryCard extends StatelessWidget {
  final double width;

  const DataHistoryCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final height = width * (220 / 350);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFC6CCFD),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Data History',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Daily Data',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 12),
              HistoryRow(
                date: 'Mon, 20 Jan',
                tmp: 'tmp : 25°c',
                hum: 'hum :87.4%',
                rh: 'rh :55.4%',
              ),
              SizedBox(height: 12),
              HistoryRow(
                date: 'Tue, 21 Jan',
                tmp: 'tmp : 25°c',
                hum: 'hum :87.4%',
                rh: 'rh :55.4%',
              ),
            ],
          ),
          Positioned(
            top: -8,
            right: -8,
            child: SizedBox(
              width: 36,
              height: 36,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SvgPicture.asset('assets/icons/arrowupright_icon.svg'),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              'Januari 2025',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryRow extends StatelessWidget {
  final String date, tmp, hum, rh;

  const HistoryRow({
    super.key,
    required this.date,
    required this.tmp,
    required this.hum,
    required this.rh,
  });

  @override
  Widget build(BuildContext context) {
    const dateStyle = TextStyle(
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w500,
    );
    const valStyle = TextStyle(
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w300,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(date, style: dateStyle),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(tmp, style: valStyle),
            const SizedBox(width: 12),
            Text(hum, style: valStyle),
            const SizedBox(width: 12),
            Text(rh, style: valStyle),
          ],
        ),
      ],
    );
  }
}
