import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';

 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    //debugShowCheckedModeBanner: false,
    home: RecordPage(),
  ));
}
class RecordPage extends StatelessWidget {
  //const createAccount({super.key});

  @override
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
                Positioned( //the first circle on the top left
                  left: -100,
                  top: -90,
                  child: CircleAvatar(
                    backgroundColor: tdBGcolor,
                    radius: 150,
                  ),
                ),
                Positioned(
                  bottom: -100,
                  right: -130,
                  child: CircleAvatar(
                    backgroundColor: tdBGcolor,
                    radius: 170,
                  ),
                ),
              Positioned(
              bottom: 50,
              right: -150,
              child: EmptyCircle(color: darkBlueLogoColor),
            ),
            Positioned(
              bottom: 80,
              right: -190,
              child: EmptyCircle(color: pinkish),
            ),
                Positioned(
              top: 90,
              left: 50,
              child: EmptyCircle(color: darkBlueLogoColor),
            ),
            Positioned(
              top: 80,
              left: 40,
              child: EmptyCircle(color: pinkish),
            ),
            Center(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            //EmptyCircle(color: pinkish),
            SizedBox(height: 160), //where to place the speakwise logo
            const Text(
              'Now Recording.',
              style: TextStyle(
                fontFamily: 'Baloo',
            fontSize: 58.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Color.fromARGB(255, 5, 37, 63),
          )
      ),
       ElevatedButton(
            onPressed: () {
              print('Create account button pressed');
            },
            child: Text('Begin Recording',
              style: TextStyle(color: Colors.white) ),
               style: ElevatedButton.styleFrom(
                backgroundColor: darkBlueLogoColor
               )
            ),
     ],
      )
       )
         ]
    )
    )
    ) ;
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