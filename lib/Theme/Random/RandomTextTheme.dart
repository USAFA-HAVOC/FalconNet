import 'dart:math';

import 'package:falcon_net/Theme/Random/RandomTheme.dart';
import 'package:flutter/material.dart';

TextTheme get randomTextTheme => TextTheme(

  //Title is used for page and widget titles
  titleLarge: TextStyle(
    color: randomColor(),
    fontSize: Random().nextDouble() * 20 + 10,
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  titleMedium: TextStyle(
      color: randomColor(),
      fontSize: Random().nextDouble() * 20 + 10,
      fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  titleSmall: TextStyle(
      color: randomColor(),
      fontSize: Random().nextDouble() * 20 + 10,
      fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),

  //Label is used for contrast against dark colors
  labelLarge: TextStyle(
    color: randomColor(),
    fontSize: Random().nextDouble() * 20 + 10,
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  labelMedium: TextStyle(
    color: randomColor(),
    fontSize: Random().nextDouble() * 20 + 10,
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  labelSmall: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),

  //Used on status widgets
  headlineLarge: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  headlineMedium: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  headlineSmall: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),

  //Used for textual information other than titles
  bodyLarge: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
  bodySmall: TextStyle(
    fontSize: Random().nextDouble() * 20 + 10,
    color: randomColor(),
    fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
  ),
);