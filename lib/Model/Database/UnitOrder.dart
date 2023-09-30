import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UnitOrder.g.dart';

abstract class UnitOrder implements Built<UnitOrder, UnitOrderBuilder> {
  static Serializer<UnitOrder> get serializer => _$unitOrderSerializer;

  int get regular;
  int get vegetarian;

  UnitOrder._();
  factory UnitOrder([void Function(UnitOrderBuilder) updates]) = _$UnitOrder;
}