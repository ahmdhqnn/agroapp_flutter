import 'package:flutter/material.dart';
import 'forum_post_actions.dart';

class ForumPostContent extends StatelessWidget {
  const ForumPostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: const [
          Text(
            "Tingkat gagal panen padi pada saat ini menurun drastis karena meningkatnya hama sawah di sekitaran bandung barat.",
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12),
          _PostImage(),
          SizedBox(height: 10),
          _PostStats(),
          SizedBox(height: 12),
          ForumPostActions(),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        "assets/images/post_ex.jpg",
        width: double.infinity,
        height: 131,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "450",
          style: TextStyle(fontSize: 9, fontFamily: 'Plus Jakarta Sans'),
        ),
        Text(
          "450 Comment | 56 Share",
          style: TextStyle(fontSize: 9, fontFamily: 'Plus Jakarta Sans'),
        ),
      ],
    );
  }
}
