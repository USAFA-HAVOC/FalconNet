import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'CadetPass.g.dart';

abstract class CadetPass implements Built<CadetPass, CadetPassBuilder> {
  static Serializer<CadetPass> get serializer => _$cadetPassSerializer;

  String? get id;
  String get cadet_id;
  String get pass_type;
  DateTime get start_time;
  DateTime get end_time;
  String get description;
  String? get sca_number;
  String get city;
  String get state;
  String get zip_code;

  CadetPass toUtc() {
    return rebuild((p) => p
        ..start_time = start_time.toUtc()
        ..end_time = end_time.toUtc()
    );
  }

  CadetPass toLocal() {
    return rebuild((p) => p
        ..end_time = end_time.toLocal()
        ..start_time = start_time.toLocal()
    );
  }

  CadetPass._();
  factory CadetPass([void Function(CadetPassBuilder) updates]) = _$CadetPass;
}
