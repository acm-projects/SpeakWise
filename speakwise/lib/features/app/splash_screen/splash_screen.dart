import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),(){
      Navigator.pushNamedAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child!) as String, (route) => false);
    }
    );
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome to Flutter Firebase", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,)),
      ),
    );
  }
}