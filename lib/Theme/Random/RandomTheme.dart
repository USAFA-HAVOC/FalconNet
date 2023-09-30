import 'dart:math';
import 'package:falcon_net/Theme/Random/RandomButtonTheme.dart';
import 'package:flutter/material.dart';

import '../NegativeButtonTheme.dart';
import 'RandomCardTheme.dart';
import 'RandomTextTheme.dart';

Color randomColor() {
  var r = Random();
  return Color.fromARGB(r.nextInt(255), r.nextInt(255), r.nextInt(255), r.nextInt(255));
}

ThemeData get randomTheme => ThemeData(
    primaryColor: randomColor(),
    focusColor: randomColor(),
    indicatorColor: randomColor(),
    textTheme: randomTextTheme,
    cardTheme: randomCardTheme,
    fontFamily: "Roboto",
    iconTheme: IconThemeData(color: randomColor()),
    canvasColor: randomColor(),
    elevatedButtonTheme: randomButtonTheme,
    extensions: [
      NegativeButtonTheme(style: ElevatedButton.styleFrom(
        backgroundColor: randomColor(),
        textStyle: randomTextTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Random().nextDouble() * 20),
          ),
        ),
      ))
    ],
    colorScheme: ColorScheme.dark(
      secondary: randomColor(),
      error: randomColor()
    )
);