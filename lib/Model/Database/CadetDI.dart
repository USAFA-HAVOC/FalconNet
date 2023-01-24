import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'CadetDI.g.dart';

abstract class CadetDI implements Built<CadetDI, CadetDIBuilder> {
  static Serializer<CadetDI> get serializer => _$cadetDISerializer;

  DateTime? get last_signed;
  String? get signed_by;

  CadetDI._();
  factory CadetDI([void Function(CadetDIBuilder) updates]) = _$CadetDI;
}
