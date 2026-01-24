import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/monitoring/presentation/screens/monitoring_screen.dart';
import 'features/agro_indicator/presentation/screens/agro_indicator_screen.dart';
import 'features/actions/presentation/screens/actions_screen.dart';
import 'features/support/presentation/screens/support_screen.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroApp',
      theme: AppTheme.lightTheme,
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MonitoringScreen(),
    AgroIndicatorScreen(),
    ActionsScreen(),
    ForumScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: _selectedIndex, children: _pages),

          SafeArea(
            bottom: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _CustomBottomNav(
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  activeColor: theme.colorScheme.primary,
                  inactiveColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  const _CustomBottomNav({
    required this.currentIndex,
    required this.onTap,
    required this.backgroundColor,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    // Tambahkan daftar base nama asset untuk tiap tab (ikuti pola: <base>filled.svg / <base>.svg)
    final svgBases = <String?>[
      'home_icon', // index 0 -> assets/icons/home_iconfilled.svg / home_icon.svg
      'monitoring_icon', // index 1 -> assets/icons/monitoring_iconfilled.svg / monitoring_icon.svg
      'indicatoragro_icon', // index 2 -> assets/icons/indicatoragro_iconfilled.svg / indicatoragro_icon.svg
      'task_icon', // index 3 -> assets/icons/task_iconfilled.svg / task_icon.svg
      'forum_icon', // index 4 -> assets/icons/forum_iconfilled.svg / forum_icon.svg
    ];

    final items = <IconData>[
      Icons.home,
      Icons.monitor,
      Icons.insights,
      Icons.flash_on,
      Icons.support_agent,
    ];

    final width = MediaQuery.of(context).size.width * 0.92;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: 78,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final isActive = index == currentIndex;
            final base = svgBases[index];
            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(28),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: isActive ? 48 : 44,
                        height: isActive ? 48 : 44,
                        decoration: BoxDecoration(
                          color: isActive ? activeColor : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: base != null
                              ? SvgPicture.asset(
                                  isActive
                                      ? 'assets/icons/${base}filled.svg'
                                      : 'assets/icons/${base}.svg',
                                  width: 28,
                                  height: 28,
                                  colorFilter: ColorFilter.mode(
                                    isActive ? Colors.white : inactiveColor,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : Icon(
                                  items[index],
                                  size: 28,
                                  color: isActive
                                      ? Colors.white
                                      : inactiveColor,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
