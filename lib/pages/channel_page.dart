import 'package:flutter/material.dart';
import 'package:youtube_ui/services/api_service.dart';
import 'package:youtube_ui/utils/videothumbnail.dart';

import '../models/channel_model.dart';
import '../models/video_model.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key, required this.channelId});
  final String channelId;

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  List<Video> _playlistData = [];
  late Channel _channel;
  bool _isLoading = true;
  int maxResult = 25;
  String chart = "mostPopular";

  @override
  void initState() {
    super.initState();
    _initChannelData();
  }

  _initChannelData() async {
    Channel channel =
        await API_Service.instance.fetchChannel(id: widget.channelId);
    // List<Video> playlistData = await API_Service.instance.fetchPlaylist();
    setState(() {
      _channel = channel;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Container(
                width: 100,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                ),
              ),
              Visibility(
                visible: !_isLoading,
                child: Column(
                  children: [
                    Container(
                      height: 210,
                      width: 800,
                      color: Colors.white,
                      // child: Image.network(
                      //   _channel.profilePicture,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Container(
                      width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      NetworkImage(_channel.profilePicture),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    _channel.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("${_channel.subscribers} Subscribers"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Watch Preview"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Subscribe"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      width: 900,
                      child: _channel.channelVideos.length != 0
                          ? ListView.builder(
                              itemBuilder: (context, index) {
                                return VideoThumbnail(
                                    video: _channel.channelVideos[index]);
                              },
                            )
                          : Text("Videos Empty"),
                    )
                  ],
                ),
                replacement: Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
