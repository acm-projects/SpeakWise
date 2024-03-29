import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';
import 'package:speakwise/screens/LoginPage.dart';


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
  //TextEditingController  username_text = TextEditingController(); 
  TextEditingController password_text = TextEditingController();  
  //TextEditingController confirm_text = TextEditingController();  


  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        resizeToAvoidBottomInset: false,
      backgroundColor: newBgColor,
      /* appBar: AppBar( 
        backgroundColor: whitishBg,
        elevation: 0,
      ), */
      
      body: Stack ( 
         children: [

                  
                  Positioned( 
                    top: -60,
                    left: 230,
                    child: ClipRect(
                      child: Container( 
                        width: 150,
                        height: 250,    
                        decoration: BoxDecoration( 
                          color: newBgColor,
                          border: Border.all(
                            color: PurpleishColor,
                            width: 2.5,
                            ),
                          borderRadius: BorderRadius.circular(60),
              
                        ),                       
                      ),
                    ),                    
                  ),

                  Positioned( 
                    top: -80,
                    left: 270,
                    child: ClipRect(
                      child: Container( 
                        width: 150,
                        height: 250,    
                        decoration: BoxDecoration( 
                          color: TSpurpleColor,
                          borderRadius: BorderRadius.circular(60),
              
                        ),  
                      
                    ),
                    ),
                    
                  ),
                
            //bottom shapes
            Positioned( 
                    bottom: -60,
                    left: 40,
                    child: ClipRect(
                      child: Container( 
                        width: 140,
                        height: 250,    
                        decoration: BoxDecoration( 
                          color: newBgColor,
                          border: Border.all(
                            color: PurpleishColor,
                            width: 2.5,
                            ),
                          borderRadius: BorderRadius.circular(60),
              
                        ),                       
                      ),
                    ),                    
                  ),

                  Positioned( 
                    bottom: -60,
                    left: 20,
                    child: ClipRect(
                      child: Container( 
                        width: 130,
                        height: 210,    
                        decoration: BoxDecoration( 
                          color: TSpurpleColor,
                          borderRadius: BorderRadius.circular(50),
              
                        ),  
                      
                    ),
                    ),
                    
                  ),
                


            Center(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           /* SizedBox(height: 50),
            EmptyCircle(color: pinkish),       */        
            
                
            SizedBox(height: 190), //where to place the speakwise logo
            const Text(
              'Hello.         ',
              style: TextStyle(
            fontSize: 58.0,
            fontWeight: FontWeight.bold,
            
            letterSpacing: 2.0,
            color: TextColor,
          ),
            ),

            SizedBox(height: 10),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                      color: TextColor,
                      border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                      borderRadius: BorderRadius.circular(13),
                      ),
              
              child: Padding( 
                padding: const EdgeInsets.only(left: 20),
                child: TextField( 
              controller: name_text,
              /*style: TextStyle( 
                color: TextColor),*/
              decoration: InputDecoration( 
                hintText: 'Name',
                hintStyle: TextStyle(
                fontWeight: FontWeight.bold,

                 ), ),
             ),
              )
          
          ),
            ),

           SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration( 
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
                color: TextColor,
               ),
              
                child: Padding( 
                padding: const EdgeInsets.only(left: 20),
                child: TextField( 
              controller: email_text,
              /*style: TextStyle( 
                color: TextColor),*/
              decoration: InputDecoration( hintText: 'Email',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,

                 ), 
                 ),
             ),
              )
              
            ),
          ), 

          /*SizedBox(height: 10),
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
              controller: username_text,
              decoration: InputDecoration(hintText: 'Enter an Username'),
             ),
            ),
          ), */

         SizedBox(height: 10),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                      color: TextColor,
                      border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                      borderRadius: BorderRadius.circular(13),
                      ),
              
              child: Padding( 
                padding: const EdgeInsets.only(left: 20),
                child: TextField( 
              controller: password_text,
              /*style: TextStyle( 
                color: TextColor),*/
              decoration: InputDecoration( hintText: 'Enter a Password',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,

                 ), 
              ),
             ),
              )
          
          ),
            ),

          /* SizedBox(height: 10),
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
              controller: confirm_text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password'),
             ),
            ),
          ), */

            SizedBox(height: 30),
            ElevatedButton( 
              
            onPressed: () { 
              
              print('Create account button pressed');
              String name = name_text.text;
              String email = email_text.text;
              //String username = username_text.text;
              String password = password_text.text;
              //String Confirm_Password = confirm_text.text;

              print('Name: $name');
              print('Email: $email');
              //print('Username: $username');
              print('Password: $password');
             // print('Confirm Password: $Confirm_Password');
            },
            
            child: Text('Sign Up',
              style: TextStyle(
                color: newBgColor,
                fontWeight: FontWeight.w900,
                  ),
               ),
               style: ElevatedButton.styleFrom(
                backgroundColor: TSpurpleColor,
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide( 
                    color: Colors.white,
                    width: 2,
                   )
                )
                //borderRadius: BorderRadius.all(20),


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

/*
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
} */



