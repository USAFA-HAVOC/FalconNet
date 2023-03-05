import 'package:flutter/material.dart';

TextTheme lightTextTheme = const TextTheme(
  //Title is used for page and widget titles
  titleLarge: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),

  //Label is used for contrast against dark colors
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
    color: Colors.black,
  ),
  headlineMedium: TextStyle(
    fontSize: 20,
    color: Colors.white,
  ),
  headlineSmall: TextStyle(
    fontSize: 18,
    color: Colors.black,
  ),

  //Used for textual information other than titles
  bodyLarge: TextStyle(
    fontSize: 15,
  ),
  bodyMedium: TextStyle(
    fontSize: 13,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
  ),
);
