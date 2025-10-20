import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    final cardHeight = cardWidth * 0.261;

    bool isDayTime = hour >= 6 && hour < 18;

    return isDayTime
        ? _buildDayWeatherCard(cardWidth, cardHeight)
        : _buildNightWeatherCard(cardWidth, cardHeight);
  }

  Widget _buildDayWeatherCard(double cardWidth, double cardHeight) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Opacity(
              opacity: 0.80,
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.01, 0.49),
                    end: Alignment(0.99, 0.51),
                    colors: [const Color(0xFF00D2FF), const Color(0xFF3A7BD5)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardHeight * 0.198),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.029,
            top: cardHeight * 0.209,
            child: Text(
              'Monday, 20 October',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                height: 1.83,
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.029,
            top: cardHeight * 0.055,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/location_icon.svg',
                  width: cardWidth * 0.034,
                  height: cardWidth * 0.034,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 2),
                const Text(
                  'Bandung, Indonesia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    height: 2.20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: cardWidth * 0.845,
            top: cardHeight * 0.725,
            child: Text(
              '28°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                height: 1.22,
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.029,
            top: cardHeight * 0.692,
            child: SvgPicture.asset(
              'assets/icons/day_icon.svg',
              width: cardWidth * 0.052,
              height: cardWidth * 0.052,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          Positioned(
            left: cardWidth * 0.654,
            top: -cardHeight * 0.638,
            child: Opacity(
              opacity: 0.23,
              child: Container(
                width: cardWidth * 0.332,
                height: cardWidth * 0.332,
                decoration: ShapeDecoration(
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.689,
            top: -cardHeight * 0.501,
            child: Opacity(
              opacity: 0.28,
              child: Container(
                width: cardWidth * 0.261,
                height: cardWidth * 0.261,
                decoration: ShapeDecoration(
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.731,
            top: -cardHeight * 0.340,
            child: Container(
              width: cardWidth * 0.178,
              height: cardWidth * 0.178,
              decoration: const ShapeDecoration(
                color: Color(0xFFFBE588),
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNightWeatherCard(double cardWidth, double cardHeight) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Opacity(
              opacity: 0.80,
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.01, 0.49),
                    end: Alignment(0.99, 0.51),
                    colors: [const Color(0xFF536976), const Color(0xFF292E49)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardHeight * 0.198),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.029,
            top: cardHeight * 0.209,
            child: Text(
              'Monday, 20 October',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                height: 1.83,
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.029,
            top: cardHeight * 0.055,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/location_icon.svg',
                  width: cardWidth * 0.034,
                  height: cardWidth * 0.034,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 2),
                const Text(
                  'Bandung, Indonesia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    height: 2.20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: cardWidth * 0.845,
            top: cardHeight * 0.725,
            child: Text(
              '28°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                height: 1.22,
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.029,
            top: cardHeight * 0.692,
            child: SvgPicture.asset(
              'assets/icons/night_icon.svg',
              width: cardWidth * 0.052,
              height: cardWidth * 0.052,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          Positioned(
            left: -cardWidth * 0.014,
            top: cardHeight * 0.297,
            child: Opacity(
              opacity: 0.79,
              child: Container(
                width: cardWidth * 0.049,
                height: cardWidth * 0.049,
                decoration: ShapeDecoration(
                  color: const Color(0xFF435365),
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.189,
            top: cardHeight * 0.484,
            child: Opacity(
              opacity: 0.79,
              child: Container(
                width: cardWidth * 0.023,
                height: cardHeight * 0.099,
                decoration: ShapeDecoration(
                  color: const Color(0x752B314B),
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.318,
            top: cardHeight * 0.659,
            child: Opacity(
              opacity: 0.79,
              child: Container(
                width: cardWidth * 0.026,
                height: cardHeight * 0.088,
                decoration: ShapeDecoration(
                  color: const Color(0x752B314B),
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.510,
            top: cardHeight * 0.396,
            child: Opacity(
              opacity: 0.79,
              child: Container(
                width: cardWidth * 0.026,
                height: cardHeight * 0.088,
                decoration: ShapeDecoration(
                  color: const Color(0x752B314B),
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: cardWidth * 0.401,
            top: cardHeight * 0.879,
            child: Opacity(
              opacity: 0.80,
              child: Container(
                width: cardWidth * 0.032,
                height: cardWidth * 0.032,
                decoration: ShapeDecoration(
                  color: const Color(0x992D344D),
                  shape: const OvalBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}