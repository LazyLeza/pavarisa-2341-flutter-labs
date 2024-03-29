import 'package:flutter/material.dart';
import 'question3_1.dart'; // Import your QuestionPage file
import 'question3_3.dart';

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

class QuizPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isPortrait
          ? AppBar(title: const Text('Quiz App by 643040234-1'))
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Added centered text widget for question number
          SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Question 2',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          QuestionWidget(
            question: 'What is this animal called?',
            image: const NetworkImage(
                'https://www.dnr.sc.gov/marine/pub/seascience/images/horseshoecrab1.jpg'),
            choices: const [
              'Horshoe Crab',
              'Lobster',
              'Blue Crab',
              'Clam',
            ],
            correctAnswerIndex: 0, // Index of the correct answer
          ),
          SizedBox(height: 10),
          NavBar(),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(),
                ),
              ); // Navigate to question_2.dart
            },
            child: Text('Previous'),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back to the welcome page
            },
            child: Text('Home'),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage3(),
                ),
              ); // Navigate to question_2.dart
            },
            child: Text('Next'),
          ),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final ImageProvider<Object> image;
  final List<String> choices;
  final int correctAnswerIndex;

  QuestionWidget({
    required this.question,
    required this.image,
    required this.choices,
    required this.correctAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        Text(
          question,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isPortrait ? 50 : 0),
        Image(
            image: image,
            width: isPortrait ? double.infinity : null,
            height: isPortrait ? 200 : 200),
        SizedBox(height: isPortrait ? 50 : 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: choices
                  .sublist(0, 2)
                  .map((choice) => ChoiceWidget(
                        choice: choice,
                        isCorrect:
                            choices.indexOf(choice) == correctAnswerIndex,
                        onNextPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage3(),
                            ),
                          );
                        },
                      ))
                  .toList(),
            ),
            SizedBox(height: isPortrait ? 20 : 0),
            Column(
              children: choices
                  .sublist(2)
                  .map((choice) => ChoiceWidget(
                        choice: choice,
                        isCorrect:
                            choices.indexOf(choice) == correctAnswerIndex,
                        onNextPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage3(),
                            ),
                          );
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}

class ChoiceWidget extends StatefulWidget {
  final String choice;
  final bool isCorrect;
  final Function onNextPressed;

  ChoiceWidget({
    required this.choice,
    required this.isCorrect,
    required this.onNextPressed,
  });

  @override
  _ChoiceWidgetState createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = widget.isCorrect
          ? Color.fromARGB(255, 0, 255, 60) // Green for Manta Ray
          : Color.fromARGB(255, 255, 0, 0); // Red for other choices
      textColor = Colors.white;
    } else {
      backgroundColor = widget.choice == 'Horshoe Crab'
          ? Color.fromARGB(255, 183, 138, 191)
          : widget.choice == 'Lobster'
              ? Color.fromARGB(255, 177, 182, 233)
              : widget.choice == 'Blue Crab'
                  ? Color.fromARGB(255, 215, 148, 171)
                  : Color.fromARGB(255, 231, 212, 170);
      textColor = Colors.black;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
        });
        if (isSelected) {
          if (widget.isCorrect) {
            _showScorePopup(context, true);
          } else {
            _showScorePopup(context, false);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: isPortrait ? 150 : 300,
        height: 50,
        child: Center(
          child: Text(
            widget.choice,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _showScorePopup(BuildContext context, bool isCorrect) {
    String message =
        isCorrect ? "Congrats, you got 1 point!" : "Sorry, you missed it!";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Score!'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                widget.onNextPressed();
              },
              child: Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}
