import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'CadetPass.dart';
import 'User.dart';
import 'UserEvent.dart';
import 'UserGrades.dart';

part 'InitialData.g.dart';

abstract class InitialData implements Built<InitialData, InitialDataBuilder> {
  static Serializer<InitialData> get serializer => _$initialDataSerializer;

  User get user;
  UserGrades? get grades;
  BuiltList<CadetPass>? get pass_history;
  BuiltList<UserEvent>? get events;

  InitialData._();
  factory InitialData([void Function(InitialDataBuilder) updates]) = _$InitialData;
}