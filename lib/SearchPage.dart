import 'package:flutter/material.dart';

import 'list.dart';

class Searchpage extends StatelessWidget {

  final list item1 = list('Item 1', 'This is a description for item 1.', Icons.home);
  final list item2 = list('Item 2', 'This is a description for item 2.', Icons.star);
  final list item3 = list('Item 3', 'This is a description for item 3.', Icons.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          ListTile(
            leading: Icon(item1.icon),
            title: Text(item1.title),
            subtitle: Text(item1.subtitle),
          ),
          ListTile(
            leading: Icon(item2.icon),
            title: Text(item2.title),
            subtitle: Text(item2.subtitle),

          ),
          ListTile(
            leading: Icon(item3.icon),
            title: Text(item3.title),
            subtitle: Text(item3.subtitle),
          ),
        ],
      ),
    );
  }
}