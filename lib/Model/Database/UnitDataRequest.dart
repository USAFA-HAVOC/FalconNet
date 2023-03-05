import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UnitDataRequest.g.dart';

abstract class UnitDataRequest implements Built<UnitDataRequest, UnitDataRequestBuilder> {
  static Serializer<UnitDataRequest> get serializer => _$unitDataRequestSerializer;

  String get unit;

  UnitDataRequest._();
  factory UnitDataRequest([void Function(UnitDataRequestBuilder) updates]) = _$UnitDataRequest;
}