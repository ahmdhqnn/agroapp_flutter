import 'package:flutter/material.dart';

class CategorySliderWidget extends StatefulWidget {
  const CategorySliderWidget({super.key});

  @override
  State<CategorySliderWidget> createState() => _CategorySliderWidgetState();
}

class _CategorySliderWidgetState extends State<CategorySliderWidget> {
  int _selectedIndex = 0;

  final List<String> categories = [
    'ALL',
    'Plant Stats',
    'AI Insight',
    'Indicator',
    'Device',
    'Farm',
  ];

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F5F5);
    const text = Color(0xFF111111);
    const inactiveText = Color(0xFF666666);

    return Container(
      color: bg,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final isSelected = _selectedIndex == index;
            final isLast = index == categories.length - 1;

            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Container(
                constraints: const BoxConstraints(minWidth: 72),
                height: 38,
                margin: EdgeInsets.only(right: isLast ? 0 : 8),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected ? text : inactiveText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
