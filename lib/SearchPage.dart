import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search,size: 70,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('Search',style: TextStyle(fontSize: 30,color: Colors.blue),)
        ],
      ),
    );
  }
}