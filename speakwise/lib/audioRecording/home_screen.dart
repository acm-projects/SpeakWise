import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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

  void initializeSpeechToText() async {
    print("Initialize speech to text");
    await speechToTextInstance.initialize();
    print("speech to text initialized");
    setState(() {});
  }

  void startListeningNow() async {
    FocusScope.of(context).unfocus();
    await speechToTextInstance.listen(onResult: onSpeechToTextResult);
    setState(() {});
  }

  void stopListeningNow() async {
    await speechToTextInstance.stop();
    setState(() {});

  }

  void onSpeechToTextResult(SpeechRecognitionResult recognitionResult) {
    print("Speech Result: ${recognitionResult.recognizedWords}");
    setState(() {
      recordedAudioString = recognitionResult.recognizedWords;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    //   floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.purple,
    //     onPressed: () {},
    //    
    //   ),
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(colors: [
      //       Colors.purpleAccent.shade100,
      //       Colors.deepPurple,
      //     ])),
      //   ),
      //   titleSpacing: 10,
      //   elevation: 2,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
               const SizedBox(
                height: 300,
              ),
              // Display recorded text
              if (recordedAudioString.isNotEmpty)
                Text(
                  recordedAudioString, 
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                ),
              const SizedBox(
                height: 275,
              ),
              //image
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
            ],
          ),
        ),
      ),
    );
  }
}
