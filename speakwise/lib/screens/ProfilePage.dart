import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';

 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {

  @override


  Widget build(BuildContext context) {
    return  SafeArea( 
      child: Scaffold( 
        resizeToAvoidBottomInset: false,
      backgroundColor: newBgColor,
      

      body: Stack ( 
        
         children: [
           Positioned( 
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
              'Elle Woods',
              style: TextStyle(
              fontSize: 45.0,  
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
            ),
            
           
          ),
        
        Positioned( 
          top: 415,
          left: 0,
          right: 0,
          
            child: Center(child: ElevatedButton( 
              
              onPressed: ( ) { },
              style: ElevatedButton.styleFrom(
                backgroundColor: TextColor,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), 
                    ),
              ),
              child: Container( 
                width: 275,
                height: 50,
                color: TextColor,
                child: Center( 
                  child: Text( 
                    'Delete Account',
                    style: TextStyle(color: newBgColor),
                  ),
                ),
              ),
            ),  
             ),
             
        ),

        Positioned( 
          top: 350,
          left: 0,
          right: 0,
          
            child: Center(child: ElevatedButton( 
              
              onPressed: ( ) { },
              style: ElevatedButton.styleFrom(
                backgroundColor: TextColor,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), 
                    ),
              ),
              child: Container( 
                width: 275,
                height: 50,
                color: TextColor,
                child: Center( 
                  child: Text( 
                    'Edit Profile',
                    style: TextStyle(color: newBgColor),
                  ),
                ),
              ),
            ),  
             ),
             
        ),

          
         
            

            

          const Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[            
                
        

            SizedBox( height: 650), //where to place the speakwise logo
            Text(
              'SpeakWise. ',
              style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              
            letterSpacing: 2.0,
            color: TextColor,
            ),
          ),

          ]
           ),
        ), 
          


          ]
        )
      ),
    );
  }
}

