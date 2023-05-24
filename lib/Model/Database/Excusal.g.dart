// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Excusal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Excusal> _$excusalSerializer = new _$ExcusalSerializer();
Serializer<EventExcusal> _$eventExcusalSerializer =
    new _$EventExcusalSerializer();
Serializer<RecurringExcusal> _$recurringExcusalSerializer =
    new _$RecurringExcusalSerializer();

class _$ExcusalSerializer implements StructuredSerializer<Excusal> {
  @override
  final Iterable<Type> types = const [Excusal, _$Excusal];
  @override
  final String wireName = 'Excusal';

  @override
  Iterable<Object?> serialize(Serializers serializers, Excusal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'sca_number',
      serializers.serialize(object.sca_number,
          specifiedType: const FullType(String)),
      'other_description',
      serializers.serialize(object.other_description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Excusal deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExcusalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'sca_number':
          result.sca_number = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'other_description':
          result.other_description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EventExcusalSerializer implements StructuredSerializer<EventExcusal> {
  @override
  final Iterable<Type> types = const [EventExcusal, _$EventExcusal];
  @override
  final String wireName = 'EventExcusal';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventExcusal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'event_id',
      serializers.serialize(object.event_id,
          specifiedType: const FullType(String)),
      'excusal',
      serializers.serialize(object.excusal,
          specifiedType: const FullType(Excusal)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EventExcusal deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventExcusalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'event_id':
          result.event_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'excusal':
          result.excusal.replace(serializers.deserialize(value,
              specifiedType: const FullType(Excusal))! as Excusal);
          break;
      }
    }

    return result.build();
  }
}

class _$RecurringExcusalSerializer
    implements StructuredSerializer<RecurringExcusal> {
  @override
  final Iterable<Type> types = const [RecurringExcusal, _$RecurringExcusal];
  @override
  final String wireName = 'RecurringExcusal';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecurringExcusal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'event_type',
      serializers.serialize(object.event_type,
          specifiedType: const FullType(String)),
      'excusal',
      serializers.serialize(object.excusal,
          specifiedType: const FullType(Excusal)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RecurringExcusal deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecurringExcusalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'event_type':
          result.event_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'excusal':
          result.excusal.replace(serializers.deserialize(value,
              specifiedType: const FullType(Excusal))! as Excusal);
          break;
      }
    }

    return result.build();
  }
}

class _$Excusal extends Excusal {
  @override
  final String type;
  @override
  final String sca_number;
  @override
  final String other_description;

  factory _$Excusal([void Function(ExcusalBuilder)? updates]) =>
      (new ExcusalBuilder()..update(updates))._build();

  _$Excusal._(
      {required this.type,
      required this.sca_number,
      required this.other_description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'Excusal', 'type');
    BuiltValueNullFieldError.checkNotNull(sca_number, r'Excusal', 'sca_number');
    BuiltValueNullFieldError.checkNotNull(
        other_description, r'Excusal', 'other_description');
  }

  @override
  Excusal rebuild(void Function(ExcusalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExcusalBuilder toBuilder() => new ExcusalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Excusal &&
        type == other.type &&
        sca_number == other.sca_number &&
        other_description == other.other_description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sca_number.hashCode);
    _$hash = $jc(_$hash, other_description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Excusal')
          ..add('type', type)
          ..add('sca_number', sca_number)
          ..add('other_description', other_description))
        .toString();
  }
}

class ExcusalBuilder implements Builder<Excusal, ExcusalBuilder> {
  _$Excusal? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _sca_number;
  String? get sca_number => _$this._sca_number;
  set sca_number(String? sca_number) => _$this._sca_number = sca_number;

  String? _other_description;
  String? get other_description => _$this._other_description;
  set other_description(String? other_description) =>
      _$this._other_description = other_description;

  ExcusalBuilder();

  ExcusalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _sca_number = $v.sca_number;
      _other_description = $v.other_description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Excusal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Excusal;
  }

  @override
  void update(void Function(ExcusalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Excusal build() => _build();

  _$Excusal _build() {
    final _$result = _$v ??
        new _$Excusal._(
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'Excusal', 'type'),
            sca_number: BuiltValueNullFieldError.checkNotNull(
                sca_number, r'Excusal', 'sca_number'),
            other_description: BuiltValueNullFieldError.checkNotNull(
                other_description, r'Excusal', 'other_description'));
    replace(_$result);
    return _$result;
  }
}

class _$EventExcusal extends EventExcusal {
  @override
  final String? id;
  @override
  final String user_id;
  @override
  final String event_id;
  @override
  final Excusal excusal;

