import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'CadetLeave.dart';
import 'CadetPass.dart';


part 'CadetAccountability.g.dart';

abstract class CadetAccountability implements Built<CadetAccountability, CadetAccountabilityBuilder> {
  static Serializer<CadetAccountability> get serializer => _$cadetAccountabilitySerializer;

  DateTime? get di_last_signed;
  String? get di_signed_by;
  String? get di_signed_name;
  CadetPass? get current_pass;
  CadetLeave? get current_leave;

  CadetAccountability._();
  factory CadetAccountability([void Function(CadetAccountabilityBuilder) updates]) = _$CadetAccountability;
}
