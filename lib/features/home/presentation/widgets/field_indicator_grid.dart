import 'package:flutter/material.dart';
import '../models/field_model.dart';
import 'field_indicator_card.dart';

class FieldIndicatorGrid extends StatelessWidget {
  final List<FieldIndicator> indicators;

  const FieldIndicatorGrid({super.key, required this.indicators});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: indicators.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        final item = indicators[index];
        return FieldIndicatorCard(
          title: item.title,
          subtitle: item.subtitle,
          value: item.value,
          unit: item.unit,
        );
      },
    );
  }
}
