import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForumPostActions extends StatelessWidget {
  const ForumPostActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _ActionButton("assets/icons/like_icon.svg", "Like"),
        _ActionButton("assets/icons/comment_icon.svg", "Comment"),
        _ActionButton("assets/icons/repost_icon.svg", "Share"),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String icon;
  final String label;

  const _ActionButton(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
