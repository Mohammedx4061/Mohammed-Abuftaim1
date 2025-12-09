import 'package:flutter/material.dart';

class AllGamesPage extends StatelessWidget {
  final List<Map<String, dynamic>> mainGames = [
    {"name": "Minecraft", "img": "assets/images/minecraft.jpg"},
    {"name": "Red Dead Redemption 2", "img": "assets/images/rdr2.jpg"},
    {"name": "God of War Ragnarök", "img": "assets/images/gow.jpg"},
  ];

  final List<Map<String, dynamic>> moreGames = [
    {"name": "Black Ops 3", "img": "assets/images/bo3.jpg"},
    {"name": "Little Big Planet 3", "img": "assets/images/lbp3.jpg"},
    {"name": "Uncharted 4", "img": "assets/images/uncharted.jpg"},
  ];

  Widget buildGameItem(Map<String, dynamic> game) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              game["img"],
              width: 140,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 16),

          Expanded(
            child: Text(
              game["name"],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "All Games",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),

      body: ListView(
        children: [
          // قسم الألعاب الرئيسية
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Top Games",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: mainGames.length,
            itemBuilder: (context, index) => buildGameItem(mainGames[index]),
          ),

          Divider(thickness: 2),

          // قسم ألعاب أخرى
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "More Games",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: moreGames.length,
            itemBuilder: (context, index) => buildGameItem(moreGames[index]),
          ),
        ],
      ),
    );
  }
}