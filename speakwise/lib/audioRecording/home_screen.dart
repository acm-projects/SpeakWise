import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speakwise/constants/colors.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userInputTextEditingController =
      TextEditingController();
  final SpeechToText speechToTextInstance = SpeechToText();
  String recordedAudioString = "Today was a good day";
  bool isLoading = false;
  late Timer _timer;
  int _seconds = 300; // 5 minutes initially
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';
  late String _recorderTxt = '00:00:00';

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
    audioPlayer = AudioPlayer();
    audioRecord = Record();
  }

  @override
  void dispose() {
    _cancelTimer();
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  void initializeSpeechToText() async {
    print("Initialize speech to text");
    await speechToTextInstance.initialize();
    print("speech to text initialized");
    setState(() {});
  }

  void startListeningNow() async {
    FocusScope.of(context).unfocus();
    await speechToTextInstance.listen(onResult: onSpeechToTextResult);
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print("Error Start Recording: $e");
    }
    _startTimer();
    setState(() {});
  }

  void stopListeningNow() async {
    await speechToTextInstance.stop();
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
        print(path!);
      });
    } catch (e) {
      print('Error Stopped Recording: $e');
    }
    _cancelTimer();
    // Wait for 1 second to ensure recognition finishes processing
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // saveTextToFile(recordedAudioString); // Save the recorded text to file
    });
  }

  void onSpeechToTextResult(SpeechRecognitionResult recognitionResult) {
    print("Speech Result: ${recognitionResult.recognizedWords}");
    setState(() {
      recordedAudioString = recognitionResult.recognizedWords;
    });
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_seconds == 0) {
        stopListeningNow();
        _cancelTimer();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // Future<void> startRecording() async {
  //   try {
  //     if (await audioRecord.hasPermission()) {
  //       await audioRecord.start();
  //       setState(() {
  //         isRecording = true;
  //       });
  //     }
  //   } catch (e) {
  //     print("Error Start Recording: $e");
  //   }
  // }

  // Future<void> stopRecording() async {
  //   try {
  //     String? path = await audioRecord.stop();
  //     setState(() {
  //       isRecording = false;
  //       audioPath = path!;
  //       print(path!);
  //     });
  //   } catch (e) {
  //     print('Error Stopped Recording: $e');
  //   }
  // }

  Future<void> playRecording() async {
    try {
      if (audioPath.isNotEmpty) {
        await audioPlayer.play(UrlSource(audioPath));
        print(audioPath!);
      } else {
        print('Error: No audio file recorded.');
      }
    } catch (e) {
      print('Error playing recording: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: newBgColor,
      body: Stack(
        children: [
          const Positioned(
            left: -60,
            top: 150,
            child: CircleAvatar(
              backgroundColor: TSpurpleColor,
              radius: 120,
            ),
          ),
          Positioned(
            left: -5,
            top: 625,
            child: EmptyCircle(color: TextColor),
          ),
          Positioned(
            right: -100,
            top: 300,
            child: EmptyCircle(color: TextColor),
          ),
          const Positioned(
            right: -20,
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
                  SizedBox(height: 40),
                  Text(
                    '  SpeakWise.  ',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: TextColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: TextColor,
                      ),
                      child: Center(
                        child: Text(
                          _formatTime(_seconds),
                          style: TextStyle(fontSize: 20, color: BgShadedBlue),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  RoundedRectangle(width: 317, height: 510),
                ]),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 300),
                  // Display recorded text
                  if (recordedAudioString.isNotEmpty)
                    Container(
                      width: 317,
                      child: Text(
                        recordedAudioString,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  SizedBox(height: 275),
                  // Assistant icon
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {
                        speechToTextInstance.isListening
                            ? stopListeningNow()
                            : startListeningNow();
                      },
                      child: speechToTextInstance.isListening
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: LoadingAnimationWidget.beat(
                                size: 150,
                                color: speechToTextInstance.isListening
                                    ? Colors.deepPurple
                                    : isLoading
                                        ? Colors.deepPurple[75]!
                                        : Colors.deepPurple[37]!,
                              ),
                            )
                          : Image.asset(
                              "images/assistant_icon.png",
                              height: 150,
                              width: 150,
                            ),
                    ),
                  ),
                  SizedBox(height: 20), // Added space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //   onPressed: isRecording ? stopListeningNow : startListeningNow,
                      //   child: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
                      // ),
                      SizedBox(width: 20), // Added space
                      ElevatedButton(
                        onPressed: playRecording,
                        child: Text('Play Recording'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyCircle extends StatelessWidget {
  final Color color;
  EmptyCircle({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 10),
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
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    final radius = 90;
    final middle = Offset(size.width / 9, size.height / 20);
    canvas.drawCircle(middle, 90, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RoundedRectangle extends StatelessWidget {
  final double width;
  final double height;
  const RoundedRectangle({Key? key, required this.width, required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Adjust radius as needed
        color: BgShadedBlue,
      ),
    );
  }
}
