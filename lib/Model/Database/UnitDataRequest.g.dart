// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitDataRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitDataRequest> _$unitDataRequestSerializer =
    new _$UnitDataRequestSerializer();

class _$UnitDataRequestSerializer
    implements StructuredSerializer<UnitDataRequest> {
  @override
  final Iterable<Type> types = const [UnitDataRequest, _$UnitDataRequest];
  @override
  final String wireName = 'UnitDataRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitDataRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.unit;
    if (value != null) {
      result
        ..add('unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.event;
    if (value != null) {
      result
        ..add('event')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UnitDataRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitDataRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event':
          result.event = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitDataRequest extends UnitDataRequest {
  @override
  final String? unit;
  @override
  final String? event;

  factory _$UnitDataRequest([void Function(UnitDataRequestBuilder)? updates]) =>
      (new UnitDataRequestBuilder()..update(updates))._build();

  _$UnitDataRequest._({this.unit, this.event}) : super._();

  @override
  UnitDataRequest rebuild(void Function(UnitDataRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitDataRequestBuilder toBuilder() =>
      new UnitDataRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitDataRequest &&
        unit == other.unit &&
        event == other.event;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitDataRequest')
          ..add('unit', unit)
          ..add('event', event))
        .toString();
  }
}

class UnitDataRequestBuilder
    implements Builder<UnitDataRequest, UnitDataRequestBuilder> {
  _$UnitDataRequest? _$v;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  String? _event;
  String? get event => _$this._event;
  set event(String? event) => _$this._event = event;

  UnitDataRequestBuilder();

  UnitDataRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unit = $v.unit;
      _event = $v.event;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitDataRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitDataRequest;
  }

  @override
  void update(void Function(UnitDataRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitDataRequest build() => _build();

  _$UnitDataRequest _build() {
    final _$result = _$v ?? new _$UnitDataRequest._(unit: unit, event: event);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
