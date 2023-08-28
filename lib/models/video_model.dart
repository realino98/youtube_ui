class Video {
  final String id;
  String profilePicture;
  final String title;
  final String channelTitle;
  final String thumbnail;
  final String published;
  final String views;
  final String channelId;

  Video({
    required this.id,
    required this.profilePicture,
    required this.title,
    required this.channelTitle,
    required this.thumbnail,
    required this.published,
    required this.views,
    required this.channelId,
  });

  factory Video.fromMap(Map<String, dynamic> video) {
    return Video(
      id: video['id'],
      profilePicture: video['snippet']['thumbnails']['default']['url'],
      title: video['snippet']['title'] ?? 'title',
      thumbnail: video['snippet']['thumbnails']['medium']['url'],
      channelTitle: video['snippet']['channelTitle'],
      published: video['snippet']['publishedAt'],
      // views: viewCount(video['statistics']['viewCount']),
      views: "1000",
      channelId: video['snippet']['channelId'],
    );
  }
}

String viewCount(String views) {
  String _tails = "";
  num viewCount = num.parse(views);

  if (viewCount <= 1000) {
    viewCount = viewCount;
  } else if (viewCount <= 1000000) {
    viewCount = viewCount ~/ 1000;
    _tails = "K";
  } else if (viewCount <= 1000000000) {
    viewCount = viewCount / 1000000;
    _tails = "M";
  } else if (viewCount <= 1000000000000) {
    viewCount = viewCount / 1000000000;
    _tails = "B";
  } else {
    viewCount = viewCount / 1000000000;
    _tails = "B";
  }
  return "${viewCount.toStringAsFixed(1)}${_tails}";
}
