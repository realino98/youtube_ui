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
      body: Column(
        children: [
          Container(
            height: 60,
            child: TopBar(),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  child: Sidebar(),
                  width: 250,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: CategoryBar(),
                      ),
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
