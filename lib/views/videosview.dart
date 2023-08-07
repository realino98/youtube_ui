import 'package:flutter/material.dart';
import 'package:youtube_ui/models/video_model.dart';
import 'package:youtube_ui/utils/videothumbnail.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../utilities/keys.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  // Map<String, dynamic> videoData;
  late List<Video> videoData = [];
  bool _isLoading = true;
  int maxResult = 25;
  String chart = "mostPopular";
  Future fetch(maxResult) async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, statistics',
      'maxResults': maxResult.toString(),
      // 'channelId': 'UChk1rCFhhnqPnDzcjIJKhTw',
      'chart': chart,
      'regionCode': 'ID',
    };
    var url = Uri.https('www.googleapis.com', '/youtube/v3/videos', parameters);

    // Await the http get response, then  decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      // print(jsonResponse['items'][0]['kind']);
      // return jsonResponse['items'];
      List<dynamic> videosJson = jsonResponse['items'];
      videosJson.forEach(
        (video) {
          videoData.add(Video.fromMap(video));
        },
      );
      setState(
        () {
          // print(videoData[0].id);\
          // print(videoData);

          _isLoading = false;
        },
      );
      // print(videoData['items'][1]['snippet']['title'] as String);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch(maxResult);
    super.initState();
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
          // id: videoData!['items'][index]['id'],
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
            // print(videoData['items'][index]['id']);
            return VideoThumbnail(
              id: videoData[index].id,
              profilePicture: videoData[index].profilePicture,
              title: videoData[index].title,
              thumbnail: videoData[index].thumbnail,
              channelTitle: videoData[index].channelTitle,
              published: videoData[index].published,
              views: videoData[index].views,
            );
          }
        },
      ),
    );
  }
}
