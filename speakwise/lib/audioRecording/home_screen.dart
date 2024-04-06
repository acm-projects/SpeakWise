import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speakwise/constants/colors.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:speakwise/Sentiment Analysis/sentimentAnalysis.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userInputTextEditingController =
      TextEditingController();
  final SpeechToText speechToTextInstance = SpeechToText();
  String recordedAudioString = "";
  bool isLoading = false;
  late Timer _timer;
  int _seconds = 300; // 5 minutes initially
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  int _wordCount = 0;
  int _fillerWordCount = 0; // Filler word count
  String audioPath = '';

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
        _calculateWPM();
      });
    } catch (e) {
      print('Error Stopped Recording: $e');
    }
    _cancelTimer();
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // saveTextToFile(recordedAudioString); // Save the recorded text to file
    });
  }

  void onSpeechToTextResult(SpeechRecognitionResult recognitionResult) {
    print("Speech Result: ${recognitionResult.recognizedWords}");
    setState(() {
      recordedAudioString = recognitionResult.recognizedWords;
      _wordCount = recordedAudioString.split(' ').length;
      _calculateFillerWordCount();
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

  void _calculateWPM() {
    double durationInMinutes = (300 - _seconds) / 60;
    double wordsPerMinute = _wordCount / durationInMinutes;
    int roundedWPM = wordsPerMinute.round(); // Round to the nearest integer
    print('Words per minute: $roundedWPM');
  }

  void _calculateFillerWordCount() {
    List<String> fillerWords = ["umm", "like", "uhh"]; // List of filler words
    int count = 0;
    for (String word in fillerWords) {
      count += RegExp(r'\b' + word + r'\b')
          .allMatches(recordedAudioString)
          .length;
    }
    setState(() {
      _fillerWordCount = count;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Future<void> playRecording() async {
    try {
      if (audioPath.isNotEmpty) {
        await audioPlayer.play(UrlSource(audioPath));
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
              ],
            ),
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
                                color: Colors.deepPurple,
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
                      ElevatedButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SentimentAnalysisPage(recordedAudioString: recordedAudioString),),);
                        },
                      child: Text('Analyze Sentiment'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Words per minute: ${(_wordCount / ((300 - _seconds) / 60)).toStringAsFixed(0)}'),
                  SizedBox(height: 10),
                  Text('Filler word count: $_fillerWordCount'), // Display filler word count
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

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
