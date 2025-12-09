import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlantsOverviewScreen extends StatelessWidget {
  const PlantsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5); // samakan dengan HomeScreen
    const widthFactor = 0.92;

    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth * widthFactor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // TOP BAR (pakai lebar contentWidth & di-center)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _TopIconButton(
                        assetPath: 'assets/icons/back_icon.svg',
                        onTap: () => Navigator.of(context).maybePop(),
                      ),
                      _TopIconButton(
                        assetPath: 'assets/icons/more_icon.svg',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // TITLE
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: const Text(
                    'Plants Overview',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // IMAGE TANAMAN (masih di dalam lebar yang sama)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: Center(
                    child: Image.asset(
                      'assets/images/earlyreproductive.png',
                      width: 248,
                      height: 372,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // CARD DETAIL (lebar = contentWidth, sama seperti card di home)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: contentWidth,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Plant’s Detail",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w300,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Plant’s",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  width: 32,
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Agronomic Summary",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const _DetailRow(
                          label: "Types of Plants",
                          value: "Unknow",
                        ),
                        const SizedBox(height: 4),
                        const _DetailRow(
                          label: "Planting Date",
                          value: "12 Jan 2025",
                        ),
                        const SizedBox(height: 4),
                        const _DetailRow(label: "HST", value: "35 Day"),
                        const SizedBox(height: 4),
                        const _DetailRow(
                          label: "Growth Phase",
                          value: "Early reproductive",
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback? onTap;

  const _TopIconButton({required this.assetPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTap,
      child: Container(
        width: 58,
        height: 58,
        padding: const EdgeInsets.all(0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(assetPath, width: 28, height: 28),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w500,
      height: 1.83,
    );

    const valueStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w300,
      height: 1.83,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        Text(value, style: valueStyle),
      ],
    );
  }
}
