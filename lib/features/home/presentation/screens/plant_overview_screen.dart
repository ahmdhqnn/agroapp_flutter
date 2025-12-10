import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlantsOverviewScreen extends StatelessWidget {
  const PlantsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5);
    const widthFactor = 0.92;

    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth * widthFactor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _TopIconButton(
                        assetPath: 'assets/icons/back_icon.svg',
                        onTap: () => Navigator.of(context).maybePop(),
                      ),
                      _TopIconButton(
                        assetPath: 'assets/icons/more_icon.svg',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: const Text(
                    'Plants Overview',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: Center(
                    child: Image.asset(
                      'assets/images/earlyreproductive.png',
                      width: 248,
                      height: 372,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Plant’s Detail",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w300,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Plant’s",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  width: 32,
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Agronomic Summary",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const _DetailRow(
                          label: "Types of Plants",
                          value: "Unknow",
                        ),
                        const SizedBox(height: 4),
                        const _DetailRow(
                          label: "Planting Date",
                          value: "12 Jan 2025",
                        ),
                        const SizedBox(height: 4),
                        const _DetailRow(label: "HST", value: "35 Day"),
                        const SizedBox(height: 4),
                        const _DetailRow(
                          label: "Growth Phase",
                          value: "Early reproductive",
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: _AIInsightCard(
                    cautionText:
                        'Soil temperature is above normal limits, check land conditions.',
                    growthPhaseText:
                        'The plant is in the vegetative phase with an estimated duration of the phase of 14-20 days.',
                    landConditionsText:
                        'Low soil moisture, needs watering in the next 2 hours.',
                    estimateText:
                        'Estimated harvest time is approximately 65 days away.',
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: RecommendationCard(
                    text:
                        'Beri pupuk P & K, kurangi N berlebihan.\nAir dijaga macak-macak (2–3 cm).\nCek hama & penyakit blas.\nBersihkan gulma.',
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback? onTap;

  const _TopIconButton({required this.assetPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTap,
      child: Container(
        width: 58,
        height: 58,
        padding: const EdgeInsets.all(0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(assetPath, width: 28, height: 28),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w500,
      height: 1.83,
    );

    const valueStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w300,
      height: 1.83,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        Text(value, style: valueStyle),
      ],
    );
  }
}

class _AIInsightCard extends StatelessWidget {
  final String cautionText;
  final String growthPhaseText;
  final String landConditionsText;
  final String estimateText;

  const _AIInsightCard({
    required this.cautionText,
    required this.growthPhaseText,
    required this.landConditionsText,
    required this.estimateText,
  });

  TextStyle get _titleStyle => const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
    height: 1.83,
  );

  TextStyle get _descStyle => const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w300,
    height: 1.83,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFBE588),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AI Insight',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w300,
              height: 1,
            ),
          ),
          const SizedBox(height: 12),

          _InsightRow(
            iconPath: 'assets/icons/caution_icon.png',
            title: 'Caution',
            description: cautionText,
            titleStyle: _titleStyle,
            descStyle: _descStyle,
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.black12, height: 1),
          const SizedBox(height: 8),

          _InsightRow(
            iconPath: 'assets/icons/growthphase_icon.png',
            title: 'Growth Phase',
            description: growthPhaseText,
            titleStyle: _titleStyle,
            descStyle: _descStyle,
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.black12, height: 1),
          const SizedBox(height: 8),

          _InsightRow(
            iconPath: 'assets/icons/landcontions_icon.png',
            title: 'Land Conditions',
            description: landConditionsText,
            titleStyle: _titleStyle,
            descStyle: _descStyle,
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.black12, height: 1),
          const SizedBox(height: 8),

          _InsightRow(
            iconPath: 'assets/icons/estimate_icon.png',
            title: 'Estimate',
            description: estimateText,
            titleStyle: _titleStyle,
            descStyle: _descStyle,
          ),

          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class _InsightRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final TextStyle titleStyle;
  final TextStyle descStyle;

  const _InsightRow({
    required this.iconPath,
    required this.title,
    required this.description,
    required this.titleStyle,
    required this.descStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(right: 8, top: 2),
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle),
              // const SizedBox(height: 1),
              Text(description, style: descStyle),
            ],
          ),
        ),
      ],
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String text;

  const RecommendationCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          // CONTENT COLUMN
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recomendation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                  height: 1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                  height: 1.57,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCBCBC),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/info_icon.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ARROW ICON (TOP RIGHT)
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
