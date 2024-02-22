import 'package:flutter/material.dart';
import 'app_screens/question_navigate_score.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuestionPage(),
      debugShowCheckedModeBanner: false, // to remove the debug banner
    );
  }
}
