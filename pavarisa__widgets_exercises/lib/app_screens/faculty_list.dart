import 'package:flutter/material.dart';

// Data model class to represent faculty information
class FacultyDataModel {
  final String faculty;
  final String facultyThaiName;
  final String facultyURL;

  FacultyDataModel({
    required this.faculty,
    required this.facultyThaiName,
    required this.facultyURL,
  });
}

class FacultyList extends StatelessWidget {
  const FacultyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<FacultyDataModel> facultyData = [
      FacultyDataModel(
        faculty: 'Engineering',
        facultyThaiName: 'วิศวกรรมศาสตร์',
        facultyURL: 'https://www.en.kku.ac.th/web/',
      ),
      FacultyDataModel(
        faculty: 'Medicine',
        facultyThaiName: 'แพทย์ศาสตร์',
        facultyURL: 'https://md.kku.ac.th/',
      ),
      FacultyDataModel(
        faculty: 'Architecture',
        facultyThaiName: 'สถาปัตยกรรมศาสตร์',
        facultyURL: 'https://arch.ku.ac.th/web',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('KKU Faculty'),
      ),
      body: ListView.builder(
        itemCount: facultyData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(facultyData[index].faculty),
              leading: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FacultyDetail(facultyData: facultyData[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FacultyDetail extends StatelessWidget {
  final FacultyDataModel facultyData;

  const FacultyDetail({Key? key, required this.facultyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facultyData.faculty),
      ),
      body: Container(
        // padding: const EdgeInsets.all(0),
        // child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle button click, e.g., open facultyURL
              },
              child: Text(facultyData.facultyURL),
            ),
            SizedBox(height: 16),
            Text(
              facultyData.facultyThaiName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Image.asset('images/${facultyData.faculty}.png'),
            ),
            // Optionally, you can add a SizedBox if you want some space after the image
            SizedBox(height: 16),
          ],
        ),
        // ),
      ),
    );
  }
}
