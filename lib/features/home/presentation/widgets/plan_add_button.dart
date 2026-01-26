import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanAddButton extends StatelessWidget {
  const PlanAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFA283FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Add New Plan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          SvgPicture.asset(
            'assets/icons/bullseye_icon.svg',
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
