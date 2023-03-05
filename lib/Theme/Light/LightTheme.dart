import 'package:falcon_net/Theme/Light/LightCardTheme.dart';
import 'package:falcon_net/Theme/Light/LightTextTheme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  focusColor: const Color.fromARGB(255, 218, 230, 255),
  indicatorColor: Colors.blue,
  textTheme: lightTextTheme,
  cardTheme: lightCardTheme,
  fontFamily: "Roboto",
  iconTheme: const IconThemeData(color: Colors.black),
  canvasColor: const Color.fromRGBO(240, 239, 236, 1.0),
  errorColor: Colors.redAccent,
  disabledColor: Color.fromARGB(255, 200, 200, 200),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
  )
);