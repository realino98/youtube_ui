import 'package:flutter/material.dart';
import 'package:youtube_ui/views/shortsview.dart';

import '../views/videosview.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
      child: Column(
        children: [
          VideosView(),
          Divider(),
          ShortsView(),
          Divider(),
          Text("Column 3"),
        ],
      ),
    );
  }
}
