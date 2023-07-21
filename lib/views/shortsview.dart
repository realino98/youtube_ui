import 'package:flutter/material.dart';
import 'package:youtube_ui/utils/shortsthumbnail.dart';

class ShortsView extends StatelessWidget {
  const ShortsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.shortcut_outlined,
                  ),
                  Text("Shorts"),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ],
          ),
        ),
        Container(
          height: 480,
          child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 2,
            ),
            itemBuilder: (context, index) {
              return ShortsThumbnail();
            },
          ),
        ),
        ListTile(
          onTap: () {},
          title: Container(
            child: Center(child: Icon(Icons.arrow_drop_down_outlined)),
            height: 50,
          ),
        ),
      ],
    );
  }
}
