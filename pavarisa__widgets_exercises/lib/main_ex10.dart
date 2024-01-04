import 'package:flutter/material.dart';
import './app_screens/LongList_FAB_SnackBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProblemList(),
    );
  }
}
