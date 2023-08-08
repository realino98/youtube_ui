// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../models/video_model.dart';
import '../services/api_service.dart';
import '../utils/smallThumbnail.dart';
import '../utils/topbar.dart';

class VideoPlayPage extends StatefulWidget {
  VideoPlayPage({super.key, required this.id});

  final String id;

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late Video _videoData;
  late List<Video> _playlistData = [];
  int maxResult = 25;
  bool _isVideoLoading = true;
  bool _isPlaylistLoading = true;

  @override
  void initState() {
    super.initState();
    _initVideo();
    _initPlaylist();
  }

  _initVideo() async {
    Video videoData = await API_Service.instance.fetchVideo(id: widget.id);
    setState(() {
      _videoData = videoData;
      _isVideoLoading = false;
    });
  }

  _initPlaylist() async {
    List<Video> playlistData = await API_Service.instance.fetchPlaylist();
    setState(() {
      _playlistData = playlistData;
      _isPlaylistLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBar(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: !_isVideoLoading
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  // TopBar(),
                  SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Video
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 750,
                              width: 1400,
                              color: Colors.grey[500],
                              child: YoutubePlayer(
                                controller: YoutubePlayerController.fromVideoId(
                                  videoId: widget.id,
                                  autoPlay: true,
                                  params: const YoutubePlayerParams(
                                      showFullscreenButton: true),
                                ),
                                aspectRatio: 16 / 9,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    width: 1300,
                                    child: Text(
                                      _videoData.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    //Items Left
                                    Row(
                                      children: [
                                        CircleAvatar(),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _videoData.channelTitle,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "[Subscribers]",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("${_videoData.views} Views"),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Subscribe"),
                                        ),
                                      ],
                                    ),
                                    //Items Right
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(Icons.thumb_up_outlined),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text("[likecount]"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child:
                                              Icon(Icons.thumb_down_outlined),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(Icons.share_outlined),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text("Share"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(Icons.download_outlined),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text("Download"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(Icons.cut_outlined),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text("Clip"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(Icons.save_outlined),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text("Save"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child:
                                              Icon(Icons.more_horiz_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        //Recomendation
                        Container(
                          height: 920,
                          width: 420,
                          child: _isPlaylistLoading
                              ? Container(
                                  child: Center(
                                      child: CircularProgressIndicator(
                                  color: Colors.grey,
                                )))
                              : ListView.builder(
                                  itemCount: 25,
                                  itemBuilder: (context, index) {
                                    return SmallThumbnail(
                                      video: _playlistData[index],
                                    );
                                  },
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
    );
  }
}
