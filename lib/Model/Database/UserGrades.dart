import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'UserGrades.g.dart';

abstract class UserGrades implements Built<UserGrades, UserGradesBuilder> {
  static Serializer<UserGrades> get serializer => _$userGradesSerializer;

  UserGrades._();
  factory UserGrades([void Function(UserGradesBuilder) updates]) = _$UserGrades;
}
