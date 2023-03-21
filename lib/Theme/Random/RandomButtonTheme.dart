import 'dart:math';
import 'package:flutter/material.dart';

import 'RandomTextTheme.dart';

var r = Random();


ElevatedButtonThemeData randomButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: randomTextTheme.labelLarge,
    foregroundColor: Color.fromARGB(r.nextInt(255), r.nextInt(255), r.nextInt(255), r.nextInt(255)),
    backgroundColor: Color.fromARGB(r.nextInt(255), r.nextInt(255), r.nextInt(255), r.nextInt(255)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(r.nextDouble() * 20),
      ),
    ),
  ),
);
