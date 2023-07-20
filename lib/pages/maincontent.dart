import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    // return GridView.builder(
    //   itemCount: 8,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 4,
    //   ),
    //   itemBuilder: (BuildContext context, int index) {
    //     return GridTile(
    //       child: Center(
    //         child: Text("Hello"),
    //       ),
    //     );
    //   },
    // );
    return Center(
      child: Text("Main Content"),
    );
  }
}
