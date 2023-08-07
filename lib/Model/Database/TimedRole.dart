import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../Utility/TemporalFormatting.dart';
import 'Role.dart';

part 'TimedRole.g.dart';

abstract class TimedRole implements Built<TimedRole, TimedRoleBuilder> {
  static Serializer<TimedRole> get serializer => _$timedRoleSerializer;

  String get name;
  String? get unit;

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
      Roles.accountability_rep.name,
      Roles.cadet.name
    ];

    if (name == Roles.fn_admin.name) {
      return [Roles.fn_admin.name, Roles.wing_admin.name, Roles.group_admin.name, Roles.unit_admin.name, Roles.cwoc.name, Roles.permanent_party.name] + delegates;
    }

    else if (name == Roles.permanent_party.name || name == Roles.unit_admin.name) {
      return [Roles.unit_admin.name] + delegates;
    }

    return [];
  }

  bool isAdmin() {
    return name == Roles.fn_admin.name
        || name == Roles.wing_admin.name
        || name == Roles.unit_admin.name
        || name == Roles.permanent_party.name;
  }

  bool isGreaterThan(TimedRole other) {
    if (name == Roles.fn_admin.name) {
      return true;
    }
    if (name == Roles.permanent_party.name) {
      return other.name != Roles.fn_admin.name && other.name != Roles.permanent_party.name;
    }

    if (name == Roles.wing_admin.name) {
      return other.name != Roles.fn_admin.name && other.name != Roles.wing_admin.name && other.name != Roles.permanent_party.name;
    }

    if (name == Roles.unit_admin.name) {
      return !other.isAdmin();
    }

    return false;
  }

  String description([bool expanded = false]) {
    if (start == null || end == null || !expanded) {
      return "${RoleNames.parseDirect(name).description()} ${unit == null ? "" : "($unit)"}";
    }
    else {
      return "${RoleNames.parseDirect(name).description()} ${unit == null ? "" : "($unit) "}(${describeDate(
          start ?? DateTime.now(), true)} - ${describeDate(
          end ?? DateTime.now(), true)})";
    }
  }

  TimedRole._();
  factory TimedRole([void Function(TimedRoleBuilder) updates]) = _$TimedRole;
}