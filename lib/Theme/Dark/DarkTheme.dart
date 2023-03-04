import 'package:flutter/material.dart';

import 'DarkCardTheme.dart';
import 'DarkTextTheme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 24, 24, 24),
  focusColor: Color.fromARGB(255, 40, 40, 40),
  indicatorColor: Colors.grey,
  textTheme: darkTextTheme,
  cardTheme: darkCardTheme,
  fontFamily: "Roboto",
  canvasColor: Color.fromARGB(255, 24, 24, 24),
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
