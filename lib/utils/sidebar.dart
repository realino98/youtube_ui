import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {},
          leading: Icon(Icons.home_outlined),
          title: Text("Home"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.shortcut_outlined),
          title: Text("Shorts"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.subscriptions_outlined),
          title: Text("Subscription"),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.video_library_outlined),
          title: Text("Library"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.history_outlined),
          title: Text("History"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.video_file_outlined),
          title: Text("Your Videos"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.watch_later_outlined),
          title: Text("Watch Later"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.download_outlined),
          title: Text("Downloads"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.thumb_up_outlined),
          title: Text("Liked Videos"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.arrow_drop_down),
          title: Text("Show more"),
        ),
        Divider(),
        //Subscription
        ListTile(
          title: Text("Subscription"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.circle_outlined),
          title: Text("Username"),
          trailing: Icon(Icons.broadcast_on_home),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.circle_outlined),
          title: Text("Username"),
          trailing: Icon(Icons.broadcast_on_home),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.circle_outlined),
          title: Text("Username"),
          trailing: Icon(Icons.broadcast_on_home),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.arrow_drop_down),
          title: Text("Show more"),
        ),
        Divider(),
        //Explore
        ListTile(
          title: Text("Explore"),
        ),
        Divider(),
        //More from YouTube
        ListTile(
          title: Text("More from YouTube"),
        ),
      ],
    );
  }
}
