import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandConditions extends StatelessWidget {
  const LandConditions({
    super.key,
    this.title = 'Land Conditions',
    this.widthFactor = 0.9,
    this.onOpenMaps,
    this.onOpenAnalyzer,
  });

  final String title;
  final double widthFactor;
  final VoidCallback? onOpenMaps;
  final VoidCallback? onOpenAnalyzer;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * widthFactor;

    final cardRadius = BorderRadius.circular(18);
    final smallRadius = BorderRadius.circular(10);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 22,
            fontWeight: FontWeight.w400,
            height: 1,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),

        Container(
          width: w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: cardRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Maps',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Field BTP Telkom',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1.83,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Field BTP Telkom',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  height: 1.57,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '6°58\'10"S 107°37\'47"E | 318.4 m²',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Jl. Telekomunikasi No. 1, Bandung Terusan Buahbatu - Bojongsoang, Sukapura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40257',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        Container(
                          width: w * 0.28 < 120 ? 120 : w * 0.28,
                          height: (w * 0.28 < 120 ? 120 : w * 0.28) * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFF0F0F0),
                              width: 1,
                            ),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://placehold.co/300x180?text=map',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Positioned(
                  top: -8,
                  right: -8,
                  child: GestureDetector(
                    onTap:
                        onOpenMaps ??
                        () {
                          // default empty
                        },
                    child: SizedBox(
                      width: 36,
                      height: 36,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(
                          'assets/icons/arrowupright_icon.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        Container(
          width: w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: cardRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Analyzer',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Field BTP Telkom',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1.83,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: smallRadius,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.cloud_upload_outlined,
                                color: const Color(0xFFB6B6B6),
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(fontFamily: 'Plus Jakarta Sans'),
                              children: [
                                TextSpan(
                                  text: 'Click to upload ',
                                  style: TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: 'or drag and drop',
                                  style: TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'SVG, PNG, JPG',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFFB6B6B6),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Positioned(
                  top: -8,
                  right: -8,
                  child: GestureDetector(
                    onTap:
                        onOpenAnalyzer ??
                        () {
                          // default empty
                        },
                    child: SizedBox(
                      width: 36,
                      height: 36,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(
                          'assets/icons/arrowupright_icon.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
