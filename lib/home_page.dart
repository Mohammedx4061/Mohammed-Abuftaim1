import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Store", style: TextStyle(fontSize: 26, color: Colors.white)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Top Games", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            Container(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  gameCard("Minecraft", "assets/images/minecraft.jpg"),
                  gameCard("Red Dead 2", "assets/images/rdr2.jpg"),
                  gameCard("GOW Ragnarök", "assets/images/gow.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gameCard(String title, String imagePath) {
    return Container(
      width: 260,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 180, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }
}