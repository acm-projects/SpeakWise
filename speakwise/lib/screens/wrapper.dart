import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:speakwiseproject/models/usermodel.dart';
import "package:speakwiseproject/screens/authenticate/authenticate.dart";
import "package:speakwiseproject/screens/home/home.dart";

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