import 'package:flutter/material.dart';

import 'DarkCardTheme.dart';
import 'DarkTextTheme.dart';
import 'DarkElevatedButtonTheme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 24, 24, 24),
  focusColor: const Color.fromARGB(255, 40, 40, 40),
  indicatorColor: Colors.grey,
  textTheme: darkTextTheme,
  cardTheme: darkCardTheme,
  elevatedButtonTheme: darkButtonTheme, // Button Color
  disabledColor: const Color.fromARGB(255, 40, 40, 40),
  fontFamily: "Inter",
  canvasColor: const Color.fromARGB(255, 24, 24, 24), // Darkest
  dialogBackgroundColor: darkCardTheme.color,
  iconTheme: const IconThemeData(color: Colors.white),
);
