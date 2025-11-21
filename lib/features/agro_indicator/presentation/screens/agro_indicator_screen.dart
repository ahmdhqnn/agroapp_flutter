import 'package:flutter/material.dart';

class AgroIndicatorScreen extends StatelessWidget {
  const AgroIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Agro Indicator',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
