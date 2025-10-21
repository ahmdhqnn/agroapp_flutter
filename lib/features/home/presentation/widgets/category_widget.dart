import 'package:flutter/material.dart';

class CategorySliderWidget extends StatefulWidget {
  const CategorySliderWidget({super.key});

  @override
  State<CategorySliderWidget> createState() => _CategorySliderWidgetState();
}

class _CategorySliderWidgetState extends State<CategorySliderWidget> {
  int _selectedIndex = 0;
  final List<String> categories = ['ALL', 'Plant', 'AI Insight', 'Indicator', 'Device', 'Farm'];

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
            bool isLastItem = index == categories.length - 1;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                width: 88,
                height: 38,
                margin: EdgeInsets.only(right: isLastItem ? 0.0 : 8.0),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? Colors.white : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: _selectedIndex == index ? text : inactiveText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
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