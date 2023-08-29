import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.onSelectedItem});
  final Function onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      child: ListView(
        children: [
          // ListTile(
          //   title: Text("Explore"),
          // ),
          listTile(Icons.trending_up_outlined, "Trending"),
          listTile(Icons.music_note_outlined, "Music"),
          listTile(Icons.movie_outlined, "Movies"),
          listTile(Icons.gamepad_outlined, "Gaming"),
          listTile(Icons.newspaper_outlined, "News"),
          listTile(Icons.sports_outlined, "Sports"),
          Divider(),
          listTile(Icons.settings_outlined, "Settings"),
          listTile(Icons.flag_outlined, "history"),
          listTile(Icons.help_outline, "Help"),
          listTile(Icons.info_outline, "Send feedback"),
        ].animate(interval: 100.ms, delay: 1000.ms).fade(duration: 300.ms),
      ),
    );
  }

  ListTile listTile(IconData icon, String text) {
    return ListTile(
      onTap: () => onSelectedItem(text),
      leading: Icon(
        icon,
        size: 35,
      ),
      // title: Text(text),
    );
  }
}
