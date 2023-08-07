class Video {
  final String id;
  final String profilePicture;
  final String title;
  final String channelTitle;
  final String thumbnail;
  final String published;
  final String views;

  Video({
    required this.id,
    required this.profilePicture,
    required this.title,
    required this.channelTitle,
    required this.thumbnail,
    required this.published,
    required this.views,
  });

  factory Video.fromMap(Map<String, dynamic> video) {
    return Video(
      id: video['id'],
      profilePicture: video['snippet']['thumbnails']['default']['url'],
      title: video['snippet']['title'] ?? 'title',
      thumbnail: video['snippet']['thumbnails']['default']['url'],
      channelTitle: video['snippet']['channelTitle'],
      published: video['snippet']['publishedAt'],
      views: video['statistics']['viewCount'],
    );
  }
}
