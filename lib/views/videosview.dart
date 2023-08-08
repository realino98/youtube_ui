import 'package:flutter/material.dart';
import 'package:youtube_ui/models/video_model.dart';
import 'package:youtube_ui/services/api_service.dart';
import 'package:youtube_ui/utils/videothumbnail.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  // Map<String, dynamic> _videoData;
  late List<Video> _videoData = [];
  bool _isLoading = true;
  int maxResult = 25;
  String chart = "mostPopular";

  @override
  void initState() {
    super.initState();
    _initVideos();
  }

  _initVideos() async {
    List<Video> videoData = await API_Service.instance.fetch();
    setState(() {
      _videoData = videoData;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Text("Hello");
    return Container(
      height: 900,
      width: double.infinity,
      child: GridView.builder(
        itemCount: maxResult,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 0.85,
        ),
        itemBuilder: (context, index) {
          // id: _videoData!['items'][index]['id'],
          if (_isLoading) {
            return Container(
              width: 200,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            );
          } else {
            // print(_videoData['items'][index]['id']);
            return VideoThumbnail(
              id: _videoData[index].id,
              profilePicture: _videoData[index].profilePicture,
              title: _videoData[index].title,
              thumbnail: _videoData[index].thumbnail,
              channelTitle: _videoData[index].channelTitle,
              published: _videoData[index].published,
              views: _videoData[index].views,
            );
          }
        },
      ),
    );
  }
}
