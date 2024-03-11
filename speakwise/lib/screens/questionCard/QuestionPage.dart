import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';


 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: QuestionPage(),
    
    
  ));
}

class QuestionPage extends StatelessWidget {
  @override 

  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 

        resizeToAvoidBottomInset: false,
        backgroundColor: pinkish,
body: Stack ( 
         children: [
          Center(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
         SizedBox(height: 600),
            ElevatedButton( 
              
            onPressed: () { 
              print('button clicked');
            },
            
            child: Text('Start Recording',
              style: TextStyle(color: Colors.white) ),
               style: ElevatedButton.styleFrom(
                backgroundColor: darkBlueLogoColor 

               )
               
        
            ), 
          ]
           )
          )
         ]
)

      ),
    );
  }

}