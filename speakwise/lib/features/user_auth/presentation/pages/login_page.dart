import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speakwise/features/user_auth/presentation/pages/home_page.dart';
import 'package:speakwise/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:speakwise/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:speakwise/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
            ),
            const FormContainerWidget(
              hintText: "Email",
              isPasswordField: true,
            ),

            SizedBox(height: 10,),
            const FormContainerWidget(
              hintText: "Password",
              isPasswordField: true,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 5,
                  ),

            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },

              child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
                child: const Center(child: Text("Login",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)

            )
            )
        ],
      )

    ),
    );
  }
}