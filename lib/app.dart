import 'package:flutter/material.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroApp',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
