import 'package:flutter/material.dart';
import 'package:youtube_ui/utils/videothumbnail.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  @override
  Widget build(BuildContext context) {
    // return Text("Hello");
    return Container(
      height: 650,
      width: double.infinity,
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 0.85,
        ),
        itemBuilder: (context, index) {
          return VideoThumbnail();
        },
      ),
    );
  }
}
