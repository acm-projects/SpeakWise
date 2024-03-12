import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';

 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: StartUp(),
  ));
}

class StartUp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        resizeToAvoidBottomInset: false,
      backgroundColor: newBgColor,

      body: Stack ( 
         children: [
                const Positioned( //the first circle on the top left
                  left: -5,
                  top: 70,
                  child: CircleAvatar(
                    backgroundColor: TSpurpleColor,
                    radius: 30,
                  
                  ),
                ),

                const Positioned( //the second circle on the top right
                  left: 280,
                  top: 150,
                  child: CircleAvatar(
                    backgroundColor: BgShadedBlue,
                    radius: 45,
                  
                  ),
                ),

                Positioned( 
                left: -10,
                top: 400,
                child: EmptyCircle(color: pinkish),
                ),

                const Positioned( //the third circle on the middle left
                  left: 35,
                  top: 350,
                  child: CircleAvatar(
                    backgroundColor: BgShadedBlue,
                    radius: 100,
                  
                  ),
                ),

                const Positioned( //the first circle on the top left
                  right: -50,
                  bottom: -50,
                  child: CircleAvatar(
                    backgroundColor: TSpurpleColor,
                    radius: 100,
                  
                  ),
                ),
                

                Center(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
                           
            
                
            SizedBox( height: 150), //where to place the speakwise logo
            Text(
              'SpeakWise.  ',
              style: TextStyle(
              fontSize: 55.0,
              fontWeight: FontWeight.bold,
              
            letterSpacing: 2.0,
            color: TextColor,
            ),
          ),

           Text(
              'Ace your Interviews Effortlessly.',
              style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              
            letterSpacing: 2.0,
            color: TextColor,
            ),
          ),

         // SizedBox(height: 250),
           
                

          ]
           ),
        ),
          


          ]
        )
      ),
    );
  }
}

class EmptyCircle extends StatelessWidget{
  final Color color;
  EmptyCircle({Key? key, required this.color}) : super(key: key);
@override
Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150,10),
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