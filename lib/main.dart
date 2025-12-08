import 'package:flutter/material.dart';
import 'home_page.dart';
import 'games_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'cart_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final List<Widget> pages = [
    HomePage(),
    AllGamesPage(),
    SettingsPage(),
    ProfilePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          setState(() { index = i; }
          );
        },

        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}