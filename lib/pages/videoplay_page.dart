// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube_ui/utilities/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../utils/smallThumbnail.dart';
import '../utils/topbar.dart';

class VideoPlayPage extends StatefulWidget {
  VideoPlayPage({super.key, required this.id});

  final String id;

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  Map? playingVideoData;
  Map? playlistData;
  int maxResult = 25;
  Future fetchPlaylist(maxResult) async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, statistics',
      'maxResults': maxResult.toString(),
      // 'channelId': 'UChk1rCFhhnqPnDzcjIJKhTw',
      'chart': 'mostPopular',
      'regionCode': 'ID',
    };
    var url = Uri.https('www.googleapis.com', '/youtube/v3/videos', parameters);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse['items'][0]['kind']);
      // return jsonResponse['items'];
      setState(() {
        playlistData = jsonResponse;
      });
      // print(playlistData['items'][1]['snippet']['title'] as String);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future fetchVideo() async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, statistics',
      'id': widget.id,
    };
    var url = Uri.https('www.googleapis.com', '/youtube/v3/videos', parameters);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse['items'][0]['kind']);
      // return jsonResponse['items'];
      setState(() {
        playingVideoData = jsonResponse;
      });
      // print(playingVideoData['items'][1]['snippet']['title'] as String);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchVideo();
    fetchPlaylist(maxResult);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBar(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
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
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              width: 1300,
                              child: Text(
                                playingVideoData!['items'][0]['snippet']
                                    ['title'],
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
                                        playingVideoData!['items'][0]['snippet']
                                            ['channelTitle'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "[Subscribers]",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                      "${playingVideoData!['items'][0]['statistics']['viewCount']} Views"),
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
                                        Text(
                                            "${playingVideoData!['items'][0]['statistics']['likeCount']}"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.thumb_down_outlined),
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
                                    child: Icon(Icons.more_horiz_outlined),
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
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return SmallThumbnail(
                          id: playlistData!['items'][index]['id'],
                          profilePicture: playlistData!['items'][index]
                              ['snippet']['thumbnails']['default']['url'],
                          title: playlistData!['items'][index]['snippet']
                                  ['title'] ??
                              'title',
                          thumbnail: playlistData!['items'][index]['snippet']
                              ['thumbnails']['default']['url'],
                          channelTitle: playlistData!['items'][index]['snippet']
                              ['channelTitle'],
                          published: playlistData!['items'][index]['snippet']
                              ['publishedAt'],
                          views: playlistData!['items'][index]['statistics']
                              ['viewCount'],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
