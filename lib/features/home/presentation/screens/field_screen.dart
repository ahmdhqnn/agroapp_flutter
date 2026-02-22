import 'package:agroappflutter/features/home/presentation/widgets/field_detail_card.dart';
import 'package:agroappflutter/features/home/presentation/widgets/field_header_card.dart';
import 'package:agroappflutter/features/home/presentation/widgets/field_indicator_grid.dart';
import 'package:agroappflutter/features/home/presentation/widgets/field_notes_card.dart';
import 'package:flutter/material.dart';
import '../models/field_model.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              FieldHeaderCard(field: field),
              const SizedBox(height: 16),
              FieldDetailCard(field: field),
              const SizedBox(height: 16),
              FieldIndicatorGrid(indicators: indicators),
              const SizedBox(height: 16),
              const FieldNotesCard(
                notes: 'Lahan memiliki tingkat rentan hama yang cukup tinggi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
