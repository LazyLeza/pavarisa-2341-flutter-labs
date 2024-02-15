import 'package:flutter/material.dart';
import 'app_screens/interactiveQuestion.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isPortrait
          ? AppBar(
              title: const Text('Quiz App by 643040234-1'),
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InteractiveQuestion(
              question: 'What is this animal called?',
              image: const NetworkImage(
                  'https://images.squarespace-cdn.com/content/v1/53edc2b0e4b0472dbe760c43/1573655046592-OZDEHIVTDO6WFNMO9P15/manta+anatomy+Blue+Corner+Conservation'), // Replace with your image
              choices: const [
                'Whale Shark',
                'Manta Ray',
                'Puffer Fish',
                'Box Jellyfish',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
