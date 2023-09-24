import 'package:falcon_net/Theme/Light/LightTextTheme.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData lightButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: lightTextTheme.labelLarge,
    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
    backgroundColor: const Color.fromARGB(255, 31, 81, 255),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
  ),
);
