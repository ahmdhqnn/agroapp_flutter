import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanTopBar extends StatelessWidget {
  final double width;

  const PlanTopBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _TopIcon(asset: 'assets/icons/more_icon.svg'),
          _TopIcon(asset: 'assets/icons/envelope_icon.svg'),
        ],
      ),
    );
  }
}

class _TopIcon extends StatelessWidget {
  final String asset;

  const _TopIcon({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(child: SvgPicture.asset(asset, width: 28, height: 28)),
    );
  }
}
