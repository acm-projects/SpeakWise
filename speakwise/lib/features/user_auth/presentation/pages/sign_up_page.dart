import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speakwise/features/user_auth/presentation/pages/login_page.dart';
import 'package:speakwise/features/user_auth/presentation/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
        MainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
            ),
            FormContainerWidget(
              hintText: "Username",
              isPasswordField: false,
            ),

            SizedBox(height: 10,),

            FormContainerWidget(
              hintText: "Email",
              isPasswordField: false,
            ),

            SizedBox(height: 10,),
            
            FormContainerWidget(
              hintText: "Password",
              isPasswordField: false,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
                child: const Center(child: Text("Sign Up",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)

            )
            )
            const SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },

              child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
        ],
      )

    ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}