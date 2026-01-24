import 'package:flutter/material.dart';
import 'package:agroappflutter/features/home/presentation/widgets/header_widget.dart';
import 'package:agroappflutter/features/home/presentation/widgets/forum_post.dart';
import 'package:agroappflutter/features/home/presentation/widgets/forum_fab.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const ForumFab(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderWidget(),
              SizedBox(height: 12),
              ForumPost(),
              SizedBox(height: 12),
              ForumPost(),
              SizedBox(height: 12),
              ForumPost(),
              SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}
