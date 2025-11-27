
import 'package:flutter/material.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_box,size: 70,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('Account',style: TextStyle(fontSize: 30,color: Colors.blue),)
        ],
      ),
    );
  }
}
