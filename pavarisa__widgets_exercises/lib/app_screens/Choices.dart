import 'package:flutter/material.dart';

class ChoiceWidget extends StatelessWidget {
  final String choice;

  ChoiceWidget({required this.choice});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    // Assign colors based on choice for better contrast
    if (choice == 'Whale Shark') {
      backgroundColor = const Color.fromARGB(255, 183, 138, 191);
      textColor = const Color.fromARGB(255, 0, 0, 0);
    } else if (choice == 'Manta Ray') {
      backgroundColor = Color.fromARGB(255, 177, 182, 233);
      textColor = Colors.black;
    } else if (choice == 'Puffer Fish') {
      backgroundColor = const Color.fromARGB(255, 215, 148, 171);
      textColor = const Color.fromARGB(255, 0, 0, 0);
    } else {
      backgroundColor = Color.fromARGB(255, 231, 212, 170);
      textColor = Colors.black;
    }

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 150, // Adjust the width as needed
        height: 50, // Adjust the height as needed
        child: Center(
          child: Text(
            choice,
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
