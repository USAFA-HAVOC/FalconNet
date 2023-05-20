// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Attendee.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Attendee> _$attendeeSerializer = new _$AttendeeSerializer();

class _$AttendeeSerializer implements StructuredSerializer<Attendee> {
  @override
  final Iterable<Type> types = const [Attendee, _$Attendee];
  @override
  final String wireName = 'Attendee';

  @override
  Iterable<Object?> serialize(Serializers serializers, Attendee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.class_years;
    if (value != null) {
      result
        ..add('class_years')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  Attendee deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AttendeeBuilder();

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
        case 'class_years':
          result.class_years.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Attendee extends Attendee {
  @override
  final String type;
  @override
  final BuiltList<bool>? class_years;
  @override
  final BuiltList<String>? users;

  factory _$Attendee([void Function(AttendeeBuilder)? updates]) =>
      (new AttendeeBuilder()..update(updates))._build();

  _$Attendee._({required this.type, this.class_years, this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'Attendee', 'type');
  }

  @override
  Attendee rebuild(void Function(AttendeeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttendeeBuilder toBuilder() => new AttendeeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Attendee &&
        type == other.type &&
        class_years == other.class_years &&
        users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, class_years.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Attendee')
          ..add('type', type)
          ..add('class_years', class_years)
          ..add('users', users))
        .toString();
  }
}

class AttendeeBuilder implements Builder<Attendee, AttendeeBuilder> {
  _$Attendee? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ListBuilder<bool>? _class_years;
  ListBuilder<bool> get class_years =>
      _$this._class_years ??= new ListBuilder<bool>();
  set class_years(ListBuilder<bool>? class_years) =>
      _$this._class_years = class_years;

  ListBuilder<String>? _users;
  ListBuilder<String> get users => _$this._users ??= new ListBuilder<String>();
  set users(ListBuilder<String>? users) => _$this._users = users;

  AttendeeBuilder();

  AttendeeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _class_years = $v.class_years?.toBuilder();
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Attendee other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Attendee;
  }

  @override
  void update(void Function(AttendeeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Attendee build() => _build();

  _$Attendee _build() {
    _$Attendee _$result;
    try {
      _$result = _$v ??
          new _$Attendee._(
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'Attendee', 'type'),
              class_years: _class_years?.build(),
              users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'class_years';
        _class_years?.build();
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Attendee', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
