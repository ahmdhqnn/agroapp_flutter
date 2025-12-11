import 'package:flutter/material.dart';

class DataHistoryScreen extends StatelessWidget {
  const DataHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Monitoring',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
