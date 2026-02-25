import 'dart:math';
import 'package:flutter/material.dart';

class SmartScoreGauge extends StatelessWidget {
  const SmartScoreGauge({super.key, required this.score});

  final double score;

  @override
  Widget build(BuildContext context) {
    final percentage = score.clamp(0, 100) / 100;

    return SizedBox(
      width: 171,
      height: 183,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: CustomPaint(
              size: const Size(171, 95.5),
              painter: _GaugePainter(percentage: percentage),
            ),
          ),

          Positioned(
            top: 41,
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "86",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 44,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Transform.translate(
                          offset: const Offset(2, -14),
                          child: const Text(
                            "%",
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Smart Score",
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: 165,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Healthy Condition",
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF88E096),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.2),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({required this.percentage});

  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    const double trackWidth = 11;
    const double progressWidth = 11;
    const double auraMultiplier = 2.2;

    final backgroundRadius = radius - (trackWidth / 2);

    final backgroundRect = Rect.fromCircle(
      center: center,
      radius: backgroundRadius,
    );

    final backgroundPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF7AD3FF), Color(0x1AE6C9FF), Color(0x00FFFFFF)],
        stops: [0.0, 0.65, 1.0],
      ).createShader(backgroundRect)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, backgroundRadius, backgroundPaint);

    final auraPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x337AD3FF), Color(0x1AE6C9FF), Color(0x00FFFFFF)],
        stops: [0.0, 0.6, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackWidth * auraMultiplier
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, pi, pi, false, auraPaint);

    final trackPaint = Paint()
      ..color = const Color(0xFFE6C9FF).withOpacity(0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, pi, pi, false, trackPaint);

    final glowPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFF7AD3FF), Color(0xFFE6C9FF)],
      ).createShader(rect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressWidth * 1.4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, pi, pi * percentage, false, glowPaint);

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFF7AD3FF), Color(0xFFE6C9FF)],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, pi, pi * percentage, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
