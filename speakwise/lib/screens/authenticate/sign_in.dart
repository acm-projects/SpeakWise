import 'package:flutter/material.dart';
import 'package:speakwise/services/auth.dart';

class SignIn extends StatefulWidget{
  const SignIn({super.key});


  @override
  // ignore: library_private_types_in_public_api
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
      title: const Text('Sign in to SpeakWise')
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: const Text('Sign in'),
          onPressed: () async{
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
            }
          },
      )
    )
    );
  }
}