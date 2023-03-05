import 'package:flutter/material.dart';

ElevatedButtonThemeData lightButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
    backgroundColor: Color.fromARGB(255, 31, 81, 255),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
  ),
);
