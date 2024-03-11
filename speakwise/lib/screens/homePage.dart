import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:speakwise/constants/colors.dart';

 void main() {
  runApp(
    const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homePage(),
    
  ));
}

class homePage extends StatelessWidget {
  const homePage({super.key});
  
  @override 
    
  Widget build(BuildContext context){ 
    TextEditingController newInterview = TextEditingController(); 
    return SafeArea( 
      child: Scaffold( 
        resizeToAvoidBottomInset: false,
      backgroundColor: tdBGcolor,
      
        body: Stack( 
          
          children: [ 
            //stacked_bar_chart, home, 
            
            
            SizedBox(height: 10),
            Padding( 
              padding: const EdgeInsets.only(top: 1.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      width: 400,
                      height: 250,
                      decoration: BoxDecoration(
                      color: pinkish,
                      border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                      borderRadius: BorderRadius.circular(20),
                      ),
                      
            ),
          ),
      
      /* Center(
      child: Padding( 
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton( 
          onPressed: () { 
            print('clicked start new interview');
          },
          style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white 
                 ), 
          child: Text( 'hello', style: TextStyle(color: Colors.blue),),
        
        )
        
          
          ), 
    ), */

          Positioned(
            top:160, 
            left: MediaQuery.of(context).size.width / 2 - 180,
             child: Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 5, 37, 63),
            ),
          ),
          ), //where to place the speakwise logo
        
     //Sizedbox(height: 300),
     Center (
      child: Padding( 
              padding: //const EdgeInsets.only(top: 100),
              
              const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                      color: darkBlueLogoColor,
                      border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                      borderRadius: BorderRadius.circular(15),
                      ),
                      
            ),
          ),
          
     ),
     Positioned(
            top:300, 
            left: MediaQuery.of(context).size.width / 2 - 180,
             child: Text(
              'Daily Goal ',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 2.0,
              color: Colors.white,
          ),
          ), 
     ),

    

      Center (
        
        child: Padding( 
              padding: const EdgeInsets.only(top: 350),
              child: ElevatedButton( 
          onPressed: () { 
            print('clicked start new interview');
          },
          style: ElevatedButton.styleFrom(
                backgroundColor: darkBlueLogoColor 
                 ), 
          child: Text( 'Start New Interview', style: TextStyle(color: Colors.green),),
        
        )
        
          
          ), 
          
      ),
      Positioned( //this is for home icon
      top:700,
      left: 50,
      child: IconButton(
        icon: Icon(Icons.house,
        size: 50,
        color: Colors.white,),
        onPressed: () {
          print('icon home pressed');

        },
        
      ),
      ),

      Positioned( //this is for analysis icon
      top:700,
      left: 160,
      child: IconButton(
        icon: Icon(Icons.stacked_bar_chart,
        size: 50,
        color: Colors.white,),
        onPressed: () {
          print('icon bar stack pressed');
          },   
       ),
      ),

      Positioned( //this is for analysis icon
      top:700,
      left: 270,
      child: IconButton(
        icon: Icon(Icons.circle,
        size: 50,
        color: Colors.white,),
        onPressed: () {
          print('icon circle pressed');
          },   
       ),
      ),

      

      
        ]
      )
    )
    );
  }

  

} 
