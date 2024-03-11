// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Quiz App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final String titleImage = 'path/to/your/title_image.png'; // Replace with your image path
//   final String quizTitle = 'Welcome to the Quiz!';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(titleImage), // Display title image
//             Text(
//               quizTitle,
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => QuizScreen()),
//               ),
//               child: Text('Start Quiz'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Question {
//   final String question;
//   final String image;
//   final List<String> choices;
//   final int correctChoiceIndex;

//   Question(this.question, this.image, this.choices, this.correctChoiceIndex);
// }

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int currentQuestionIndex = 0;
//   int score = 0;
//   final List<Question> questions = [
//     Question(
//       'What is this animal called?',
//       'path/to/your/question1_image.png', // Replace with your image path
//       ['Whale Shark', 'Puffer Fish', 'Manta Ray', 'Box Jellyfish'],
//       0, // Index of the correct choice
//     ),
//     // Add similar Question objects for questions 2 and 3
//     Question(
//       'What is this animal called?',
//       'path/to/your/question2_image.png', // Replace with your image path
//       ['Choice 1 (Question 2)', 'Choice 2 (Question 2)', 'Choice 3 (Question 2)', 'Choice 4 (Question 2)'],
//       2, // Index of the correct choice
//     ),
//     Question(
//       'What is this animal called?',
//       'path/to/your/question3_image.png', // Replace with your image path
//       ['Choice 1 (Question 3)', 'Choice 2 (Question 3)', 'Choice 3 (Question 3)', 'Choice 4 (Question 3)'],
//       1, // Index of the correct choice
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     if (currentQuestionIndex == questions.length) {
//       return ResultPage(score: score);
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Question ${currentQuestionIndex + 1}'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(questions[currentQuestionIndex].question, style: TextStyle(fontSize: 20)),
//               SizedBox(height: 20),
//               Image.asset(questions[currentQuestionIndex].image),
//               SizedBox(height: 20),
//               ...buildChoices(questions[currentQuestionIndex].choices),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   if (currentQuestionIndex > 0)
//                     ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text('Previous'),
//                     ),
//                   ElevatedButton(
//                     onPressed: ()
