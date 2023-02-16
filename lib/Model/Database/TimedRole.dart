import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Roles.dart';

part 'TimedRole.g.dart';

abstract class TimedRole implements Built<TimedRole, TimedRoleBuilder> {
  static Serializer<TimedRole> get serializer => _$timedRoleSerializer;

  String get role;

  DateTime? get start;
  DateTime? get end;

  TimedRole toUtc() {
    return rebuild((r) => r
        ..start = start?.toUtc()
        ..end = end?.toUtc()
    );
  }

  TimedRole toLocal() {
    return rebuild((r) => r
      ..start = start?.toUtc()
      ..end = end?.toUtc()
    );
  }

  List<String> delegable() {
    List<String> delegates = [
      Roles.sdo.name,
      Roles.jdo.name,
      Roles.recognized.name,
      Roles.signable.name,
      Roles.stan_eval.name,
      Roles.cadet.name
    ];

    if (role == Roles.fn_admin.name) {
      return [Roles.fn_admin.name, Roles.wing_admin.name, Roles.unit_admin.name, Roles.cwoc.name] + delegates;
    }

    else if (role == Roles.wing_admin.name) {
      return [Roles.unit_admin.name, Roles.cwoc.name] + delegates;
    }

    else if (role == Roles.unit_admin.name) {
      return delegates;
    }

    return [];
  }

  bool isAdmin() {
    return role == Roles.fn_admin.name || role == Roles.wing_admin.name || role == Roles.unit_admin.name;
  }

  bool isGreaterThan(TimedRole other) {
    if (role == Roles.fn_admin.name) {
      return true;
    }

    if (role == Roles.wing_admin.name) {
      return other.role != Roles.fn_admin.name && other.role != Roles.wing_admin.name;
    }

    if (role == Roles.unit_admin.name) {
      return !other.isAdmin();
    }

    return false;
  }

  TimedRole._();
  factory TimedRole([void Function(TimedRoleBuilder) updates]) = _$TimedRole;
}