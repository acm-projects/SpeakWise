import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This is a comment for our project

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Changed Container to Scaffold
      appBar: AppBar(
        title: const Text('SpeakWise'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('logout'), // Fixed the Textfix typo
            onPressed: () async {
              // await _auth.signOut(); // Assuming _auth is defined somewhere
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('home'), // Added child to the body of Scaffold
      ),
    );
  }
}
