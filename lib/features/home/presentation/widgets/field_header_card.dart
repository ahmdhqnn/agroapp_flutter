import 'package:flutter/material.dart';
import '../models/field_model.dart';

class FieldHeaderCard extends StatelessWidget {
  final FieldModel field;

  const FieldHeaderCard({super.key, required this.field});

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
            'Field',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            field.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFF0F0F0), width: 3),
              image: const DecorationImage(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            field.address,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ],
      ),
    );
  }
}
