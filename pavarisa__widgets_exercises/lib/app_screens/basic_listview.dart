import 'package:flutter/material.dart';

class ListTitleFaculty extends StatelessWidget {
  final String facFullName;
  final Icon facIcon;
  final Icon? trailingIcon;

  const ListTitleFaculty({
    Key? key,
    required this.facFullName,
    required this.facIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: facIcon,
      title: Text(
        facFullName,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'Athiti',
          color: Colors.black,
        ),
      ),
      trailing: trailingIcon,
      onTap: () {
        _showAlertDialog(context, facFullName.substring(0, 2).toUpperCase());
      },
    );
  }

  void _showAlertDialog(BuildContext context, String facShortName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$facFullName'),
          content: Text('$facShortName'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTitleFaculty(
          facFullName: 'Engineering',
          facIcon: Icon(Icons.engineering),
          trailingIcon: Icon(Icons.star),
        ),
        const ListTitleFaculty(
          facFullName: 'Agriculture',
          facIcon: Icon(Icons.agriculture),
          // trailingIcon: Icon(Icons.star),
        ),
        const ListTitleFaculty(
          facFullName: 'Architecture',
          facIcon: Icon(Icons.architecture),
          // trailingIcon: Icon(Icons.star),
        ),
      ],
    );
  }
}
