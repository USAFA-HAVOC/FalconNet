import 'dart:core';

import 'package:falcon_net/Model/GlobalState.dart';

class Pass implements StateObject {
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

  @override
  Pass modified(Enum k, dynamic value) {
    PassProperty key = k as PassProperty;
    switch (key) {
      case PassProperty.start: {
        return Pass(start: value, end: end, type: type, id: id, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case PassProperty.end: {
        return Pass(start: start, end: value, type: type, id: id, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case PassProperty.type: {
        return Pass(start: start, end: end, type: value, id: id, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case PassProperty.id: {
        return Pass(start: start, end: end, type: type, id: value, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case PassProperty.description: {
        return Pass(start: start, end: end, type: type, id: id, description: value, sca: sca, city: city, state: state, zip: zip);
      }
      case PassProperty.sca: {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: value, city: city, state: state, zip: zip);
      }
      case PassProperty.city: {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: sca, city: value, state: state, zip: zip);
      }
      case PassProperty.state: {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: sca, city: city, state: value, zip: zip);
      }
      case PassProperty.zip: {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: sca, city: city, state: state, zip: value);
      }
    }
  }
}

enum PassProperty {
  start,
  end,
  type,
  id,
  description,
  sca,
  city,
  state,
  zip
}