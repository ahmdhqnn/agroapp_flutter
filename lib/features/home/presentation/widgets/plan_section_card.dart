import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'plan_task_item.dart';
import 'plan_add_button.dart';

class PlanSectionCard extends StatelessWidget {
  final double width;
  final String title;
  final String subtitle;
  final Color background;
  final bool showAddButton;
  final String trailingIcon;

  const PlanSectionCard({
    super.key,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.background,
    required this.trailingIcon,
    this.showAddButton = false,
  });

  factory PlanSectionCard.today({required double width}) {
    return PlanSectionCard(
      width: width,
      title: "Today’s Plan",
      subtitle: "To Do",
      background: Colors.white,
      showAddButton: true,
      trailingIcon: 'assets/icons/task_icon.svg',
    );
  }

  factory PlanSectionCard.progress({required double width}) {
    return PlanSectionCard(
      width: width,
      title: "Plan Progress",
      subtitle: "In Progres",
      background: const Color(0xFFFBE588),
      trailingIcon: 'assets/icons/task_icon.svg',
    );
  }

  factory PlanSectionCard.completed({required double width}) {
    return PlanSectionCard(
      width: width,
      title: "Plan Completed",
      subtitle: "Completed",
      background: const Color(0xFFFDDEC5),
      trailingIcon: 'assets/icons/filter_icon.svg',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w300,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w300,
                      height: 1.83,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(trailingIcon, width: 28, height: 28),
            ],
          ),

          const SizedBox(height: 18),
          const PlanTaskItem(),
          const SizedBox(height: 10),
          const PlanTaskItem(),

          if (showAddButton) ...[
            const SizedBox(height: 20),
            const PlanAddButton(),
          ],
        ],
      ),
    );
  }
}
