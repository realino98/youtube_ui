import 'package:flutter/material.dart';
import 'package:youtube_ui/models/channel_model.dart';
import 'package:youtube_ui/pages/channel_page.dart';

import '../models/video_model.dart';
import '../pages/videoplay_page.dart';

class VideoThumbnail extends StatefulWidget {
  VideoThumbnail({
    required this.video,
  });
  final Video video;

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  @override
  Widget build(BuildContext context) {
    int selectedMenu = 0;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return VideoPlayPage(
                id: widget.video.id,
              );
            },
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 210,
                color: Colors.white,
                child: Image.network(
                  widget.video.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Image.network(widget.video.profilePicture),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            widget.video.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.video.channelTitle,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${widget.video.views} Views",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              " • ",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${widget.video.published[0]}${widget.video.published[1]}${widget.video.published[2]}${widget.video.published[3]}${widget.video.published[4]}${widget.video.published[5]}${widget.video.published[6]}${widget.video.published[7]}${widget.video.published[8]}${widget.video.published[9]}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (String item) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChannelPage(channelId: item),
                      ),
                    );
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: widget.video.channelId,
                      child: Text('Profile'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SmallThumbnail extends StatelessWidget {
  const SmallThumbnail({
    required this.video,
  });

  final Video video;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 90,
                  width: 160,
                  color: Colors.white,
                  child: Image.network(
                    video.thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 220,
                    child: Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    video.channelTitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "${video.views} Views",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        " • ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${video.published[0]}${video.published[1]}${video.published[2]}${video.published[3]}${video.published[4]}${video.published[5]}${video.published[6]}${video.published[7]}${video.published[8]}${video.published[9]}",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_vert_outlined,
          ),
        ],
      ),
    );
  }
}
