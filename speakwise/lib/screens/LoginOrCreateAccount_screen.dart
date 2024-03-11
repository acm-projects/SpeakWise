import 'package:flutter/material.dart';
import 'package:speakwise/constants/colors.dart';
 void main() {
  runApp(MaterialApp(
    theme: ThemeData(
     // primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: CreateAccountOrLogin(),
  ));
}
class CreateAccountOrLogin extends StatelessWidget {
  //const createAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: whitishBg,
      body: Stack (
         children: [
                const Positioned( //the first circle on the top right
                  right: -100,
                  top: -90,
                  child: CircleAvatar(
                    backgroundColor: tdBGcolor,
                    radius: 140,
                  ),
                ),
                const Positioned(
                  bottom: -100,
                  left: -130,
                  child: CircleAvatar(
                    backgroundColor: tdBGcolor,
                    radius: 290,
                  ),
                ),
              Positioned(
              bottom: 110,
              left: 110,
              child: EmptyCircle(color: pinkish),
            ),
            Positioned(
              bottom: 120,
              left: 90,
              child: EmptyCircle(color: darkBlueLogoColor),
            ),
                Positioned(
              top: 50,
              right: -180,
              child: EmptyCircleSmall(color: darkBlueLogoColor),
            ),
               Positioned(
              top: 60,
              right: -170,
              child: EmptyCircleSmall(color: pinkish),
            ),
            Center(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            //EmptyCircleSmall(color: pinkish),
            SizedBox(height: 280), //where to place the speakwise logo
            const Text(
              'SpeakWise.',
              style: TextStyle(
                fontFamily: 'Baloo Tammudu',
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Color.fromARGB(255, 5, 37, 63),
          ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
            onPressed: () {
              print('Create account button pressed');
            },
            child: Text('Create Account',
              style: TextStyle(color: Colors.white) ),
               style: ElevatedButton.styleFrom(
                backgroundColor: darkBlueLogoColor
               )
            ),
            SizedBox(height: 05),
            ElevatedButton(
            onPressed: () {
              print('Login account button pressed');
            },
            child: Text('Login',
              style: TextStyle(color: darkBlueLogoColor) ),
               style: ElevatedButton.styleFrom(
                backgroundColor: pinkish
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
class EmptyCircleSmall extends StatelessWidget{
  final Color color;
  EmptyCircleSmall({Key? key, required this.color}) : super(key: key);
@override
Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(275,10),
      painter: EmptyCirclePainter(color: color),
    );
  }
}
class EmptyCirclePainterSmall extends CustomPainter {
  final Color color;
  EmptyCirclePainterSmall({this.color = const Color.fromARGB(255, 249, 196, 173)});
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
class EmptyCircle extends StatelessWidget{
  final Color color;
  EmptyCircle({Key? key, required this.color}) : super(key: key);
@override
Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(570,10),
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