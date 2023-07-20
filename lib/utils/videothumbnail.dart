import 'package:flutter/material.dart';

class VideoThumbnail extends StatelessWidget {
  const VideoThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 210,
              color: Colors.white,
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
                      Text(
                        "[This is a Very Very  Very Long Title Line 1]\n[Title Line 2]",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "[Channel]",
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
                            "[Views]",
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
                            "[Uploaded Time]",
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
    );
  }
}
