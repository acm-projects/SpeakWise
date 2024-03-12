import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:speakwise/screens/StartUp_page.dart';
import 'package:speakwise/screens/createAccount/createAccountPage.dart';
import 'package:speakwise/screens/LoginPage/LoginPage.dart';
import 'package:speakwise/screens/homePage.dart';
import 'package:speakwise/constants/colors.dart';
import 'package:speakwise/screens/questionCard/QuestionPage.dart';

import 'package:speakwise/screens/Record_Screen.dart';
import 'package:speakwise/screens/InterviewAnalysisScreen.dart';
import 'package:speakwise/screens/LoginOrCreateAccount_screen.dart';
import 'package:speakwise/screens/InterviewQuestions_screen.dart';

import 'package:speakwise/screens/StartUp_page.dart';
import 'package:speakwise/screens/ProfilePage.dart';

void main() {
  runApp(const MyApp()); 
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: whitishBg));
  return MaterialApp( 
    debugShowCheckedModeBanner: false,
    //home: createAccount(), //change to createAccountPage
    home: StartUp(),
  );
  } 
}








