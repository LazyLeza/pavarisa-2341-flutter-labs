import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MainLoginApp());
}

class MainLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'Login with JSON files', // Change title
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readUserData();
  }

  Future<void> _readUserData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/user_data.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        final jsonData = json.decode(contents);
        setState(() {
          _usernameController.text = jsonData['username'];
          _passwordController.text = jsonData['password'];
        });
      }
    } catch (e) {
      print('Error reading user data: $e');
    }
  }

  Future<void> _writeUserData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/user_data.json');
    await file.writeAsString(json.encode({
      'username': _usernameController.text,
      'password': _passwordController.text
    }));
    print('${file.path}');
  }

  void _login() {
    // _usernameController.text = jsonData['username'];
    // _password = _passwordController.text;
    _writeUserData();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Username: ${_usernameController.text}, Password: ${_passwordController.text}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with JSON files'), // Change app bar title if needed
        centerTitle: true, // Align title to the center
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
