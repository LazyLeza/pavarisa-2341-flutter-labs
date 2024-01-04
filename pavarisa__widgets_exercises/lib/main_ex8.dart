import 'package:flutter/material.dart';
import './app_screens/basic_listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic ListView', textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: CustomListView(),
      ),
    );
  }
}
