import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'TimedRole.g.dart';

abstract class TimedRole implements Built<TimedRole, TimedRoleBuilder> {
  static Serializer<TimedRole> get serializer => _$timedRoleSerializer;

  String get role;
  DateTime get start;
  DateTime get end;

  List<String> delegable() {
    List<String> delegates = ["sdo", "jdo", "unrecognized", "recognized", "signable"];
    switch (role) {
      case "fn_admin": {
        return ["fn_admin", "wing_admin", "unit_admin"] + delegates;
      }
      case "wing_admin": {
        return ["unit_admin"] + delegates;
      }
      case "unit_admin": return delegates;
    }
    return [];
  }

  bool isGreaterThan(TimedRole other) {
    switch (role) {
      case "fn_admin": {
        switch (other.role) {
          case "fn_admin": return false;
          default: return true;
        }
      }

      case "wing_admin": {
        switch (other.role) {
          case "wing_admin": return false;
          case "fn_admin": return false;
          default: return true;
        }
      }

      case "unit_admin": {
        switch (other.role) {
          case "unit_admin": return false;
          case "wing_admin": return false;
          case "fn_admin": return false;
          default: return true;
        }
      }

      default: return false;
    }
  }

  TimedRole._();
  factory TimedRole([void Function(TimedRoleBuilder) updates]) = _$TimedRole;
}