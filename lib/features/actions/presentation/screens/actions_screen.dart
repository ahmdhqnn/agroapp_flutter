import 'package:flutter/material.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Actions',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
