// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krappr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: createContent(),
    );
  }

  createContent() {
    return Text("Krappr");
  }
}
