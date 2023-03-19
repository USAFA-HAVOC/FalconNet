import 'package:falcon_net/Theme/Dark/DarkTextTheme.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData darkButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    backgroundColor: const Color.fromARGB(255, 0, 89, 179),
    textStyle: darkTextTheme.labelLarge,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
);
