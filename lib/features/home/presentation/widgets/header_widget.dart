import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const text = Color(0xFF111111);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/profile_icon.svg',
                  width: 28,
                  height: 28,
                  colorFilter: const ColorFilter.mode(Color(0xFF000000), BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hi, Ahmad',
                    style: TextStyle(
                      color: text,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Field BTP Telkom',
                    style: TextStyle(
                      color: text,
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 58,
            height: 58,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/envelope_icon.svg',
              width: 28,
              height: 28,
              colorFilter: const ColorFilter.mode(Color(0xFF000000), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}