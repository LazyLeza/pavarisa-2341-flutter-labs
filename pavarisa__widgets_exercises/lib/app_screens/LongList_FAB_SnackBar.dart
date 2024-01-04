import 'package:flutter/material.dart';

class ProblemList extends StatefulWidget {
  @override
  _ProblemListState createState() => _ProblemListState();
}

class _ProblemListState extends State<ProblemList> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAB and SnackBar Exercise'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          final problemNumber = index + 1;
          return ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text('Problem $problemNumber'),
            trailing: problemNumber.isEven ? Icon(Icons.star) : null,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    problemNumber.isEven
                        ? 'Problem $problemNumber is my favorite'
                        : 'Problem $problemNumber is selected',
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Do nothing when 'Undo' is pressed
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Tooltip(
        message: 'Incrementing the counter',
        child: FloatingActionButton(
          onPressed: () {
            _incrementCounter();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Current counter value is $_counter',
                ),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Do nothing when 'Undo' is pressed
                  },
                ),
              ),
            );
          },
          tooltip: 'Incrementing the counter',
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
