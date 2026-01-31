import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendationCardSparkle extends StatelessWidget {
  final String text;
  final bool showArrow;

  const RecommendationCardSparkle({
    super.key,
    required this.text,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recomendation',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Plus Jakarta Sans',
                  height: 1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Plus Jakarta Sans',
                  height: 1.57,
                ),
              ),
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SvgPicture.asset(
                      'assets/icons/sparkle_icon.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          if (showArrow)
            Positioned(
              right: -8,
              top: -8,
              child: SvgPicture.asset(
                'assets/icons/arrowupright_icon.svg',
                width: 36,
                height: 36,
              ),
            ),
        ],
      ),
    );
  }
}
