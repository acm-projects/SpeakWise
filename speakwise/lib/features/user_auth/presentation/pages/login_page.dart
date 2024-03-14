import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speakwise/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:speakwise/features/user_auth/presentation/pages/home_page.dart';
import 'package:speakwise/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:speakwise/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:speakwise/global/common/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool _isSigning = false;
  
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  var _firebaseAuth;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: true,
              ),
              const SizedBox(height: 10,),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _signIn,
                child: _isSigning ? const CircularProgressIndicator(color: Colors.white,) : const Text("Login"),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _signInWithGoogle();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: const Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.google,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ], 
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    UserModel? user = (await _auth.signInWithEmailAndPassword(email, password)) as UserModel?;

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      print("User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      print("Error occurred");
    }
  }

  _signInWithGoogle() async {
    try {
      final GoogleSignInAuthentication googleSignInAuthentication = (await GoogleSignIn().signIn()) as GoogleSignInAuthentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      Navigator.pushNamed(context, "/home");
    } catch(e) {
      showToast(message: "some error occurred");
    }
  }
}
