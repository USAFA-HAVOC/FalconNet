import 'package:flutter/material.dart';

class NegativeButtonTheme extends ThemeExtension<NegativeButtonTheme> {
  final ButtonStyle style;

  const NegativeButtonTheme({required this.style});

  @override
  NegativeButtonTheme copyWith({ButtonStyle? style}) => NegativeButtonTheme(style: style!);

  @override
  ThemeExtension<NegativeButtonTheme> lerp(ThemeExtension<NegativeButtonTheme>? other, double t) {
    if (other is! NegativeButtonTheme) {
      return this;
    }
    return NegativeButtonTheme(style: ButtonStyle.lerp(style, other.style, t) ?? style);
  }
}