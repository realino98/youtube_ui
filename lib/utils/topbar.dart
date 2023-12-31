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
              IconButton(
                icon: CircleAvatar(),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 300,
                        height: 400,
                        padding: EdgeInsets.all(20),
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Channel Title"),
                                    Text("@Username"),
                                    Text(
                                      "... Subscribers",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            ListTile(
                              onTap: () {},
                              leading: Icon(Icons.settings),
                              title: Text("Settings"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
