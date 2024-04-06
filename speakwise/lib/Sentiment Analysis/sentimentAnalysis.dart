import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SentimentAnalysisPage extends StatefulWidget {
  final String recordedAudioString;

  const SentimentAnalysisPage({Key? key, required this.recordedAudioString}) : super(key: key);

  @override
  _SentimentAnalysisPageState createState() => _SentimentAnalysisPageState();
}

class _SentimentAnalysisPageState extends State<SentimentAnalysisPage> {
  String _sentimentResult = '';

  @override
  void initState() {
    super.initState();
    analyzeSentiment(widget.recordedAudioString);
  }

  Future<void> analyzeSentiment(String customString) async {
    final String apiKey = '6c5d915cafmshebf12be9e5396a3p154851jsnb388afc01f6b';
    final String endpoint = 'https://sentiment-analysis9.p.rapidapi.com/sentiment';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Rapidapi-Key': apiKey,
      'X-Rapidapi-Host': 'sentiment-analysis9.p.rapidapi.com',
    };

    final List<Map<String, dynamic>> data = [
      {
        "id": "1",
        "language": "en",
        "text": customString,
      }
    ];

    try {
      final response = await http.post(Uri.parse(endpoint), headers: headers, body: jsonEncode(data));

      if (response.statusCode == 200) {
        print(response.body); 
        List<dynamic> results = jsonDecode(response.body);
        if (results.isNotEmpty) {
          Map<String, dynamic> prediction = results[0];
          List<dynamic> predictions = prediction['predictions'];
          Map<String, dynamic> firstPrediction = predictions[0];
          String predictionValue = firstPrediction['prediction'];
          setState(() {
            _sentimentResult = predictionValue;
          });
        }
      } else {
        setState(() {
          _sentimentResult = 'Failed to analyze sentiment.';
        });
      }
    } catch (error) {
      setState(() {
        _sentimentResult = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentiment Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sentiment Result: $_sentimentResult',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
