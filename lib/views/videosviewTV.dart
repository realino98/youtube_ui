import 'package:flutter/material.dart';
import 'package:youtube_ui/utils/videothumbnail.dart';

import '../models/video_model.dart';
import '../services/api_service.dart';

class VideosViewTV extends StatefulWidget {
  const VideosViewTV({super.key});

  @override
  State<VideosViewTV> createState() => _VideosViewTVState();
}

class _VideosViewTVState extends State<VideosViewTV> {
  late List<List<Video>> _playLists = [];
  List<Video> _playlistData = [];
  bool _isLoading = true;
  int maxResult = 25;
  String chart = "mostPopular";

  @override
  void initState() {
    super.initState();
    // _initPlaylist();
    _initPlaylist();
    _initPlaylist();
    _initPlaylist();
  }

  _initPlaylist() async {
    List<Video> playlistData = await API_Service.instance.fetchPlaylist();
    setState(() {
      _playLists.add(playlistData);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (int x = 0; x < _playLists.length; x++) ...[
              homeRowItem("Most Popular", _playLists[x]),
            ],
          ],
        ),
      ),
    );
  }

  homeRowItem(String category, List<Video> playlistData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        !_isLoading
            ? Container(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: VideoThumbnail(
                      video: playlistData[index],
                    ),
                  ),
                ),
              )
            : Container(
                height: 320,
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                )),
              ),
      ],
    );
  }
}
