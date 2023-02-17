import 'package:flutter/material.dart';

import 'DarkCardTheme.dart';
import 'DarkTextTheme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  focusColor: Colors.grey,
  indicatorColor: Colors.grey,
  textTheme: darkTextTheme,
  cardTheme: darkCardTheme,
  fontFamily: "Roboto",
  canvasColor: Colors.grey,
  errorColor: Colors.redAccent,
  dialogBackgroundColor: darkCardTheme.color,
  iconTheme: const IconThemeData(color: Colors.white),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 0, 0, 140),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
  )
);