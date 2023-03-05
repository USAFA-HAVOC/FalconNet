import 'package:flutter/material.dart';

import 'DarkCardTheme.dart';
import 'DarkTextTheme.dart';
import 'DarkElevatedButtonTheme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 24, 24, 24),
  focusColor: const Color.fromARGB(255, 83, 83, 83),
  indicatorColor: Colors.grey,
  disabledColor: Color.fromARGB(255, 45, 45, 45),
  textTheme: darkTextTheme,
  cardTheme: darkCardTheme,
  elevatedButtonTheme: darkButtonTheme, // Button Color
  fontFamily: "Inter",
  canvasColor: const Color.fromARGB(255, 24, 24, 24), // Darkest
  dialogBackgroundColor: darkCardTheme.color,
  iconTheme: const IconThemeData(color: Colors.white),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 0, 0, 139),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  ),
);
