import 'package:flutter/material.dart';

import 'list.dart';

class DetailScreen extends StatelessWidget {
  final list item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 120),
            SizedBox(height: 40),
            Text(
              item.title,
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 38),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}