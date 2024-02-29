import 'package:flutter/material.dart';
import '../main_navigation_ex3.dart';

class RestartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
          child: Text('Restart'),
        ),
      ),
    );
  }
}
