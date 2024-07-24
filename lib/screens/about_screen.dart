import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/officer.jpg'), // Add a placeholder image in assets
            ),
            SizedBox(height: 10),
            Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Badge Number: 123456',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '“Safety and security don’t just happen; they are the result of collective consensus and public investment.”',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