  factory _$EventExcusal([void Function(EventExcusalBuilder)? updates]) =>
      (new EventExcusalBuilder()..update(updates))._build();

  _$EventExcusal._(
      {this.id,
      required this.user_id,
      required this.event_id,
      required this.excusal})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'EventExcusal', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        event_id, r'EventExcusal', 'event_id');
    BuiltValueNullFieldError.checkNotNull(excusal, r'EventExcusal', 'excusal');
  }

  @override
  EventExcusal rebuild(void Function(EventExcusalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventExcusalBuilder toBuilder() => new EventExcusalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventExcusal &&
        id == other.id &&
        user_id == other.user_id &&
        event_id == other.event_id &&
        excusal == other.excusal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, event_id.hashCode);
    _$hash = $jc(_$hash, excusal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventExcusal')
          ..add('id', id)
          ..add('user_id', user_id)
          ..add('event_id', event_id)
          ..add('excusal', excusal))
        .toString();
  }
}

class EventExcusalBuilder
    implements Builder<EventExcusal, EventExcusalBuilder> {
  _$EventExcusal? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _event_id;
  String? get event_id => _$this._event_id;
  set event_id(String? event_id) => _$this._event_id = event_id;

  ExcusalBuilder? _excusal;
  ExcusalBuilder get excusal => _$this._excusal ??= new ExcusalBuilder();
  set excusal(ExcusalBuilder? excusal) => _$this._excusal = excusal;

  EventExcusalBuilder();

  EventExcusalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user_id = $v.user_id;
      _event_id = $v.event_id;
      _excusal = $v.excusal.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventExcusal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventExcusal;
  }

  @override
  void update(void Function(EventExcusalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventExcusal build() => _build();

  _$EventExcusal _build() {
    _$EventExcusal _$result;
    try {
      _$result = _$v ??
          new _$EventExcusal._(
              id: id,
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'EventExcusal', 'user_id'),
              event_id: BuiltValueNullFieldError.checkNotNull(
                  event_id, r'EventExcusal', 'event_id'),
              excusal: excusal.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'excusal';
        excusal.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventExcusal', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RecurringExcusal extends RecurringExcusal {
  @override
  final String? id;
  @override
  final String user_id;
  @override
  final String event_type;
  @override
  final Excusal excusal;

  factory _$RecurringExcusal(
          [void Function(RecurringExcusalBuilder)? updates]) =>
      (new RecurringExcusalBuilder()..update(updates))._build();

  _$RecurringExcusal._(
      {this.id,
      required this.user_id,
      required this.event_type,
      required this.excusal})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'RecurringExcusal', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        event_type, r'RecurringExcusal', 'event_type');
    BuiltValueNullFieldError.checkNotNull(
        excusal, r'RecurringExcusal', 'excusal');
  }

  @override
  RecurringExcusal rebuild(void Function(RecurringExcusalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecurringExcusalBuilder toBuilder() =>
      new RecurringExcusalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecurringExcusal &&
        id == other.id &&
        user_id == other.user_id &&
        event_type == other.event_type &&
        excusal == other.excusal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, event_type.hashCode);
    _$hash = $jc(_$hash, excusal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecurringExcusal')
          ..add('id', id)
          ..add('user_id', user_id)
          ..add('event_type', event_type)
          ..add('excusal', excusal))
        .toString();
  }
}

class RecurringExcusalBuilder
    implements Builder<RecurringExcusal, RecurringExcusalBuilder> {
  _$RecurringExcusal? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _event_type;
  String? get event_type => _$this._event_type;
  set event_type(String? event_type) => _$this._event_type = event_type;

  ExcusalBuilder? _excusal;
  ExcusalBuilder get excusal => _$this._excusal ??= new ExcusalBuilder();
  set excusal(ExcusalBuilder? excusal) => _$this._excusal = excusal;

  RecurringExcusalBuilder();

  RecurringExcusalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user_id = $v.user_id;
      _event_type = $v.event_type;
      _excusal = $v.excusal.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecurringExcusal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecurringExcusal;
  }

  @override
  void update(void Function(RecurringExcusalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecurringExcusal build() => _build();

  _$RecurringExcusal _build() {
    _$RecurringExcusal _$result;
    try {
      _$result = _$v ??
          new _$RecurringExcusal._(
              id: id,
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'RecurringExcusal', 'user_id'),
              event_type: BuiltValueNullFieldError.checkNotNull(
                  event_type, r'RecurringExcusal', 'event_type'),
              excusal: excusal.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'excusal';
        excusal.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecurringExcusal', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
