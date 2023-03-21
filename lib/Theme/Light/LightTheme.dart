import 'package:falcon_net/Theme/Light/LightCardTheme.dart';
import 'package:falcon_net/Theme/Light/LightTextTheme.dart';
import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:flutter/material.dart';
import 'package:falcon_net/Theme/Light/LightElevatedTheme.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  focusColor: Colors.grey[200],
  highlightColor: const Color.fromARGB(255, 147, 170, 255),
  indicatorColor: Colors.blue,
  disabledColor: const Color.fromARGB(255, 179, 179, 179),
  textTheme: lightTextTheme,
  cardTheme: lightCardTheme,
  elevatedButtonTheme: lightButtonTheme,
  fontFamily: "Inter",
  iconTheme: const IconThemeData(color: Colors.black),
  canvasColor: const Color.fromARGB(255, 232, 232, 232),
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color.fromARGB(255, 50, 50, 50),
      contentTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white
      )
  ),
  extensions: [
    NegativeButtonTheme(style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      textStyle: lightTextTheme.labelLarge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ))
  ],
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.blue,
    error: Color.fromARGB(255, 230, 88, 78)
  )
);
