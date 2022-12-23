import 'package:flutter/material.dart';

String describeTime(TimeOfDay time) {
  return "${time.hourOfPeriod}:${time.minute < 10 ? "0${time.minute.toString()}" : time.minute} ${time.period.name.toUpperCase()}";
}

TimeOfDay parseTime(String time) {
  var parts = time.split(":");
  assert(parts.length == 2);
  var hour = int.parse(parts[0]);
  var subs = parts[1].split(" ");
  var minute = int.parse(subs[0]);
  if (subs[1] == "PM") {
    hour += 12;
  }
  return TimeOfDay(hour: hour, minute: minute);
}

String describeDate(DateTime date) {
  return "${date.month}/${date.day}/${date.year}";
}

DateTime parseDate(String date) {
  var parts = date.split("/");
  assert(parts.length == 3);
  var month = int.parse(parts[0]);
  var day = int.parse(parts[1]);
  var year = int.parse(parts[2]);
  return DateTime(year, month, day);
}