import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';

import 'CadetAccountability.dart';
import 'UserPersonalInfo.dart';


part 'User.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String? get id;
  String get ms_oid;
  BuiltList<String> get units;
  String? get assigned_unit;
  UserPersonalInfo get personal_info;
  CadetAccountability? get accountability;
  DateTime? get last_login;
  BuiltList<TimedRole> get roles;

  /*
  User sign() {
    CadetAccountability signedAccountability =
      ((accountability ?? CadetAccountability()).toBuilder()..di_last_signed = DateTime.now()).build();
    return (toBuilder()..accountability = signedAccountability.toBuilder()).build();
  }
  */

  /*
  UserStatus status() {
    if (accountability != null) {
      if (accountability!.current_leave?.departure_time.isBefore(DateTime.now()) ?? false) {
        return UserStatus.leave;
      }
      else if (accountability!.current_pass != null) {
        return UserStatus.out;
      }
      else if (accountability!.di_last_signed != null) {
        DateTime signature = accountability!.di_last_signed!.toUtc().add(const Duration(hours: -6));
        DateTime present = DateTime.now().toUtc().add(const Duration(hours: -6));
        if (signature.year == present.year && signature.month == present.month && signature.day == present.day) {
          return UserStatus.signed;
        }
      }
    }
    return UserStatus.unsigned;
  }
   */

  //String displayStatus() => status().display();

  User._();
  factory User([Function(UserBuilder) updates]) = _$User;
}
