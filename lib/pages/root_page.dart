import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Sidebar(),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }
}
