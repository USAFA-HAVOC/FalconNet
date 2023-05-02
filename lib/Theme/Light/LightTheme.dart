import 'package:falcon_net/Theme/Light/LightCardTheme.dart';
import 'package:falcon_net/Theme/Light/LightTextTheme.dart';
import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:flutter/material.dart';
import 'package:falcon_net/Theme/Light/LightElevatedTheme.dart';

/*
TODO:
  - Use '///' to document classes
  - Comment like every line -- probably need to organize these lines
    - Explain differences between themes etc.
*/

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  focusColor: Colors.grey[200],
  highlightColor: const Color.fromARGB(255, 147, 170, 255),
  indicatorColor: Colors.blue,
  disabledColor: const Color.fromARGB(255, 179, 179, 179),
  textTheme: lightTextTheme,
  cardTheme: lightCardTheme,
  elevatedButtonTheme: lightButtonTheme,
  fontFamily: "ProximaNova",
  iconTheme: const IconThemeData(color: Colors.black),
  canvasColor: const Color.fromARGB(255, 232, 232, 232),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color.fromARGB(255, 50, 50, 50),
    contentTextStyle: TextStyle(fontSize: 15, color: Colors.white),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateColor.resolveWith((states) => Colors.blue),
    trackColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.blue;
      }
      return Colors.grey;
    }),
  ),
  extensions: [
    NegativeButtonTheme(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        textStyle: lightTextTheme.labelLarge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    )
  ],
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.black,
    error: Color.fromARGB(255, 230, 88, 78),
  ),
);
