import 'package:youtube_ui/models/video_model.dart';

class Channel {
  final String id;
  final String title;
  final String profilePicture;
  final String subscribers;
  final String country;
  final String uploads;
  List<Video> channelVideos;

  Channel({
    required this.id,
    required this.title,
    required this.profilePicture,
    required this.subscribers,
    required this.country,
    required this.uploads,
    required this.channelVideos,
  });

  factory Channel.fromMap(Map<String, dynamic> channel) {
    return Channel(
      id: channel['id'],
      title: channel['snippet']['title'],
      profilePicture: channel['snippet']['thumbnails']['default']['url'],
      subscribers: channel['statistics']['subscriberCount'],
      country: channel['snippet']['country'],
      uploads: channel['contentDetails']['relatedPlaylists']['uploads'],
      channelVideos: [],
    );
  }
}
