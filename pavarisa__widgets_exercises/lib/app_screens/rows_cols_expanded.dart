import 'package:flutter/material.dart';

class WidgetsExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // flex: 1,
        Row(
          children: [
            // flex: 1,
            Container(
              padding: const EdgeInsets.only(top: 80, left: 23, bottom: 20),
              child: const Text(
                'Pavarisa',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Athiti',
                  color: Colors.black,
                ),
              ),
            ),

            // flex: 2,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 80, right: 23, bottom: 20),
                child: const Text(
                  '643040234-1',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Athiti',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        // flex: 3,
        Image.asset(
          'images/pavarisa_img.jpg',
          width: 450,
          height: 450,
        ),

        Container(
          // decoration: const BoxDecoration(
          //   color: Colors.green,
          // ),
          padding: const EdgeInsets.only(top: 25, left: 23),
          child: const Text(
            'Photo Credit : Alinkar Lu',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Athiti',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
