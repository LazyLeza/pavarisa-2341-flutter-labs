// Import the QuestionPage file
import 'package:flutter/material.dart';
import 'app_screens/question1_1.dart'; // Import your QuestionPage file

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}
