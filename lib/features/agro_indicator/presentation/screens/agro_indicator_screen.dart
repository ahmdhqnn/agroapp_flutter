import 'package:agroappflutter/features/home/presentation/widgets/GDDComparisonCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agroappflutter/features/home/presentation/widgets/indicator_card.dart';
import 'package:agroappflutter/features/home/presentation/widgets/growth_phase_card.dart';
import 'package:agroappflutter/features/home/presentation/widgets/RecommendationCardSparkle.dart';

class AgroIndicatorScreen extends StatelessWidget {
  const AgroIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF5F5F5);
    const widthFactor = 0.92;

    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth * widthFactor;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: SizedBox(
              width: contentWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  Row(
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

                  const SizedBox(height: 16),

                  const IndicatorOnlyCard(),

                  const SizedBox(height: 12),

                  const GDDComparisonCard(),

                  const SizedBox(height: 12),

                  const RecommendationCardSparkle(
                    showArrow: false,
                    text:
                        'VDP Moderat (1.7 kPa). Cek soil moisture.\n'
                        'Jika WFPS < 50% → lakukan irigasi tambahan.\n'
                        'ETc tinggi → tambahkan jadwal irigasi harian.\n'
                        'GDD kalibrasi (845) → fase reproduktif awal.\n'
                        'Sesuaikan pemupukan berdasarkan fase.',
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: contentWidth,
                      child: const Text(
                        'Growht Phase',
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

                  const SizedBox(height: 12),

                  const GrowthPhaseCard(showArrow: false),

                  const SizedBox(height: 12),

                  const RecommendationCardSparkle(
                    showArrow: false,
                    text:
                        'Beri pupuk P & K, kurangi N berlebih.\n'
                        'Air dijaga macak-macak (2–5 cm).\n'
                        'Cek hama & penyakit blas.\n'
                        'Bersihkan gulma.',
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: SvgPicture.asset(assetPath, width: 28, height: 28),
        ),
      ),
    );
  }
}
