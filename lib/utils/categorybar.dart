import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      padding: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text("Category"),
            ),
            SizedBox(
              width: 8,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Category"),
            ),
            SizedBox(
              width: 8,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Category"),
            ),
          ],
        ),
      ),
    );
  }
}
