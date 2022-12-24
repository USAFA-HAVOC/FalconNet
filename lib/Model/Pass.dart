import 'dart:core';

import 'package:falcon_net/Model/GlobalState.dart';

class Pass {
  final DateTime? start;
  final DateTime? end;
  final String? type;
  final String? id;
  final String? description;
  final String? sca;
  final String? city;
  final String? state;
  final String? zip;

  const Pass({
    this.start,
    this.end,
    this.type,
    this.id,
    this.description,
    this.sca,
    this.city,
    this.state,
    this.zip
  });
}