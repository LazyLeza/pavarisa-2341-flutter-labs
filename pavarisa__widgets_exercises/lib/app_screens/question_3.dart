import 'package:flutter/material.dart';
import '/app_screens/question_2.dart'; // Import your QuestionPage file

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuizPage3(),
      ),
    );
  }
}

class QuizPage3 extends StatelessWidget {
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
              'Question 3',
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
                'https://i.pinimg.com/736x/a3/05/13/a305137f511090e593a09694d11edac0.jpg'),
            choices: const [
              'Seahorse',
              'Sea Urchin',
              'Shrimp',
              'Star Fish',
            ],
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
                  builder: (context) => QuizPage2(),
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
          child: SizedBox(width: 70),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final ImageProvider<Object> image;
  final List<String> choices;

  QuestionWidget({
    required this.question,
    required this.image,
    required this.choices,
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
                  .map((choice) => ChoiceWidget(choice: choice))
                  .toList(),
            ),
            SizedBox(height: isPortrait ? 20 : 0),
            Column(
              children: choices
                  .sublist(2)
                  .map((choice) => ChoiceWidget(choice: choice))
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

  ChoiceWidget({required this.choice});

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
      backgroundColor = widget.choice == 'Star Fish'
          ? Color.fromARGB(255, 0, 255, 60) // Green for Manta Ray
          : Color.fromARGB(255, 255, 0, 0); // Red for other choices
      textColor = Colors.white;
    } else {
      backgroundColor = widget.choice == 'Seahorse'
          ? Color.fromARGB(255, 183, 138, 191)
          : widget.choice == 'Sea Urchin'
              ? Color.fromARGB(255, 177, 182, 233)
              : widget.choice == 'Shrimp'
                  ? Color.fromARGB(255, 215, 148, 171)
                  : Color.fromARGB(255, 231, 212, 170);
      textColor = Colors.black;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
        });
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
}
