import 'package:flutter/material.dart';

class SmallThumbnail extends StatelessWidget {
  const SmallThumbnail({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.channelTitle,
    required this.published,
    required this.views,
    required this.profilePicture,
  });

  final String id;
  final String title;
  final String thumbnail;
  final String channelTitle;
  final String published;
  final String views;
  final String profilePicture;
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
                    thumbnail,
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
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    channelTitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: <Widget>[
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
          Icon(
            Icons.more_vert_outlined,
          ),
        ],
      ),
    );
  }
}
