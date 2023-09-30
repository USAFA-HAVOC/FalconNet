import 'dart:math';

import 'package:falcon_net/Theme/Random/RandomTheme.dart';
import 'package:flutter/material.dart';

CardTheme get randomCardTheme => CardTheme(
  color: randomColor(),
  elevation: Random().nextDouble() * 10,
  clipBehavior: Clip.antiAlias,
  margin: EdgeInsets.all(Random().nextDouble() * 20 + 10),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Random().nextDouble() * 10 + 5))),
  shadowColor: randomColor(),
);