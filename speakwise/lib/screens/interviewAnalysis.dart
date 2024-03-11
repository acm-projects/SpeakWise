import 'package:flutter/material.dart';
const Color tdBGcolor = Color.fromARGB(255, 129, 185, 238);
const Color pinkish = Color.fromARGB(255,249,194,170); 
const Color whitishBg = Color.fromARGB(255, 239, 237, 231);
const Color darkBlueLogoColor = Color.fromARGB(255, 7, 39, 101);


 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: InterviewAnalysis(),
    
  ));
}

class InterviewAnalysis extends StatelessWidget {
  //const createAccount({super.key});
  
  @override 

  

  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        resizeToAvoidBottomInset: false,
      backgroundColor: pinkish,
      /* appBar: AppBar( 
        backgroundColor: whitishBg,
        elevation: 0,
      ), */
      
      body: Stack ( 
         children: [
                
              Positioned( 
              bottom: 50, 
              right: -150,
              child: EmptyCircle(color: darkBlueLogoColor), 
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
            //EmptyCircle(color: pinkish),               
            
                
            SizedBox(height: 10), //where to place the speakwise logo
            const Text(
              'Interview Analysis',
              style: TextStyle(
                fontFamily: 'Baloo',
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            
            letterSpacing: 2.0,
            color: Color.fromARGB(255, 5, 37, 63),
          ),
            ),
         
          SizedBox(height: 50),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration( 
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
               ),
              
                width: 300, 
              height: 100,
            ),
          ),
           SizedBox(height: 50),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration( 
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
               ),
              width: 300, 
              height: 100,
              
            ),
          ),


 SizedBox(height: 50),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),              //width: 300,
              child: Container( 
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration( 
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 5, 37, 63)),
                borderRadius: BorderRadius.circular(13),
               ),
              
              width: 300, 
              height: 100,
            ),
          ),
           SizedBox(height: 25),
            ElevatedButton( 
              
            onPressed: () { 

              print('Finish button pressed');
            },
            child: Text('Finish ',
              style: TextStyle(color: pinkish) ),
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