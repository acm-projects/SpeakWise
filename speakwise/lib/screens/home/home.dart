import 'package:flutter/material.dart';
import 'package:flutter/services/auth.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  // This is a comment for our project
 
  @override
  Widget build(BuildContext context) {
    return Container(
      appBar: AppBar(
        title: Text('SpeakWise'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0;
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async { 
                await _auth.signOut(); 
            },
          )
        ]
      child: Text('home'),
    ),
    );
  }
}