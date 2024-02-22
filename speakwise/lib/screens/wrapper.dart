import "package:flutter/material.dart";
import "package:speakwise/screens/authenticate/authenticate.dart";
import "package:speakwise/screens/home/home.dart";

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    //return either Home or Authenticate Widget 
    return Authenticate();
  }
}