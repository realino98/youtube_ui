import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Left
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_outlined),
              ),
              Text(
                "YOUTUBE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          //Center
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.grey[900],
              child: Row(
                children: [
                  Container(
                    child: Text("Search"),
                    width: 250,
                  ),
                  IconButton(
                    icon: Icon(Icons.search_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          //Right
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.upload_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
