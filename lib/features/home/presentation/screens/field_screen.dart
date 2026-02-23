import 'package:agroappflutter/features/home/presentation/widgets/field_detail_card.dart';
import 'package:agroappflutter/features/home/presentation/widgets/field_header_card.dart';
import 'package:agroappflutter/features/home/presentation/widgets/field_indicator_grid.dart';
import 'package:agroappflutter/features/home/presentation/widgets/field_notes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/field_model.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5);
    const widthFactor = 0.92;

    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth * widthFactor;

    final field = FieldModel(
      name: 'BTP Telkom',
      locationName: 'Sawah',
      address:
          'Jl. Telekomunikasi No. 1, Bandung Terusan Buahbatu - Bojongsoang...',
      status: 'Active',
      lat: -6.31234,
      lon: 107.12345,
      alt: 35,
    );

    final indicators = [
      const FieldIndicator(
        title: 'Humidity',
        subtitle: 'Ideal',
        value: '56',
        unit: '%',
      ),
      const FieldIndicator(
        title: 'Temperature',
        subtitle: 'Normal',
        value: '30.1°',
        unit: 'C',
      ),
      const FieldIndicator(
        title: 'Soil Humidity',
        subtitle: 'Optimal',
        value: '56',
        unit: '%',
      ),
      const FieldIndicator(
        title: 'pH',
        subtitle: 'Lowly',
        value: '6.5',
        unit: '',
      ),
    ];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                  child: Column(
                    children: [
                      FieldHeaderCard(field: field),
                      const SizedBox(height: 16),
                      FieldDetailCard(field: field),
                      const SizedBox(height: 16),
                      FieldIndicatorGrid(indicators: indicators),
                      const SizedBox(height: 16),
                      const FieldNotesCard(
                        notes:
                            'Lahan memiliki tingkat rentan hama yang cukup tinggi',
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
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
