import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';


 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: createAccount(),
    
  ));
}

class createAccount extends StatelessWidget {
  //const createAccount({super.key});
  
  @override 
  TextEditingController name_text = TextEditingController(); 
  TextEditingController email_text = TextEditingController(); 
  TextEditingController  username_text = TextEditingController(); 
  TextEditingController password_text = TextEditingController();  
  TextEditingController confirm_text = TextEditingController();  


  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        resizeToAvoidBottomInset: false,
      backgroundColor: whitishBg,
      /* appBar: AppBar( 
        backgroundColor: whitishBg,
        elevation: 0,
      ), */
      
      body: Stack ( 
         children: [
                const Positioned( //the first circle on the top left
                  left: -100,
                  top: -90,
                  child: CircleAvatar(
                    backgroundColor: tdBGcolor,
                    radius: 150,
                  
                  ),
                ),

                const Positioned(
                  bottom: -100,
                  right: -130,
                  child: CircleAvatar(
                    backgroundColor: pinkish,
                    radius: 170,
                  
                  ),
                ),

              Positioned( 
              bottom: 50, 
              right: -150,
              child: EmptyCircle(color: darkBlueLogoColor), 
            ),

            Positioned( 
              bottom: 100, 
              right: -200,
              child: EmptyCircle(color: tdBGcolor), 
            ),

                Positioned( 
              top: 70, 
              left: -40,
              child: EmptyCircle(color: darkBlueLogoColor), 
            ),


            Center(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            EmptyCircle(color: pinkish),               
            
                
            SizedBox(height: 120), //where to place the speakwise logo
            const Text(
              'SpeakWise.',
              style: TextStyle(
                fontFamily: 'Baloo',
            fontSize: 58.0,
            fontWeight: FontWeight.bold,
            
            letterSpacing: 2.0,
            color: Color.fromARGB(255, 5, 37, 63),
          ),
            ),

            SizedBox(height: 15),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                      borderRadius: BorderRadius.circular(13),
                      ),
              
              child: TextField( 
              controller: name_text,
              decoration: InputDecoration( hintText: 'Name'),
              ),
             
          
          ),
            ),
            
          SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration( 
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
               ),
              
              child: TextField( 
            controller: email_text,
            decoration: InputDecoration(hintText: 'Email'),
             ),
            ),
          ),

          SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration( 
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
               ),
              
              child: TextField( 
              controller: username_text,
              decoration: InputDecoration(hintText: 'Enter an Username'),
             ),
            ),
          ),

         SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration( 
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
               ),
              
              child: TextField( 
            controller: password_text,
            obscureText: true,
            decoration: InputDecoration(hintText: 'Enter a Password'),
             ),
            ),
          ),
/////////////////////////////////
////////////////////////////////
          SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration( 
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                  borderRadius: BorderRadius.circular(13),
              ),
              
            child: TextField( 
              controller: confirm_text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password'),
             ),
            ),
          ),

            SizedBox(height: 10),
            ElevatedButton( 
              
            onPressed: () { 
              
              print('Create account button pressed');
              String name = name_text.text;
              String email = email_text.text;
              String username = username_text.text;
              String password = password_text.text;
              String Confirm_Password = confirm_text.text;

              print('Name: $name');
              print('Email: $email');
              print('Username: $username');
              print('Password: $password');
              print('Confirm Password: $Confirm_Password');
            },
            
            child: Text('Create Account',
              style: TextStyle(color: Colors.white) ),
               style: ElevatedButton.styleFrom(
                backgroundColor: darkBlueLogoColor 

               )
               
        
            ), 
          ],
          
        ),

        
         
       
      ),
              ],
        
      )
       


       )
    
    
    );
    

    
  } 



} 


class EmptyCircle extends StatelessWidget{ 
  final Color color;
  EmptyCircle({Key? key, required this.color}) : super(key: key);
@override
Widget build(BuildContext context) { 
    return CustomPaint( 
      size: Size(275,10),
      painter: EmptyCirclePainter(color: color),
    );
  }
}

class EmptyCirclePainter extends CustomPainter {
  final Color color;
  EmptyCirclePainter({this.color = const Color.fromARGB(255, 249, 196, 173)});
    
  @override 
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke..strokeWidth = 3.0;

    final radius = size.width / 2.0;
    final middle = Offset(size.width / 9, size.height / 20);

    canvas.drawCircle(middle, radius , paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // TODO: implement shouldRepaint
  }
}



