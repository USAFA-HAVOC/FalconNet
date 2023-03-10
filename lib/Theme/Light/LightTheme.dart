import 'package:falcon_net/Theme/Light/LightCardTheme.dart';
import 'package:falcon_net/Theme/Light/LightTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:falcon_net/Theme/Light/LightElevatedButtonTheme.dart';

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
  canvasColor: Colors.white70,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
  ),
);
