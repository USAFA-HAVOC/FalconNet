import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'CadetPass.g.dart';

abstract class CadetPass implements Built<CadetPass, CadetPassBuilder> {
  static Serializer<CadetPass> get serializer => _$cadetPassSerializer;

  String get cadet_id;
  String get pass_type;
  DateTime get start_time;
  DateTime get end_time;
  String get description;
  String? get sca_number;
  String get city;
  String get state;
  String get zip_code;

  CadetPass._();
  factory CadetPass([void Function(CadetPassBuilder) updates]) = _$CadetPass;
}
