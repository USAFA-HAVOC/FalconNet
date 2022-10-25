library models;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'models.g.dart';

abstract class Cadet implements Built<Cadet, CadetBuilder> {
  static Serializer<Cadet> get serializer => _$cadetSerializer;

  String get id;
  String get first_name;
  String get last_name;
  String get room_num;
  bool get accountability;
  String get email;
  int get squadron;
  int get group;
  String get unit;

  Cadet._();
  factory Cadet([Function(CadetBuilder) updates]) = _$Cadet;
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
  double get squadron_accountability_percent;
  double get group_accountability_percent;
  double get wing_accountability_percent;
  int get squadron_members;
  int get group_members;
  int get wing_members;
  BuiltList<Cadet> get unit_members;

  CWOCViewData._();
  factory CWOCViewData([void Function(CWOCViewDataBuilder) updates]) = _$CWOCViewData;
}

@SerializersFor([
  Cadet,
  LoginResponse,
  CWOCViewData
])

final Serializers serializers =
    (
      _$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
    ).build();
