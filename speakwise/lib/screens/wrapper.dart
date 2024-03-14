import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:speakwise/models/usermodel.dart';
import 'package:speakwise/screens/authenticate/authenticate.dart';
import 'package:speakwise/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<UserTag>(context);
    
    //return either Home or Authenticate Widget 

  if (user == Null) {
    return Authenticate();
  } else {
    return Home();

  }

    
  }
}