// settings_page.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          // Appearance
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.color_lens),
              title: Text("Dark Mode"),
              trailing: Switch(value: false, onChanged: (val) {}),
            ),
          ),

          // Notifications
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
          ),

          // Language
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          // Help
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          // Logout Button
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Logout function
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text("Logout",style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}