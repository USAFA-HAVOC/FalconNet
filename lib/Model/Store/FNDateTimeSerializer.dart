import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class FNDateTimeSerializer implements PrimitiveSerializer<DateTime> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType = FullType.unspecified}) {
    if (!dateTime.isUtc) {
      return dateTime.toUtc().toIso8601String();
    }

    return dateTime.toIso8601String();
  }

  @override
  DateTime deserialize(Serializers serializers, Object? serialized,
      {FullType specifiedType = FullType.unspecified}) {
      DateTime t = DateTime.parse(serialized as String);
      return t.add(t.timeZoneOffset).toUtc();
  }
}