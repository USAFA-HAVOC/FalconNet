import 'package:flutter/material.dart';

import '../NegativeButtonTheme.dart';
import 'DarkCardTheme.dart';
import 'DarkTextTheme.dart';
import 'DarkButtonTheme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 24, 24, 24),
  focusColor: const Color.fromARGB(255, 40, 40, 40),
  indicatorColor: Colors.grey,
  textTheme: darkTextTheme,
  cardTheme: darkCardTheme,
  elevatedButtonTheme: darkButtonTheme, // Button Color
  disabledColor: const Color.fromARGB(255, 60, 60, 60),
  fontFamily: "Inter",
  canvasColor: const Color.fromARGB(255, 24, 24, 24), // Darkest
  dialogBackgroundColor: darkCardTheme.color,
  iconTheme: const IconThemeData(color: Colors.white),

  snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color.fromARGB(255, 50, 50, 50),
      contentTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white
      )
  ),

  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 0, 78, 192)),
    trackColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const Color.fromARGB(255, 0, 60, 150);
      }
      return Colors.grey;
    }),
  ),

  extensions: [
    NegativeButtonTheme(style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 90, 90, 90),
      textStyle: darkTextTheme.labelLarge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ))
  ],

  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blue,
    error: Color.fromARGB(255, 100, 0, 0)
  )
);
