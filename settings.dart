import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your settings options/widgets here
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Implement action for Option 1
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Implement action for Option 2
              },
            ),
            // Add more settings options as needed
          ],
        ),
      ),
    );
  }
}