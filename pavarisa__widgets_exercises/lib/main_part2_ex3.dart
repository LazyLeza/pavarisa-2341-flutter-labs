import 'package:flutter/material.dart';
import 'app_screens/faculty_list.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FacultyList(),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
