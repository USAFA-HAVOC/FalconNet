import 'package:flutter/material.dart';

TextTheme darkTextTheme = const TextTheme(
  //Title is used for page and widget titles
  titleLarge: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  titleSmall: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
  ),

  //Label is used for contrast against light colors
  labelLarge: TextStyle(
    fontSize: 20,
    color: Colors.white,
  ),
  labelMedium: TextStyle(
    fontSize: 15,
    color: Colors.white,
  ),
  labelSmall: TextStyle(
    fontSize: 10,
    color: Colors.white,
  ),

  //Used on status widgets
  headlineLarge: TextStyle(
    fontSize: 25,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  headlineMedium: TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  headlineSmall: TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 255, 255, 255),
  ),

  //Used for textual information other than titles
  bodyLarge: TextStyle(
    fontSize: 15,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  bodyMedium: TextStyle(
    fontSize: 13,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
);
