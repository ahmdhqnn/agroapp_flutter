import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({
    super.key,
    this.widthFactor = 0.9,
    this.tasks = const [],
  });

  final double widthFactor;
  final List<PlanTask> tasks;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * widthFactor;
    final effectiveTasks = tasks.isEmpty ? _dummyTasks : tasks;

    return Center(
      child: Container(
        width: cardWidth,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 20, 14, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Action Plan',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w300,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 4),

                  const _PlanTabsRow(),
                  const SizedBox(height: 20),

                  ...List.generate(effectiveTasks.length, (index) {
                    final task = effectiveTasks[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == effectiveTasks.length - 1 ? 0 : 8,
                      ),
                      child: _PlanTaskItem(task: task),
                    );
                  }),
                ],
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
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
          ],
        ),
      ),
    );
  }
}

class PlanTask {
  final String title;
  final String description;

  const PlanTask({required this.title, required this.description});
}

class _PlanTabsRow extends StatelessWidget {
  const _PlanTabsRow();

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      fontSize: 10,
      color: Colors.black,
    );

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To Do',
              style: baseStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 3),
            Container(
              width: 28,
              height: 1.5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Text(
          'In Progres',
          style: baseStyle.copyWith(fontWeight: FontWeight.w300),
        ),
        const SizedBox(width: 14),
        Text(
          'Completed',
          style: baseStyle.copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _PlanTaskItem extends StatelessWidget {
  final PlanTask task;

  const _PlanTaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w500,
      height: 1.83,
    );

    const descStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w300,
      height: 1.83,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: SvgPicture.asset(
            'assets/icons/toggletask_icon.svg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title, style: titleStyle),
              Text(task.description, style: descStyle),
            ],
          ),
        ),
      ],
    );
  }
}

const List<PlanTask> _dummyTasks = [
  PlanTask(
    title: 'Irigation',
    description: 'Melakukan pembibitan pada tanggal 10-26 januari 2025.',
  ),
  PlanTask(
    title: 'Irigation',
    description: 'Melakukan pemupukan urea 50kg/ha pada tanggal 3 maret 2025.',
  ),
];
