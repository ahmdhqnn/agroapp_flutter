import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'PlusJakartaSans',
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2BA84A)),
    useMaterial3: true,
  );
}
