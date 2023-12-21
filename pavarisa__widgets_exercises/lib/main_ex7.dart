import 'package:flutter/material.dart';
// import 'app_screens/rows_cols_expanded.dart';
import 'app_screens/submit_button.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom Fonts Exercise',
        // home: ElevatedButtonDemo(),
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 140, 159, 115),
          body: Center(
            child: ElevatedButtonDemo(),
          ),
        )),
  );
}
