import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanTaskItem extends StatelessWidget {
  const PlanTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/toggletask_icon.svg',
          width: 36,
          height: 36,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Irigation',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  height: 1.83,
                ),
              ),
              Text(
                'Melakukan pembibitan pada tanggal 10-26 januari 2025.',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                  height: 1.83,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
