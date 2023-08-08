import 'package:flutter/material.dart';
import 'package:youtube_ui/utils/categorybar.dart';
import 'package:youtube_ui/utils/topbar.dart';

import '../utils/sidebar.dart';
import 'maincontent.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBar(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // TopBar(),
          Expanded(
            child: Row(
              children: [
                Sidebar(
                  onSelectedItem: (String category) {
                    print(category);
                  },
                ),
                Expanded(
                  child: Column(
                    children: [
                      // CategoryBar(),
                      Expanded(
                        child: MainContent(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
