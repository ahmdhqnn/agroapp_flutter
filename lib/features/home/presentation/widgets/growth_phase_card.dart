import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GrowthPhaseCard extends StatelessWidget {
  const GrowthPhaseCard({super.key, this.showArrow = true, this.onOpenDetail});

  final bool showArrow;
  final VoidCallback? onOpenDetail;

  static const int currentPhaseIndex = 2;

  @override
  Widget build(BuildContext context) {
    final phases = [
      'Early Vegetative',
      'Full Vegetative',
      'Early Reproductive',
      'Flowering',
      'Maturation',
      'Harvest',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
                'Growth phase',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Plus Jakarta Sans',
                ),
              ),
              const SizedBox(height: 16),

              Column(
                children: List.generate(phases.length, (i) {
                  final isPassed = i <= currentPhaseIndex;
                  final isLast = i == phases.length - 1;

                  return SizedBox(
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 16,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: isPassed
                                      ? const Color(0xFF00A924)
                                      : const Color(0xFFE0E0E0),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              if (!isLast)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    margin: const EdgeInsets.only(top: 4),
                                    color: i < currentPhaseIndex
                                        ? const Color(0xFF00A924)
                                        : const Color(0xFFE0E0E0),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                phases[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: isPassed
                                      ? FontWeight.w500
                                      : FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: isPassed
                                      ? const Color(0xFF00A924)
                                      : const Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),

          // OPTIONAL ARROW (HOME ONLY)
          if (showArrow)
            Positioned(
              right: -8,
              top: -8,
              child: GestureDetector(
                onTap: onOpenDetail,
                child: SvgPicture.asset(
                  'assets/icons/arrowupright_icon.svg',
                  width: 36,
                  height: 36,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
