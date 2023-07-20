import 'package:flutter/material.dart';
import 'package:youtube_ui/utils/topbar.dart';

import '../utils/sidebar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      // appBar: AppBar(
      //   title: Text(
      //     "YOUTUBE",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.upload_outlined),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.notifications_outlined),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.circle_outlined),
      //     ),
      //     SizedBox(
      //       width: 10,
      //     )
      //   ],
      // ),
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
                  child: Center(
                    child: Text("White"),
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
