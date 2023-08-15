import 'dart:io';

import '../models/channel_model.dart';
import '../models/video_model.dart';
import '../utilities/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API_Service {
  API_Service._instantiate();
  static final API_Service instance = API_Service._instantiate();

  List<String> urlString = ['www.googleapis.com', '/youtube/v3/'];
  String _nextPageToken = '';
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
    var url = Uri.https(urlString[0], urlString[1] + "videos", parameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> videosJson = jsonResponse['items'];
      videosJson.forEach(
        (video) {
          videoData.add(Video.fromMap(video as Map<String, dynamic>));
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
    var url = Uri.https(urlString[0], urlString[1] + "videos", parameters);

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

  Future<Channel> fetchChannel({required String id}) async {
    Map<String, String> parameters = {
      'key': API_KEY,
      'part': 'snippet, contentDetails, statistics',
      'id': id,
    };
    var url = Uri.https(urlString[0], urlString[1] + "channels", parameters);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Channel channel = Channel.fromMap(jsonResponse['items'][0]);

      channel.channelVideos =
          await fetchVideosFromPlaylist(playlistId: channel.uploads);
      return channel;
    } else {
      throw convert.jsonDecode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist(
      {required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails',
      'playlistId': playlistId,
      'maxResults': '12',
      // 'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    var url =
        Uri.https(urlString[0], urlString[1] + "playlistItems", parameters);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    // Get Playlist Videos
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      // _nextPageToken = jsonResponse['nextPageToken'] ?? '';
      List<dynamic> videosJson = jsonResponse['items'];

      List<Video> videos = [];
      videosJson.forEach(
        (video) => videos.add(
          Video.fromMap(video),
        ),
      );
      return videos;
    } else {
      throw convert.jsonDecode(response.body)['error']['message'];
    }
  }
}
