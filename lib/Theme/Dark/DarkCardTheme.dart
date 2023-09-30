import 'package:flutter/material.dart';

CardTheme darkCardTheme = const CardTheme(
  color: Color.fromARGB(255, 64, 64, 64),
  elevation: 1.0,
  clipBehavior: Clip.antiAlias,
  margin: EdgeInsets.all(0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  shadowColor: Colors.grey,
);
