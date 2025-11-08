
import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('تكليف الفلاتر', style: TextStyle(color: Colors.black),),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xFF2226D1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: Image.asset(
                        'image/imageflatter.png',
                      ).image,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mohammed Abuftaim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Divider(color: Colors.black),
                  Text(
                    'IT Student',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 17),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 40,
              color: Color(0xFF2B46FF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Email',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Text('muhammed.04@email.com',
                      style: TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 40,
              color: Color(0xFF0E255A),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Phone :',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Text('738154451',
                      style: TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 220,
              color: Color(0xFF031D9E),
              child: Column(
                children: [
                  Text('Skils :',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  Row(
                    children: [
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Scientific :',
                              style:
                              TextStyle(fontSize: 20, color: Colors.white)),
                          SizedBox(height: 12),
                          Text('1- Software Design ',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          Text('2- Database Design ',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          Text('3- Problem Solving ',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Practicl :',
                              style:
                              TextStyle(fontSize: 20, color: Colors.white)),
                          SizedBox(height: 12),
                          Text('1- Firebase / Supabase ',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          Text('2- Responsive Design ',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          Text('3- Deployment (Play Store / App Store) ',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ],
                      ),
                      Spacer()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}