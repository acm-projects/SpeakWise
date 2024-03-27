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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset("images/sound.png"),
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.purpleAccent.shade100,
            Colors.deepPurple,
          ])),
        ),
        title: Image.asset(
          "images/logo.png",
          width: 140,
        ),
        titleSpacing: 10,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              //image
              Center(
                child: InkWell(
                  onTap: () {
                    speechToTextInstance.isListening
                        ? stopListeningNow()
                        : startListeningNow();
                  },
                  child: speechToTextInstance.isListening
                      ? Center(
                          child: LoadingAnimationWidget.beat(
                            size: 300,
                            color: speechToTextInstance.isListening
                                ? Colors.deepPurple
                                : isLoading
                                    ? Colors.deepPurple[400]!
                                    : Colors.deepPurple[200]!,
                          ),
                        )
                      : Image.asset(
                          "images/assistant_icon.png",
                          height: 300,
                          width: 300,
                        ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Display recorded text
              if (recordedAudioString.isNotEmpty)
                Text(
                  recordedAudioString,
                  style: TextStyle(fontSize: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
