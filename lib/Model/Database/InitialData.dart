import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'AccountabilityEvent.dart';
import 'PassHistoryModel.dart';
import 'User.dart';
import 'UserGrades.dart';

part 'InitialData.g.dart';

abstract class InitialData implements Built<InitialData, InitialDataBuilder> {
  static Serializer<InitialData> get serializer => _$initialDataSerializer;

  User get user;
  UserGrades? get grades;
  PassHistoryModel? get pass_history;
  BuiltList<AccountabilityEvent>? get events;

  InitialData._();
  factory InitialData([void Function(InitialDataBuilder) updates]) = _$InitialData;
}