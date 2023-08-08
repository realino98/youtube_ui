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
  // Map<String, dynamic> _playlistData;
  late List<Video> _playlistData = [];
  bool _isLoading = true;
  int maxResult = 25;
  String chart = "mostPopular";

  @override
  void initState() {
    super.initState();
    _initPlaylist();
  }

  _initPlaylist() async {
    List<Video> playlistData = await API_Service.instance.fetchPlaylist();
    setState(() {
      _playlistData = playlistData;
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
          // id: _playlistData!['items'][index]['id'],
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
            // print(_playlistData['items'][index]['id']);
            return VideoThumbnail(
              id: _playlistData[index].id,
              profilePicture: _playlistData[index].profilePicture,
              title: _playlistData[index].title,
              thumbnail: _playlistData[index].thumbnail,
              channelTitle: _playlistData[index].channelTitle,
              published: _playlistData[index].published,
              views: _playlistData[index].views,
            );
          }
        },
      ),
    );
  }
}
