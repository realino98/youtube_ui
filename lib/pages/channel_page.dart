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
      body: Visibility(
        visible: !_isLoading,
        replacement: Container(
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          )),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
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
                  replacement: Container(
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 210,
                        width: 1700,
                        color: Colors.white,
                        // child: Image.network(
                        //   _channel.profilePicture,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 1600,
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                const SizedBox(
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
                      SizedBox(
                        height: 500,
                        width: 1600,
                        child: !_isLoading
                            ? ListView.builder(
                                itemCount: _channel.channelVideos.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: VideoThumbnail(
                                        video: _channel.channelVideos[index]),
                                  );
                                },
                              )
                            : CircularProgressIndicator(),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
