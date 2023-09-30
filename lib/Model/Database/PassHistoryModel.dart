import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';

part 'PassHistoryModel.g.dart';

abstract class PassHistoryModel implements Built<PassHistoryModel, PassHistoryModelBuilder> {
  static Serializer<PassHistoryModel> get serializer => _$passHistoryModelSerializer;

  BuiltList<CadetPass> get history;

  PassHistoryModel._();
  factory PassHistoryModel([void Function(PassHistoryModelBuilder) updates]) = _$PassHistoryModel;
}