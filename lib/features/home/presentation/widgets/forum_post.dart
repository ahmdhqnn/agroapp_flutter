import 'package:flutter/material.dart';
import 'forum_post_header.dart';
import 'forum_post_content.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ForumPostHeader(),
          SizedBox(height: 5),
          ForumPostContent(),
        ],
      ),
    );
  }
}
