import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // This is a comment for our project

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Changed Container to Scaffold
      appBar: AppBar(
        title: Text('SpeakWise'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'), // Fixed the Textfix typo
            onPressed: () async {
              // await _auth.signOut(); // Assuming _auth is defined somewhere
            },
          ),
        ],
      ),
      body: Center(
        child: Text('home'), // Added child to the body of Scaffold
      ),
    );
  }
}
