import 'dart:math';
import 'package:flutter/material.dart';

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
    errorColor: randomColor(),
    buttonTheme: ButtonThemeData(
        buttonColor: randomColor(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Random().nextDouble() * 30)))
    )
);