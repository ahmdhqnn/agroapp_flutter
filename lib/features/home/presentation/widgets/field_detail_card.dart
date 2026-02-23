import 'package:flutter/material.dart';
import '../models/field_model.dart';

class FieldDetailCard extends StatelessWidget {
  final FieldModel field;

  const FieldDetailCard({super.key, required this.field});

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detail',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Field ${field.name}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
          const SizedBox(height: 12),

          _row('Nama', field.locationName),
          _row('Status', field.status),
          _row('Lat', field.lat.toString()),
          _row('Lon', field.lon.toString()),
          _row('Alt', field.alt.toString()),
        ],
      ),
    );
  }
}
