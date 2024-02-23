import 'package:flutter/material.dart';
import 'package:speakwise/services/auth.dart';
class SignIn extends StatefulWidget{

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
      backgroundColor: Colors.orange[400],
      elevation: 0.0,
    

      )
    );
  }
}