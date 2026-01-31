import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SensorLog {
  final String name;
  final String left;
  final String right;
  final bool online;

  const SensorLog({
    required this.name,
    required this.left,
    required this.right,
    required this.online,
  });
}

class SensorLogCard extends StatefulWidget {
  const SensorLogCard({super.key});

  @override
  State<SensorLogCard> createState() => _SensorLogCardState();
}

class _SensorLogCardState extends State<SensorLogCard> {
  bool expanded = false;
  int activeTab = 0;

  final List<SensorLog> _sensors = const [
    SensorLog(
      name: 'Sensor 001',
      left: 'tmp : 24°c',
      right: 'hum : 70%',
      online: true,
    ),
    SensorLog(
      name: 'Sensor 002',
      left: 'soil tmp : 24°c',
      right: 'soil hum : 70%',
      online: true,
    ),
    SensorLog(
      name: 'Sensor 003',
      left: 'soil tmp : 24°c',
      right: 'soil hum : 70%',
      online: false,
    ),
    SensorLog(
      name: 'Sensor 004',
      left: 'tmp : 26°c',
      right: 'hum : 65%',
      online: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredSensors = _sensors.where((s) {
      if (activeTab == 1) return s.online;
      if (activeTab == 2) return !s.online;
      return true;
    }).toList();

    final visibleSensors = expanded
        ? filteredSensors
        : filteredSensors.take(3).toList();

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 20, 14, 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBE588),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sensor Log',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Plus Jakarta Sans',
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),

              _SensorTabs(
                activeTab: activeTab,
                onChanged: (index) {
                  setState(() => activeTab = index);
                },
              ),

              const SizedBox(height: 18),

              ...List.generate(visibleSensors.length, (index) {
                final sensor = visibleSensors[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == visibleSensors.length - 1 ? 0 : 8,
                  ),
                  child: _SensorItem(sensor: sensor),
                );
              }),
            ],
          ),

          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: () {
                setState(() => expanded = !expanded);
              },
              child: SizedBox(
                width: 28,
                height: 28,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SvgPicture.asset(
                    expanded
                        ? 'assets/icons/arrows_minimize_icon.svg'
                        : 'assets/icons/maximaze_icon.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SensorTabs extends StatelessWidget {
  final int activeTab;
  final ValueChanged<int> onChanged;

  const _SensorTabs({required this.activeTab, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      fontSize: 10,
      color: Colors.black,
    );

    Widget tab(String label, int index) {
      final bool active = activeTab == index;

      final textPainter = TextPainter(
        text: TextSpan(text: label, style: baseStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onChanged(index),
        child: Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: baseStyle.copyWith(
                  fontWeight: active ? FontWeight.w500 : FontWeight.w300,
                ),
              ),
              const SizedBox(height: 4),

              if (active)
                Container(
                  width: textPainter.width,
                  height: 1.5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Row(children: [tab('All', 0), tab('Online', 1), tab('Offline', 2)]);
  }
}

class _SensorItem extends StatelessWidget {
  final SensorLog sensor;

  const _SensorItem({required this.sensor});

  @override
  Widget build(BuildContext context) {
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
              Text(
                sensor.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Plus Jakarta Sans',
                  height: 1.83,
                ),
              ),
              Row(
                children: [
                  Text(
                    sensor.left,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Plus Jakarta Sans',
                      height: 1.83,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    sensor.right,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Plus Jakarta Sans',
                      height: 1.83,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
