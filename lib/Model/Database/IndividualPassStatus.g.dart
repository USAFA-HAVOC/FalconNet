// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IndividualPassStatus.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IndividualPassStatus> _$individualPassStatusSerializer =
    new _$IndividualPassStatusSerializer();

class _$IndividualPassStatusSerializer
    implements StructuredSerializer<IndividualPassStatus> {
  @override
  final Iterable<Type> types = const [
    IndividualPassStatus,
    _$IndividualPassStatus
  ];
  @override
  final String wireName = 'IndividualPassStatus';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, IndividualPassStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'individual_pass_status',
      serializers.serialize(object.individual_pass_status,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  IndividualPassStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IndividualPassStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'individual_pass_status':
          result.individual_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$IndividualPassStatus extends IndividualPassStatus {
  @override
  final String user_id;
  @override
  final String name;
  @override
  final bool individual_pass_status;

  factory _$IndividualPassStatus(
          [void Function(IndividualPassStatusBuilder)? updates]) =>
      (new IndividualPassStatusBuilder()..update(updates))._build();

  _$IndividualPassStatus._(
      {required this.user_id,
      required this.name,
      required this.individual_pass_status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'IndividualPassStatus', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'IndividualPassStatus', 'name');
    BuiltValueNullFieldError.checkNotNull(individual_pass_status,
        r'IndividualPassStatus', 'individual_pass_status');
  }

  @override
  IndividualPassStatus rebuild(
          void Function(IndividualPassStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndividualPassStatusBuilder toBuilder() =>
      new IndividualPassStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndividualPassStatus &&
        user_id == other.user_id &&
        name == other.name &&
        individual_pass_status == other.individual_pass_status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, individual_pass_status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndividualPassStatus')
          ..add('user_id', user_id)
          ..add('name', name)
          ..add('individual_pass_status', individual_pass_status))
        .toString();
  }
}

class IndividualPassStatusBuilder
    implements Builder<IndividualPassStatus, IndividualPassStatusBuilder> {
  _$IndividualPassStatus? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _individual_pass_status;
  bool? get individual_pass_status => _$this._individual_pass_status;
  set individual_pass_status(bool? individual_pass_status) =>
      _$this._individual_pass_status = individual_pass_status;

  IndividualPassStatusBuilder();

  IndividualPassStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _name = $v.name;
      _individual_pass_status = $v.individual_pass_status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndividualPassStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndividualPassStatus;
  }

  @override
  void update(void Function(IndividualPassStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndividualPassStatus build() => _build();

  _$IndividualPassStatus _build() {
    final _$result = _$v ??
        new _$IndividualPassStatus._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'IndividualPassStatus', 'user_id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'IndividualPassStatus', 'name'),
            individual_pass_status: BuiltValueNullFieldError.checkNotNull(
                individual_pass_status,
                r'IndividualPassStatus',
                'individual_pass_status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
