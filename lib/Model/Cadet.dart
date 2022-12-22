import 'dart:core';

import 'package:falcon_net/Model/GlobalState.dart';

class Cadet implements StateObject {
  String? email;
  String? name;
  String? phone;
  String? room;
  int? squadron;
  String? group;
  String? unit;

  Cadet({
    this.email,
    this.name,
    this.phone,
    this.room,
    this.squadron,
    this.group,
    this.unit
  });

  @override
  Cadet modified(String key, dynamic value) {
    switch (key) {
      case "email": {
        return Cadet(email: value, name: name, phone: phone, room: room, squadron: squadron, group: group, unit: unit);
      }
      case "name": {
        return Cadet(email: email, name: value, phone: phone, room: room, squadron: squadron, group: group, unit: unit);
      }
      case "phone": {
        return Cadet(email: email, name: name, phone: value, room: room, squadron: squadron, group: group, unit: unit);
      }
      case "room": {
        return Cadet(email: email, name: name, phone: phone, room: value, squadron: squadron, group: group, unit: unit);
      }
      case "squadron": {
        return Cadet(email: email, name: name, phone: phone, room: room, squadron: value, group: group, unit: unit);
      }
      case "group": {
        return Cadet(email: email, name: name, phone: phone, room: room, squadron: squadron, group: value, unit: unit);
      }
      case "unit": {
        return Cadet(email: email, name: name, phone: phone, room: room, squadron: squadron, group: group, unit: value);
      }
      default: {
        assert(false, "No such property");
        return Cadet();
      }
    }
  }
}