// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../utils/topbar.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({super.key});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TopBar(),
            SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Video
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 750,
                        width: 1400,
                        color: Colors.grey[500],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "[Title of The Video]",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              //Items Left
                              Row(
                                children: [
                                  CircleAvatar(),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "[Channel Name]",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "[Subscribers]",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Subscribe"),
                                  ),
                                ],
                              ),
                              //Items Right
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.thumb_up_outlined),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.thumb_down_outlined),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.share_outlined),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Share"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.download_outlined),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Download"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.cut_outlined),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Clip"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.save_outlined),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Save"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.more_horiz_outlined),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  //Recomendation
                  Column(
                    children: [
                      Container(
                        height: 900,
                        width: 400,
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
