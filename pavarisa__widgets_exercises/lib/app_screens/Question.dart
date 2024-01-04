import 'package:flutter/material.dart';
import 'Choices.dart';

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
        SizedBox(height: 100),
        Image(image: image),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: choices
                  .sublist(0, 2)
                  .map((choice) => ChoiceWidget(choice: choice))
                  .toList(),
            ),
            SizedBox(width: 20),
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
