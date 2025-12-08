import 'package:flutter/material.dart';
import 'games_page.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Cart", style: TextStyle(fontSize: 26, color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // ------------------------------
            //  عنصر اللعبة في السلة
            // ------------------------------
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/minecraft.jpg",
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 16),

                  // الاسم والسعر
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minecraft",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "\$99",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // ------------------------------
            // زر العودة للرئيسية
            // ------------------------------
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),

              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => AllGamesPage()),
                );
                    },

              child: Text(
                "Add More",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}