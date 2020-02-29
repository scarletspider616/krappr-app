import 'package:flutter/material.dart';

final ThemeData appTheme = buildDefaultTheme();
final ThemeData darkAppTheme = buildDarkTheme();

ThemeData buildDefaultTheme() {
  return (ThemeData(
    primarySwatch: Colors.blue,

    primaryColor: Colors.blue,
    accentColor: Colors.black,

    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      subtitle: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  ));
}

ThemeData buildDarkTheme() {
  return (ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,

    primaryColor: Colors.blue,
    accentColor: Colors.black,

    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      subtitle: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  ));
}
