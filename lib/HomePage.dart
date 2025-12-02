import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',

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


  @override
  void dispose() {

    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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



          ],
        ),
      ),
    );
  }
}
