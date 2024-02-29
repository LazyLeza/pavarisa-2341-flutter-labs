import 'package:flutter/material.dart';
import 'question3_2.dart'; // Import your QuestionPage file

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
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
          ? AppBar(title: const Text('Quiz App by 643040234-1'))
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Question 1',
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
                'https://images.squarespace-cdn.com/content/v1/53edc2b0e4b0472dbe760c43/1573655046592-OZDEHIVTDO6WFNMO9P15/manta+anatomy+Blue+Corner+Conservation'),
            choices: const [
              'Whale Shark',
              'Manta Ray',
              'Puffer Fish',
              'Box Jellyfish',
            ],
            correctAnswerIndex: 1, // Index of the correct answer
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
          child: SizedBox(width: 70),
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
                  builder: (context) => QuizPage2(),
                ),
              ); // Navigate to the next page
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
                              builder: (context) => QuizPage2(),
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
                              builder: (context) => QuizPage2(),
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
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          setState(() {
            isSelected = true;
          });
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
          color: isSelected
              ? (widget.isCorrect
                  ? Color.fromARGB(255, 0, 255, 60) // Green for Manta Ray
                  : Color.fromARGB(255, 255, 0, 0)) // Red for other choices
              : (widget.choice == 'Whale Shark'
                  ? Color.fromARGB(255, 183, 138, 191)
                  : widget.choice == 'Manta Ray'
                      ? Color.fromARGB(255, 177, 182, 233)
                      : widget.choice == 'Puffer Fish'
                          ? Color.fromARGB(255, 215, 148, 171)
                          : Color.fromARGB(255, 231, 212, 170)),
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width / 2.5,
        height: 50,
        child: Center(
          child: Text(
            widget.choice,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
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
