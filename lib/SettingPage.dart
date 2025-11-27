import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings,size: 70,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('Setting',style: TextStyle(fontSize: 30,color: Colors.blue),)
        ],
      ),
    );
  }
}