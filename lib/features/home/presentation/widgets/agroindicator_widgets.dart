import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgroIndicatorSection extends StatelessWidget {
  const AgroIndicatorSection({
    super.key,
    this.title = "Agronomic Indicator",
    this.widthFactor = 0.9,
    this.onOpenDetail,
  });

  final String title;
  final double widthFactor;
  final VoidCallback? onOpenDetail;

  static const int currentPhaseIndex = 2;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * widthFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: 'Plus Jakarta Sans',
          ),
        ),
        const SizedBox(height: 12),

        _growthPhaseCard(w),
        const SizedBox(height: 12),

        _indicatorCard(w),
      ],
    );
  }

  Widget _growthPhaseCard(double width) {
    final phases = [
      'Early Vegetative',
      'Full Vegetative',
      'Early Reproductive',
      'Flowering',
      'Maturation',
      'Harvest',
    ];

    return Container(
      width: width,
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

          Positioned(
            top: -8,
            right: -8,
            child: GestureDetector(
              onTap: onOpenDetail,
              child: SizedBox(
                width: 36,
                height: 36,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SvgPicture.asset(
                    'assets/icons/arrowupright_icon.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorCard(double width) {
    return Container(
      width: width,
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
              _IndicatorTile(
                title: 'VDP',
                subtitle: 'Moderat',
                value: '1.7 kPa',
                color: Color(0xFFFFC038),
              ),
              _IndicatorTile(
                title: 'GDD',
                subtitle: 'ERep',
                value: '854°C',
                color: Color(0xFFC6CCFD),
              ),
              _IndicatorTile(
                title: 'WFPS',
                subtitle: 'Cukup',
                value: '54%',
                color: Color(0xFFEDC2CF),
              ),
              _IndicatorTile(
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

class _IndicatorTile extends StatelessWidget {
  const _IndicatorTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.color,
  });

  final String title;
  final String subtitle;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153,
      height: 81,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              fontFamily: 'Plus Jakarta Sans',
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Plus Jakarta Sans',
                  height: 1.83,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Plus Jakarta Sans',
                  height: 1.22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
