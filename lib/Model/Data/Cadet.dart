import 'dart:core';

import 'package:falcon_net/Model/Store/GlobalState.dart';

class CadetModel implements StateObject {
  String? email;
  String? name;
  String? phone;
  String? room;
  int? squadron;
  String? group;
  String? unit;
  String? id;

  CadetModel({
    this.email,
    this.name,
    this.phone,
    this.room,
    this.squadron,
    this.group,
    this.unit,
    this.id,
  });

  @override
  CadetModel modified(Enum k, dynamic value) {
    CadetProperty key = k as CadetProperty;
    switch (key) {
      case CadetProperty.email: {
        return CadetModel(email: value, name: name, phone: phone, room: room, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.name: {
        return CadetModel(email: email, name: value, phone: phone, room: room, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.phone: {
        return CadetModel(email: email, name: name, phone: value, room: room, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.room: {
        return CadetModel(email: email, name: name, phone: phone, room: value, squadron: squadron, group: group, unit: unit);
      }
      case CadetProperty.squadron: {
        return CadetModel(email: email, name: name, phone: phone, room: room, squadron: value, group: group, unit: unit);
      }
      case CadetProperty.group: {
        return CadetModel(email: email, name: name, phone: phone, room: room, squadron: squadron, group: value, unit: unit);
      }
      case CadetProperty.unit: {
        return CadetModel(email: email, name: name, phone: phone, room: room, squadron: squadron, group: group, unit: value);
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