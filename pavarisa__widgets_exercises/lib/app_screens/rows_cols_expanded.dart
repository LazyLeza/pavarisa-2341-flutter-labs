import 'package:flutter/material.dart';

class WidgetsExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(top: 80, left: 23),
                      child: const Text(
                        'Pavarisa',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(top: 80, right: 23),
                      child: const Text(
                        '643040234-1',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Image.asset(
                  'images/pavarisa_img.jpg',
                  width: 400,
                  height: 400,
                )),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 25, left: 23),
                child: const Text(
                  'Photo Credit : Alinkar Lu',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
