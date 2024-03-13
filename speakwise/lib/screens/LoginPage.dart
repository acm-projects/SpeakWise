import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';


 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: LoginAccount(),
    
  ));
}

class LoginAccount extends StatelessWidget {
  //const createAccount({super.key});
  
  @override 
  TextEditingController email_T = TextEditingController(); 
  TextEditingController password_T = TextEditingController(); 
  

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
                    left: 20,
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
                    top: -80,
                    left: -20,
                    child: ClipRect(
                      child: Container( 
                        width: 140,
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
                    left: 250,
                    child: ClipRect(
                      child: Container( 
                        width: 130,
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
                    left: 220,
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
                
            SizedBox(height: 190), //where to place the speakwise logo
            const Text(
              '      Welcome',
              style: TextStyle(
            fontSize: 55.0,
            fontWeight: FontWeight.bold,
            
            letterSpacing: 2.0,
            color: TextColor,
          ),
            ),
             //SizedBox(height:0 ), 
            const Text(
              '            Back.',
              style: TextStyle(
                fontFamily: 'Baloo',
            fontSize: 55.0,
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
              controller: email_T,
              style: TextStyle( 
                color: TextColor,
                //fontSize: 17.0,
                ),
              decoration: InputDecoration(
                
                 hintText: 'Email'),
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
                      color: TextColor,
                      border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                      borderRadius: BorderRadius.circular(13),
                      ),
              
              child: Padding( 
                padding: const EdgeInsets.only(left: 20),
                child: TextField( 
              controller: password_T,
              decoration: InputDecoration( hintText: 'Password'),
             ),
              )
          
          ),
            ),
            


            SizedBox(height: 10),
            ElevatedButton( 
              
            onPressed: () { 
              
              print('Create account button pressed');
              String email = email_T.text;
              String password = password_T.text;
              

              print('UserName: $email');
              print('password: $password');
             
            },
            
            child: Text('Login',
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

