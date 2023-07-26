import 'package:flutter/material.dart';

import '../pages/videoplay_page.dart';

class VideoThumbnail extends StatelessWidget {
  VideoThumbnail({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.channelTitle,
    required this.published,
    required this.views,
  });

  final String id;
  final String title;
  final String thumbnail;
  final String channelTitle;
  final String published;
  final String views;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return VideoPlayPage(
                id: id,
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
                  thumbnail,
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
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              channelTitle,
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
                              "${views} Views",
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
                              "${published[0]}${published[1]}${published[2]}${published[3]}${published[4]}${published[5]}${published[6]}${published[7]}${published[8]}${published[9]}",
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
                IconButton(
                  icon: Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
