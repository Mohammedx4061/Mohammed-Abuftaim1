import 'package:flutter/material.dart';

import 'DetailScreen.dart';
import 'list.dart';

class Searchpage extends StatelessWidget {
  // تعريف كل عنصر بشكل منفصل
  final list item1 = list('Item 1', 'This is a description for item 1.', Icons.home);
  final list item2 = list('Item 2', 'This is a description for item 2.', Icons.star);
  final list item3 = list('Item 3', 'This is a description for item 3.', Icons.settings);
  final list item4 = list('Item 4', 'This is a description for item 4.', Icons.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          ListTile(
            leading: Icon(item1.icon),
            title: Text(item1.title),
            subtitle: Text(item1.subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item1),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(item2.icon),
            title: Text(item2.title),
            subtitle: Text(item2.subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item2),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(item3.icon),
            title: Text(item3.title),
            subtitle: Text(item3.subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item3),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(item4.icon),
            title: Text(item4.title),
            subtitle: Text(item4.subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item4),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}