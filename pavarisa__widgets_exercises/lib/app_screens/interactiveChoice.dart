import 'package:flutter/material.dart';

class InteractiveChoice extends StatefulWidget {
  final String choice;

  InteractiveChoice({required this.choice});

  @override
  _InteractiveChoiceState createState() => _InteractiveChoiceState();
}

class _InteractiveChoiceState extends State<InteractiveChoice> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = widget.choice == 'Manta Ray'
          ? Color.fromARGB(255, 0, 255, 60) // Green for Manta Ray
          : Color.fromARGB(255, 255, 0, 0); // Red for other choices
      textColor = const Color.fromARGB(255, 0, 0, 0);
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
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Your score is ${widget.choice == 'Manta Ray' ? 1 : 0}'),
          ),
        );
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
