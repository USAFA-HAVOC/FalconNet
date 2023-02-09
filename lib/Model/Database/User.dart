import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

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
  BuiltList<String> get roles;

  User sign() {
    CadetAccountability signedAccountability =
      ((accountability ?? CadetAccountability()).toBuilder()..di_last_signed = DateTime.now()).build();
    return (toBuilder()..accountability = signedAccountability.toBuilder()).build();
  }

  String status() {
    var status = "unsigned";
    if (accountability != null) {
      if (accountability!.current_pass != null) {
        status = "out";
      }
      if (accountability!.di_last_signed != null) {
        if (DateTime.now().toUtc().difference(accountability!.di_last_signed!.toUtc()).compareTo(Duration(days: 1)) < 0) {
          status = "signed";
        }
      }
    }
    return status;
  }

  User._();
  factory User([Function(UserBuilder) updates]) = _$User;
}
