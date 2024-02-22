// Import the QuestionPage file
import 'package:flutter/material.dart';
import 'app_screens/question_1.dart'; // Import your QuestionPage file

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Network image
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuaPSc14osicwF9zIp0yI0TJYvriTvyGcoHvQEM2l493sGT1tNGrYBGYBnq6fXqVMauk8&usqp=CAU',
                    width: 200, // Adjust as needed
                    height: 200, // Adjust as needed
                  ),
                  SizedBox(height: 20), // Spacer
                  // Welcome text
                  Text(
                    'Welcome to the Quiz App',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10), // Spacer
                  // Name text
                  Text(
                    'By Pavarisa Boonyaritchaikit, 643040234-1',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // Spacer
            // Start button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
