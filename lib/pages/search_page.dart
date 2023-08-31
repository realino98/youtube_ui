import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = "";
  List<String> _keypad = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '-',
    "'"
  ];
  @override
  Widget build(BuildContext context) {
    num screen_height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Search
            Container(
              width: 300,
              child: Row(
                children: [
                  Text(
                    _searchText,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            //List
            Expanded(
              child: Container(
                // height: screen_height.toDouble() - 120,
                width: 300,
                // color: Colors.grey,
                child: ListView.separated(
                  itemCount: 12,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {},
                    leading: Icon(Icons.trending_up_outlined),
                    title: Text(
                      "Results",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 8,
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        //Keypad
        Column(
          children: [
            Container(
              width: 500,
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7),
                itemCount: 27,
                itemBuilder: (context, index) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      setState(() {
                        _searchText = _searchText + _keypad[index];
                      });
                    },
                    child: Text(
                      _keypad[index],
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _searchText = _searchText + ' ';
                      });
                    },
                    child: Text("Space"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _searchText =
                            _searchText.substring(0, _searchText.length - 1);
                      });
                    },
                    child: Text("Delete"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Search"),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
