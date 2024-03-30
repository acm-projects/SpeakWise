import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentiment Analysis Test',
      home: SentimentAnalysisScreen(),
    );
  }
}

class SentimentAnalysisScreen extends StatefulWidget {
  @override
  _SentimentAnalysisScreenState createState() => _SentimentAnalysisScreenState();
}

class _SentimentAnalysisScreenState extends State<SentimentAnalysisScreen> {
  String sentiment = "";

  @override
  void initState() {
    super.initState();
    analyzeSentiment("I love ACM"); // Analyze the sentiment directly when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentiment Analysis Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                analyzeSentiment("I hate ACM"); // Analyze the sentiment of "I love ACM" when the button is pressed
              },
              child: Text('Analyze Sentiment'),
            ),
            SizedBox(height: 20),
            Text(
              'Sentiment: $sentiment',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> analyzeSentiment(String text) async {
    String url = 'https://sentiment-analysis9.p.rapidapi.com/sentiment';
    String apiKey = '6c5d915cafmshebf12be9e5396a3p154851jsnb388afc01f6b';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Rapidapi-Key': apiKey,
      'X-Rapidapi-Host': 'sentiment-analysis9.p.rapidapi.com',
    };

    List<Map<String, dynamic>> data = [
      {
        "id": "1",
        "language": "en",
        "text": text,
      }
    ];

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final sentimentData = responseData is List ? responseData.first : null;
        print(sentimentData);
        print(responseData);
        setState(() {
          sentiment = sentimentData;
        });
      } else {
        setState(() {
          sentiment = 'Failed to analyze sentiment';
        });
      }
    } catch (error) {
      setState(() {
        sentiment = 'Error: $error';
      });
    }
  }
}
