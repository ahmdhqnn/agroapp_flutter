import 'package:flutter/material.dart';

class SmartScoreSection extends StatelessWidget {
  const SmartScoreSection({
    super.key,
    this.title = "Today’s Plants",
    this.widthFactor = 0.9,
    this.child,
  });

  final String title;
  final double widthFactor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * widthFactor;
    const aspectScore = 349 / 244;
    final hScore = w / aspectScore;
    const aspectContent = 350 / 100;
    final hContent = w / aspectContent;
    final radiusScore = BorderRadius.circular(20);
    final radiusContent = BorderRadius.circular(18);

    return Column(
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
        Container(
          width: w,
          height: hScore,
          decoration: BoxDecoration(
            borderRadius: radiusScore,
            gradient: const LinearGradient(
              begin: Alignment(0.50, -0.00),
              end: Alignment(0.50, 1.00),
              colors: [Color(0xFFE1F3E2), Color(0xFFFDDEC5)],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: w,
          height: hContent,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radiusContent,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plant’s Overview',
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
                      'Early reproductive',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w300,
                        height: 1.83,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                Positioned(
                  right: w * 0.03,
                  bottom: hContent * 0.03,
                  child: Text(
                    '60 HST',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
