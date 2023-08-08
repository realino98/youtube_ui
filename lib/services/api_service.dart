import '../models/video_model.dart';
import '../utilities/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API_Service {
  API_Service._instantiate();
  static final API_Service instance = API_Service._instantiate();

  List<String> urlString = ['www.googleapis.com', '/youtube/v3/videos'];

  late List<Video> videoData = [];
  Future<List<Video>> fetchPlaylist([String chart = 'mostPopular']) async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, statistics',
      'maxResults': '25',
      // 'channelId': 'UChk1rCFhhnqPnDzcjIJKhTw',
      'chart': chart,
      'regionCode': 'ID',
    };
    var url = Uri.https(urlString[0], urlString[1], parameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> videosJson = jsonResponse['items'];
      videosJson.forEach(
        (video) {
          videoData.add(Video.fromMap(video));
        },
      );
      return videoData;
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
    var url = Uri.https(urlString[0], urlString[1], parameters);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return Video.fromMap(jsonResponse['items'][0]);
    } else {
      throw convert.jsonDecode(response.body)['error']['message'];
    }
  }
}
