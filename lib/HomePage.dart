import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home,size: 70,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('Home',style: TextStyle(fontSize: 30,color: Colors.blue),)
        ],
      ),
    );
  }
}