import 'package:flutter/material.dart';
import 'rows_cols_expanded.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'Evaluate buttons',
//     home: ElevatedButtonDemo(),
//   ));
// }

class ElevatedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetsExercise(),
        // Place WidgetsExercise here
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Confirmation'),
              content: const Text('Submitting information'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: Text('Submit'),
        ),
      ],
    );
  }
}
