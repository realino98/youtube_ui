import 'package:flutter/material.dart';

import '../utils/categorybar.dart';
import '../utils/sidebar.dart';
import '../utils/topbar.dart';
import 'maincontent.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({super.key});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
