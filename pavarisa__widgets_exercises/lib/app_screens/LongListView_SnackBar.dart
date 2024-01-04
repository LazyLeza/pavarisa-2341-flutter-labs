import 'package:flutter/material.dart';

class ProblemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Long ListView'),
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
