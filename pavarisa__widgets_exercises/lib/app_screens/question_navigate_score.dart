import 'package:flutter/material.dart';
import 'navigated_result.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App by 643040234-1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20),
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
          ),
          SizedBox(height: 10),
        ],
      ),
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
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = isCorrect
          ? Color.fromARGB(255, 0, 255, 60) // Green for correct answer
          : Color.fromARGB(255, 255, 0, 0); // Red for wrong answer
      textColor = Colors.white;
    } else {
      backgroundColor = widget.choice == 'Whale Shark'
          ? Color.fromARGB(255, 183, 138, 191)
          : widget.choice == 'Manta Ray'
              ? Color.fromARGB(255, 177, 182, 233)
              : widget.choice == 'Puffer Fish'
                  ? Color.fromARGB(255, 215, 148, 171)
                  : Color.fromARGB(255, 231, 212, 170);
      textColor = Colors.black;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
          // Check if the selected choice is correct
          isCorrect = widget.choice == 'Manta Ray';
          // Navigate to another page based on the choice
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                score: isCorrect ? 1 : 0,
              ),
            ),
          );
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
