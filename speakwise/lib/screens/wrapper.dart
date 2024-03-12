import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:speakwise/models/user.dart";
import "package:speakwise/screens/authenticate/authenticate.dart";
import "package:speakwise/screens/home/home.dart";
import 'package:speakwise/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    //return either Home or Authenticate Widget 

  if (user == null) {
    return Authenticate();
  } else {
    return Home();

  }

    
  }
}