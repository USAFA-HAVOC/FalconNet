import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'User.dart';

part 'CWOCViewData.g.dart';

abstract class CWOCViewData implements Built<CWOCViewData, CWOCViewDataBuilder> {
  static Serializer<CWOCViewData> get serializer => _$cWOCViewDataSerializer;

  String get unit;
  int get squadron;
  String get group;
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