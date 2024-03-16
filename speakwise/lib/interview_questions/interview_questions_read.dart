import 'dart:io';

Future<List<String>> readInterviewQuestions() async {
  List<String> questions = [];

  try {
    // Open the file
    final file = File('lib/interview_questions/sample_questions.dart');

    // Read the contents of the file
    List<String> lines = await file.readAsLines();

    // Add each line (question) to the list
    questions.addAll(lines);
  } catch (e) {
    print('Error reading interview questions: $e');
  }

  return questions;
}

void main() async {
  List<String> interviewQuestions = await readInterviewQuestions();
  
  // Print the questions
  interviewQuestions.forEach((question) {
    print(question);
  });
}
