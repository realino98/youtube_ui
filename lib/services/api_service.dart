import '../models/video_model.dart';
import '../utilities/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API_Service {
  API_Service._instantiate();
  static final API_Service instance = API_Service._instantiate();

  late List<Video> videoData = [];
  Future<List<Video>> fetchPlaylist() async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, statistics',
      'maxResults': '25',
      // 'channelId': 'UChk1rCFhhnqPnDzcjIJKhTw',
      'chart': 'mostPopular',
      'regionCode': 'ID',
    };
    var url = Uri.https('www.googleapis.com', '/youtube/v3/videos', parameters);

    // Await the http get response, then  decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse);
      // print(jsonResponse['items'][0]['kind']);
      // return jsonResponse['items'];
      List<dynamic> videosJson = jsonResponse['items'];
      videosJson.forEach(
        (video) {
          videoData.add(Video.fromMap(video));
        },
      );
      return videoData;
      // print(videoData['items'][1]['snippet']['title'] as String);
    } else {
      throw convert.jsonDecode(response.body)['error']['message'];
    }
  }

  Future<Video> fetchVideo({required String id}) async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, statistics',
      'id': id,
    };
    var url = Uri.https('www.googleapis.com', '/youtube/v3/videos', parameters);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse['items'][0]);
      // return jsonResponse['items'];
      // print(Video.fromMap(jsonResponse['items']));
      return Video.fromMap(jsonResponse['items'][0]);
      // setState(() {
      //   playingVideoData = jsonResponse;
      //   _isVideoLoading = false;
      // });
      // print(playingVideoData['items'][1]['snippet']['title'] as String);
    } else {
      throw convert.jsonDecode(response.body)['error']['message'];
    }
  }
}
