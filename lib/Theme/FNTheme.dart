import 'package:falcon_net/Theme/FNCardTheme.dart';
import 'package:falcon_net/Theme/FNTextTheme.dart';
import 'package:flutter/material.dart';

ThemeData fnTheme = ThemeData(
  primaryColor: Colors.white,
  focusColor: const Color.fromARGB(255, 218, 230, 255),
  indicatorColor: Colors.blue,
  textTheme: fnTextTheme,
  cardTheme: fnCardTheme,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
  )
);