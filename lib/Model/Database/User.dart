import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';

import 'CadetAccountability.dart';
import 'CadetPassAllocation.dart';
import 'UserPersonalInfo.dart';


part 'User.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String? get id;
  UserPersonalInfo get personal_info;
  CadetPassAllocation? get pass_allocation;
  CadetAccountability? get accountability;
  DateTime? get last_login;
  BuiltList<TimedRole> get roles;

  User sign() {
    CadetAccountability signedAccountability =
      ((accountability ?? CadetAccountability()).toBuilder()..di_last_signed = DateTime.now()).build();
    return (toBuilder()..accountability = signedAccountability.toBuilder()).build();
  }

  String status() {
    if (accountability != null) {
      if (accountability!.current_leave?.departure_time.isBefore(DateTime.now()) ?? false) {
        return "leave";
      }
      else if (accountability!.current_pass != null) {
        return "out";
      }
      else if (accountability!.di_last_signed != null) {
        DateTime signature = accountability!.di_last_signed!.toLocal();
        DateTime present = DateTime.now().toLocal();
        if (signature.year == present.year && signature.month == present.month && signature.day == present.day) {
          return "signed";
        }
      }
    }
    return "unsigned";
  }

  String displayStatus() {
    switch (status()) {
      case "leave": return "On Leave";
      case "out": return "Signed-Out";
      case "signed": return "Signed DI";
      case "unsigned": return "Unsigned";
      default: throw Exception("Unknown Status Code");
    }
  }

  User._();
  factory User([Function(UserBuilder) updates]) = _$User;
}
