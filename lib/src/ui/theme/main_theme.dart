import 'package:flutter/material.dart';

final ThemeData appTheme = buildDefaultTheme();
final ThemeData darkAppTheme = buildDarkTheme();

ThemeData buildDefaultTheme() {
  return (ThemeData(
    primarySwatch: Colors.blue,
  ));
}

ThemeData buildDarkTheme() {
  return (ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
  ));
}
