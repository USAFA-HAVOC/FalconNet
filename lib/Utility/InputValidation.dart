

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TemporalFormatting.dart';

///Container class for all input validation default methods
class InputValidation {

  ///Allows override of other validation function
  static String? Function(String?) override(String? Function(String?) validator, bool override) => (String? content) {
    if (override) {
      return null;
    }
    return validator(content);
  };

  ///Validates plaintext fields with an optional minimum length
  static String? Function(String?) stringLength({int? length, String? emptyMessage}) => (String? content) {
    if (content != null) {
      if (content.isNotEmpty) {
        if (content.characters.length > (length ?? 0)) {
          return null;
        }
        return "Requires ${(length ?? 0).toString()} characters";
      }
    }
    return emptyMessage ?? "Please enter something";
  };

  ///Validates date fields
  static String? Function(String?) date({String? emptyMessage}) => (String? content) {
    if (content != null) {
      if (content.isNotEmpty) {
        return null;
      }
    }
    return emptyMessage ?? "Please enter a date";
  };

  ///Validates time fields
  static String? Function(String?) time({required DateTime date, String? emptyMessage}) => (String? content) {
    //Requires that time entered be valid and in the future
    if (content != null) {
      if (content.isNotEmpty) {
        TimeOfDay time = parseTime(content);
        DateTime givenDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        DateTime present = DateTime.now().toUtc();
        if (givenDate.compareTo(present) < 0) {
          return "Time in past";
        }
        return null;
      }
    }
    return "Please enter a time";
  };

  ///Validates dropdown menus
  static String? Function(String?) dropdown({String? emptyMessage}) => (String? content) {
    if (content != null) {
      if (content.isNotEmpty) {
        return null;
      }
    }
    return emptyMessage ?? "Please select an option";
  };

  ///Validates numeric fields
  static String? Function(String?) number({String? emptyMessage}) => (String? content) {
    if (content != null) {
      if (content.isNotEmpty) {
        if (double.tryParse(content) != null) {
          return null;
        }
      }
    }
    return emptyMessage ?? "Please enter a number";
  };

  ///Validates numeric fields
  static String? Function(String?) optionalNumber({String? emptyMessage}) => (String? content) {
    if (content != null) {
      if (content.isNotEmpty) {
        if (double.tryParse(content) != null) {
          return null;
        }
        return emptyMessage ?? "Please enter a number";
      }
    }
  };
}