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
  Pass modified(String key, dynamic value) {
    switch (key) {
      case "start": {
        return Pass(start: value, end: end, type: type, id: id, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case "end": {
        return Pass(start: start, end: value, type: type, id: id, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case "type": {
        return Pass(start: start, end: end, type: value, id: id, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case "id": {
        return Pass(start: start, end: end, type: type, id: value, description: description, sca: sca, city: city, state: state, zip: zip);
      }
      case "description": {
        return Pass(start: start, end: end, type: type, id: id, description: value, sca: sca, city: city, state: state, zip: zip);
      }
      case "sca": {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: value, city: city, state: state, zip: zip);
      }
      case "city": {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: sca, city: value, state: state, zip: zip);
      }
      case "state": {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: sca, city: city, state: value, zip: zip);
      }
      case "zip": {
        return Pass(start: start, end: end, type: type, id: id, description: description, sca: sca, city: city, state: state, zip: value);
      }
      default: {
        assert(false, "No such property");
        return Pass();
      }
    }
  }
}