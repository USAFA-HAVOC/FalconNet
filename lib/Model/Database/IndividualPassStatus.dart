import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'IndividualPassStatus.g.dart';

abstract class IndividualPassStatus implements Built<IndividualPassStatus, IndividualPassStatusBuilder> {
  static Serializer<IndividualPassStatus> get serializer => _$individualPassStatusSerializer;

  String get user_id;
  String get name;
  bool get status;

  IndividualPassStatus._();
  factory IndividualPassStatus([void Function(IndividualPassStatusBuilder) updates]) = _$IndividualPassStatus;
}