library models;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'Models.g.dart';

abstract class CadetPersonalInfo implements Built<CadetPersonalInfo, CadetPersonalInfoBuilder> {
  static Serializer<CadetPersonalInfo> get serializer => _$cadetPersonalInfoSerializer;

  String get email;
  String get full_name;
  String get phone_number;
  String get room_number;
  int get squadron;
  String get group;
  String get unit;

  CadetPersonalInfo._();
  factory CadetPersonalInfo([void Function(CadetPersonalInfoBuilder) updates]) = _$CadetPersonalInfo;
}

abstract class DIRequest implements Built<DIRequest, DIRequestBuilder> {
  static Serializer<DIRequest> get serializer => _$dIRequestSerializer;

  String get cadet_id;

  DIRequest._();
  factory DIRequest([void Function(DIRequestBuilder) updates]) = _$DIRequest;
}

abstract class CadetDI implements Built<CadetDI, CadetDIBuilder> {
  static Serializer<CadetDI> get serializer => _$cadetDISerializer;

  DateTime? get last_signed;
  String? get signed_by;

  CadetDI._();
  factory CadetDI([void Function(CadetDIBuilder) updates]) = _$CadetDI;
}

abstract class CadetPassAllocation implements Built<CadetPassAllocation, CadetPassAllocationBuilder> {
  static Serializer<CadetPassAllocation> get serializer => _$cadetPassAllocationSerializer;

  int? get weekend_overnight_passes;
  int? get weekday_overnight_passes;
  int? get weekday_day_passes;
  String? get individual_pass_status;
  String? get effective_pass_status;

  CadetPassAllocation._();
  factory CadetPassAllocation([void Function(CadetPassAllocationBuilder) updates]) = _$CadetPassAllocation;
}

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String get id;
  CadetPersonalInfo get personal_info;
  CadetPassAllocation? get pass_allocation;
  CadetDI? get di;
  DateTime? get last_login;

  User._();
  factory User([Function(UserBuilder) updates]) = _$User;
}

abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {
  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;

  String get access_token;
  String get token_type;

  LoginResponse._();
  factory LoginResponse([void Function(LoginResponseBuilder) updates]) = _$LoginResponse;
}

abstract class CWOCViewData implements Built<CWOCViewData, CWOCViewDataBuilder> {
  static Serializer<CWOCViewData> get serializer => _$cWOCViewDataSerializer;

  String get unit;
  int get squadron;
  int get group;
  double get unit_accountability_percent;
  double get squadron_accountability_percent;
  double get group_accountability_percent;
  double get wing_accountability_percent;
  int get squadron_members;
  int get group_members;
  int get wing_members;
  BuiltList<User> get unit_members;

  CWOCViewData._();
  factory CWOCViewData([void Function(CWOCViewDataBuilder) updates]) = _$CWOCViewData;
}

@SerializersFor([
  CadetPersonalInfo,
  DIRequest,
  User,
  CadetDI,
  CadetPassAllocation,
  LoginResponse,
  CWOCViewData
])

final Serializers serializers =
(
    _$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
).build();