import 'package:flutter/material.dart';
import 'app_screens/profile_card_rating.dart';

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
        body: ProfileCardRating(),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
