import 'package:flutter/material.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

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
