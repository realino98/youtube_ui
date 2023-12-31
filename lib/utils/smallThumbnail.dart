import 'package:flutter/material.dart';

import '../models/video_model.dart';

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
