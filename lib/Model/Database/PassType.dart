import 'package:flutter/material.dart';

import '../../Utility/TemporalFormatting.dart';

enum PassType {
  day,
  weekday_overnight,
  sunday,
  weekend,
  discretionary,
  sca,
  esss
}

extension PassTypeNames on PassType {
  String description() {
    switch (this) {
      case PassType.weekday_overnight: return "Weekday Overnight";
      case PassType.day: return "Day Pass";
      case PassType.sunday: return "Sunday Pass";
      case PassType.weekend: return "Weekend Period";
      case PassType.discretionary: return "Discretionary";
      case PassType.sca: return "SCA";
      case PassType.esss: return "eSSS";
    }
  }

  static PassType parse(String name) {
    return Map.fromEntries(PassType.values.map((v) => MapEntry(v.name, v)))[name]!;
  }

  DateTime? duration(int year) {
    var time = year < 3
        ? const TimeOfDay(hour: 19, minute: 50)
        : const TimeOfDay(hour: 23, minute: 00);
    var now = DateTime.now();
    switch (this) {
      case PassType.weekday_overnight: return combineDate(now.add(const Duration(days: 1)), const TimeOfDay(hour: 7, minute: 00));
      case PassType.day: return combineDate(now, time);
      case PassType.sunday: return combineDate(now, time);
      case PassType.weekend: return combineDate(now.add(Duration(days: DateTime.sunday - now.weekday)), time);
      case PassType.discretionary: return null;
      case PassType.sca: return null;
      case PassType.esss: return null;
    }
  }
}