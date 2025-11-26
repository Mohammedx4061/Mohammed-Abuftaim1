import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textfield Task',

      // تحديد الصفحة الرئيسية
      home: const TextFieldScreen(),
    );
  }
}

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();


  void _copyText() {
    setState(() {
      _controller2.text = _controller1.text;
    });
  }


  void _navigateToNextPage() {
    String dataToSend = _controller1.text;

    Navigator.push(
      context,
      MaterialPageRoute(

        builder: (context) => TwoPage(passedName: dataToSend),
      ),
    );
  }

  @override
  void dispose() {

    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),


            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: 'Enter the text here',
                hintText: 'For Example: mohammed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(height: 40),


            TextField(
              controller: _controller2,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Printed Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(height: 40),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _copyText,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _navigateToNextPage,
              child: const Text('Navigate'),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. الصفحة الثانية

class TwoPage extends StatelessWidget {

  final String passedName;


  const TwoPage({
    super.key,
    required this.passedName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Received Data Page'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Data Successfully received:',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 20),

                Text(
                  passedName,
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text('Back'),
                ),
              ],
            ),
            ),
        );
    }
}