import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF17192D),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF17192D),
  ),
);
