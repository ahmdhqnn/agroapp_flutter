import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonitoringTopBar extends StatelessWidget {
  const MonitoringTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ClipRect(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/back_icon.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 79),
            Container(
              width: 212,
              height: 58,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: SvgPicture.asset(
                      'assets/icons/location_detail_icon.svg',
                      width: 28,
                      height: 28,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Field BTP Telkom',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '6°58\'10"S 107°37\'47"E | 318.4 m',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w300,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
