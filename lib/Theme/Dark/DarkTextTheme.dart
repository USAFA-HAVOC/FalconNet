import 'package:flutter/material.dart';

TextTheme darkTextTheme = const TextTheme(

  //Title is used for page and widget titles
  titleLarge: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white70
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white70
  ),
  titleSmall: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
      color: Colors.white70
  ),

  //Label is used for contrast against light colors
  labelLarge: TextStyle(
    fontSize: 20,
    color: Colors.black,
  ),
  labelMedium: TextStyle(
    fontSize: 15,
    color: Colors.black,
  ),
  labelSmall: TextStyle(
    fontSize: 10,
    color: Colors.black,
  ),

  //Used on status widgets
  headlineLarge: TextStyle(
    fontSize: 25,
    color: Colors.blue,
  ),
  headlineMedium: TextStyle(
    fontSize: 20,
    color: Colors.blue,
  ),
  headlineSmall: TextStyle(
    fontSize: 15,
    color: Colors.blue,
  ),

  //Used for textual information other than titles
  bodyLarge: TextStyle(
    fontSize: 15,
    color: Colors.white70
  ),
  bodyMedium: TextStyle(
    fontSize: 13,
    color: Colors.white70,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    color: Colors.white70
  ),
);