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
  Cadet modified(Enum k, dynamic value) {
    CadetProperty key = k as CadetProperty;
    switch (key) {
      case CadetProperty.email: {
        return Cadet(email: value, name: name, phone: phone, room: room, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.name: {
        return Cadet(email: email, name: value, phone: phone, room: room, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.phone: {
        return Cadet(email: email, name: name, phone: value, room: room, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.room: {
        return Cadet(email: email, name: name, phone: phone, room: value, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.squadron: {
        return Cadet(email: email, name: name, phone: phone, room: room, squadron: value, group: group, unit: unit);
      }
      case CadetProperty.group: {
        return Cadet(email: email, name: name, phone: phone, room: room, squadron: squadron, group: value, unit: unit);
      }
      case CadetProperty.unit: {
        return Cadet(email: email, name: name, phone: phone, room: room, squadron: squadron, group: group, unit: value);
      }
    }
  }
}

enum CadetProperty {
  email,
  name,
  phone,
  room,
  squadron,
  group,
  unit
}