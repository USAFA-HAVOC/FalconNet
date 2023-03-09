import 'package:flutter/material.dart';

ElevatedButtonThemeData lightButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      color: Colors.white
    ),
    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
    backgroundColor: const Color.fromARGB(255, 31, 81, 255),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
);
