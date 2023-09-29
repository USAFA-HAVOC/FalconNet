import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';

part 'UnitDataRequest.g.dart';

abstract class UnitDataRequest implements Built<UnitDataRequest, UnitDataRequestBuilder> {
  static Serializer<UnitDataRequest> get serializer => _$unitDataRequestSerializer;

  String? get unit;
  String? get event;

  static UnitDataRequest direct({String? unit, String? event}) => (
      UnitDataRequestBuilder()
        ..unit = unit
        ..event = event
  ).build();

  UnitDataRequest._();
  factory UnitDataRequest([void Function(UnitDataRequestBuilder) updates]) = _$UnitDataRequest;
}