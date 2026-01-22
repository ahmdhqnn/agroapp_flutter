import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class SensorHistoryCard extends StatefulWidget {
  const SensorHistoryCard({super.key});

  @override
  State<SensorHistoryCard> createState() => _SensorHistoryCardState();
}

class _SensorHistoryCardState extends State<SensorHistoryCard> {
  /// MONTH STATE
  DateTime currentMonth = DateTime(2025, 9);

  /// DUMMY DATA PER BULAN (nanti ganti API)
  final Map<String, List<double>> monthlyData = {
    '2025-09': [22, 21, 19, 10, 18, 19, 21, 22, 20, 20],
    '2025-08': [24, 23, 22, 21, 22, 23, 24, 25, 24, 23],
    '2025-07': [26, 25, 24, 24, 23, 22, 23, 24, 25, 26],
  };

  void _nextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  void _prevMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  String get _monthKey =>
      '${currentMonth.year}-${currentMonth.month.toString().padLeft(2, '0')}';

  String get _monthLabel {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[currentMonth.month - 1]} ${currentMonth.year}';
  }

  @override
  Widget build(BuildContext context) {
    final data = monthlyData[_monthKey] ?? [];

    return Column(
      children: [
        /// MONTH SELECTOR (100% FIGMA)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// MONTH CHIP
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar_icon.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _monthLabel,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 2.2,
                    ),
                  ),
                ],
              ),
            ),

            /// ARROWS
            Row(
              children: [
                _ArrowButton(
                  icon: 'assets/icons/arrowleft_icon.svg',
                  onTap: _prevMonth,
                ),
                const SizedBox(width: 5),
                _ArrowButton(
                  icon: 'assets/icons/arrowright_icon.svg',
                  onTap: _nextMonth,
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// MAIN CARD
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Text(
                  'Data Sensor History',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Plus Jakarta Sans',
                    height: 1,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Daily data is grouped by month',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Plus Jakarta Sans',
                    height: 1.83,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// CHART
              SizedBox(
                height: 200,
                width: double.infinity,
                child: CustomPaint(painter: _ChartPainter(data)),
              ),

              const SizedBox(height: 12),

              /// SUMMARY
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _SummaryItem(title: 'Mean Tmp', value: '24°c'),
                    _SummaryItem(title: 'Mean HUM', value: '78.2%'),
                    _SummaryItem(title: 'Mean RH', value: '54.4%'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// ARROW BUTTON
class _ArrowButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

/// SUMMARY ITEM
class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            fontFamily: 'Plus Jakarta Sans',
            height: 1,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: 'Plus Jakarta Sans',
            height: 1.83,
          ),
        ),
      ],
    );
  }
}

/// CHART PAINTER (DATA BERUBAH PER BULAN)
class _ChartPainter extends CustomPainter {
  final List<double> data;

  _ChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final maxVal = data.reduce(max);
    final minVal = data.reduce(min);

    final paintLine = Paint()
      ..color = const Color(0xFF1EC6F3)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final paintFill = Paint()
      ..color = const Color(0xFF1EC6F3).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final path = Path();
    final fillPath = Path();

    for (int i = 0; i < data.length; i++) {
      final x = size.width * (i / (data.length - 1));
      final y =
          size.height - ((data[i] - minVal) / (maxVal - minVal)) * size.height;

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    fillPath
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(fillPath, paintFill);
    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
