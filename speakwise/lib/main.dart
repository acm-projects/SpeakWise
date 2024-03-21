import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speakwise/audioRecording/home_screen.dart';
import 'package:speakwise/features/user_auth/presentation/pages/login_page.dart';
import 'package:speakwise/screens/InterviewAnalysisScreen.dart';
import 'package:speakwise/screens/LoginPage.dart';
import 'package:speakwise/screens/StartUp_page.dart';
import 'package:speakwise/screens/createAccount/createAccountPage.dart';
import 'package:speakwise/screens/home/home.dart';
import 'firebase_options.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpeakWise',
      home: LoginAccount(),
      
    );
  }
}
