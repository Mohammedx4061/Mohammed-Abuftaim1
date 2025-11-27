

import 'AccountPage.dart';
import 'Homepage.dart';
import 'Settingpage.dart';
import 'package:flutter/material.dart';

import 'Searchpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Indexpage(),
    ),
  );
}


class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  int _bottomNavbar=0;
  List<Widget>_pages=[
    Homepage(),
    Searchpage(),
    Settingpage(),
    Accountpage(),

  ];
  String _gettitle(int index){
    switch (index){
      case 0:
        return 'Home Page';
      case 1:
        return 'Search Page';
      case 2:
        return 'Setting Page';
      case 3:
        return 'Account Page';
      default :
        return 'data';
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(_gettitle(_bottomNavbar)),
        backgroundColor: Colors.blue,

      ),
      body: IndexedStack(
        index: _bottomNavbar,
        children:_pages ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavbar,
        onTap: (index){
          setState(() {
            _bottomNavbar=index;
          });
        },
        unselectedItemColor: Colors.blue[600],
        selectedItemColor: Colors.grey[800],
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'Setting', icon: Icon(Icons.settings)),
          BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.account_box)),
        ],
      ),
    );
  }
}