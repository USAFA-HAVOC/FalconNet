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

  MapEntry<DateTime?, DateTime?> delegationScope(List<TimedRole> applicable) {
    DateTime? start;
    DateTime? end;

    for (var role in applicable) {
      if (role.isGreaterThan(this)) {
        if (role.start == null || role.end == null) return const MapEntry(null, null);
        start ??= role.start!;
        start = start.isBefore(role.start!) ? start : role.start!;
        end ??= role.end!;
        end = start.isBefore(role.end!) ? end : role.end!;
      }
    }

    return MapEntry(start, end);
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
      return [Roles.fn_admin.name, Roles.wing_admin.name, Roles.unit_admin.name, Roles.cwoc.name, Roles.pp.name] + delegates;
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
    return role == Roles.fn_admin.name
        || role == Roles.wing_admin.name
        || role == Roles.unit_admin.name
        || role == Roles.pp.name;
  }

  bool isGreaterThan(TimedRole other) {
    if (role == Roles.fn_admin.name) {
      return true;
    }
    if (role == Roles.pp.name) {
      return other.role != Roles.pp.name;
    }

    if (role == Roles.wing_admin.name) {
      return other.role != Roles.fn_admin.name && other.role != Roles.wing_admin.name && other.role != Roles.pp.name;
    }

    if (role == Roles.unit_admin.name) {
      return !other.isAdmin();
    }

    return false;
  }

  TimedRole._();
  factory TimedRole([void Function(TimedRoleBuilder) updates]) = _$TimedRole;
}