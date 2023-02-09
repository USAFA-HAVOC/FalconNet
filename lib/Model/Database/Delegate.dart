import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'TimedRole.dart';

part 'Delegate.g.dart';

abstract class Delegate implements Built<Delegate, DelegateBuilder> {
  static Serializer<Delegate> get serializer => _$delegateSerializer;

  String get id;
  String get name;
  BuiltList<TimedRole> get roles;

  Delegate._();
  factory Delegate([void Function(DelegateBuilder) updates]) = _$Delegate;
}