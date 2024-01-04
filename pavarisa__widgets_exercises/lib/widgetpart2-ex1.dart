import 'package:flutter/material.dart';
import 'app_screens/Question.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App by 643040234-1'),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QuestionWidget(
            question: 'What is this animal called?',

            image: NetworkImage(
                'https://images.squarespace-cdn.com/content/v1/53edc2b0e4b0472dbe760c43/1573655046592-OZDEHIVTDO6WFNMO9P15/manta+anatomy+Blue+Corner+Conservation'), // Replace with your image
            choices: [
              'Whale Shark',
              'Manta Ray',
              'Puffer Fish',
              'Box Jellyfish',
            ],
          ),
        ],
      ),
    );
  }
}
