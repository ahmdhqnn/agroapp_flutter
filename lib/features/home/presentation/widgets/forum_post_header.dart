import 'package:flutter/material.dart';

class ForumPostHeader extends StatelessWidget {
  const ForumPostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFD86A6A),
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Center(
            child: Icon(Icons.person, color: Colors.white, size: 18),
          ),
        ),
        const SizedBox(width: 4),
        const SizedBox(
          width: 173,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fahmi Haikal",
                strutStyle: StrutStyle(
                  fontSize: 12,
                  height: 1.3,
                  forceStrutHeight: true,
                ),
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "20 September 2028",
                strutStyle: StrutStyle(
                  fontSize: 9,
                  height: 1.2,
                  forceStrutHeight: true,
                ),
                style: TextStyle(
                  fontSize: 9,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w300,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
