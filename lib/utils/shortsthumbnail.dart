import 'package:flutter/material.dart';

class ShortsThumbnail extends StatelessWidget {
  const ShortsThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 300,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "[This is a Very Long Title Line 1]\n[Title Line 2]",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "[Views]",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
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
