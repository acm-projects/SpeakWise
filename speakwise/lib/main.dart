import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
//screens
import 'package:speakwise/screens/loginOrCreateAccount_screen.dart';
import 'package:speakwise/screens/record_screen.dart';
import 'package:speakwise/screens/interviewQuestions.dart';
import 'package:speakwise/screens/interviewAnalysis.dart';
// Import your custom widgets or screens here if needed

void main() {
  runApp(const MaterialApp(
    //home: CreateAccountOrLogin(),
   // home: RecordPage(); 
   //home: InterviewQuestions(); 
   home: InterviewAnalysis();
  ));
}
