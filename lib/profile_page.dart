import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _State();
}

class _State extends State<ProfilePage> {

  int i=0;
  bool s = true;
  bool g = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile", style: TextStyle(color: Colors.white, fontSize: 26)),
      ),



      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            color: Colors.grey[500],

            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),

                SizedBox(height: 16),

                Text("Mohammed", style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                ),

                SizedBox(height: 8),

                Text("mohammed.2000@gmail.com", style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.red,
                width: 4,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Phone Number:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("_____"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gender:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                MaterialButton(onPressed: (){
                  setState(() {
                    g == true ? g = false : g = true;
                  });
                }, color: Colors.black, height: 30, minWidth: 50,
                  child: Text("Change", style: TextStyle(color: Colors.white),),),
                g == true ? Text("Male", style: TextStyle(fontSize: 20),) : Text("Female", style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
// يمكنك إضافة إعدادات أخرى تحت لو تبغى
        ],
      ),
    );
  }
}


