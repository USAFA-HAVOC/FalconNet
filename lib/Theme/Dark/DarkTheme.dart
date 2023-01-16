import 'package:flutter/material.dart';

import 'DarkCardTheme.dart';
import 'DarkTextTheme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  focusColor: const Color.fromARGB(255, 218, 230, 255),
  indicatorColor: Colors.blue,
  textTheme: darkTextTheme,
  cardTheme: darkCardTheme,
  fontFamily: "Roboto",
  canvasColor: Colors.grey,
  dialogBackgroundColor: darkCardTheme.color,
  iconTheme: IconThemeData(color: Colors.white),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
  )
);