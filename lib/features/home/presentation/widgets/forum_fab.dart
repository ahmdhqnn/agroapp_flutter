import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForumFab extends StatelessWidget {
  const ForumFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 188, 255, 4),
        shape: const CircleBorder(),
        onPressed: () {
          // TODO: open create post bottom sheet
        },
        child: SvgPicture.asset(
          "assets/icons/pencil_icon.svg",
          width: 28,
          height: 28,
        ),
      ),
    );
  }
}
