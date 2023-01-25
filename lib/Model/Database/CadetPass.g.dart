// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CadetPass.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CadetPass> _$cadetPassSerializer = new _$CadetPassSerializer();

class _$CadetPassSerializer implements StructuredSerializer<CadetPass> {
  @override
  final Iterable<Type> types = const [CadetPass, _$CadetPass];
  @override
  final String wireName = 'CadetPass';

  @override
  Iterable<Object?> serialize(Serializers serializers, CadetPass object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'cadet_id',
      serializers.serialize(object.cadet_id,
          specifiedType: const FullType(String)),
      'pass_type',
      serializers.serialize(object.pass_type,
          specifiedType: const FullType(String)),
      'start_time',
      serializers.serialize(object.start_time,
          specifiedType: const FullType(DateTime)),
      'end_time',
      serializers.serialize(object.end_time,
          specifiedType: const FullType(DateTime)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'zip_code',
      serializers.serialize(object.zip_code,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.sca_number;
    if (value != null) {
      result
        ..add('sca_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CadetPass deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetPassBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cadet_id':
          result.cadet_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pass_type':
          result.pass_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'start_time':
          result.start_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'end_time':
          result.end_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'sca_number':
          result.sca_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'zip_code':
          result.zip_code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CadetPass extends CadetPass {
  @override
  final String cadet_id;
  @override
  final String pass_type;
  @override
  final DateTime start_time;
  @override
  final DateTime end_time;
  @override
  final String description;
  @override
  final String? sca_number;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zip_code;

  factory _$CadetPass([void Function(CadetPassBuilder)? updates]) =>
      (new CadetPassBuilder()..update(updates))._build();

  _$CadetPass._(
      {required this.cadet_id,
      required this.pass_type,
      required this.start_time,
      required this.end_time,
      required this.description,
      this.sca_number,
      required this.city,
      required this.state,
      required this.zip_code})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(cadet_id, r'CadetPass', 'cadet_id');
    BuiltValueNullFieldError.checkNotNull(pass_type, r'CadetPass', 'pass_type');
    BuiltValueNullFieldError.checkNotNull(
        start_time, r'CadetPass', 'start_time');
    BuiltValueNullFieldError.checkNotNull(end_time, r'CadetPass', 'end_time');
    BuiltValueNullFieldError.checkNotNull(
        description, r'CadetPass', 'description');
    BuiltValueNullFieldError.checkNotNull(city, r'CadetPass', 'city');
    BuiltValueNullFieldError.checkNotNull(state, r'CadetPass', 'state');
    BuiltValueNullFieldError.checkNotNull(zip_code, r'CadetPass', 'zip_code');
  }

  @override
  CadetPass rebuild(void Function(CadetPassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetPassBuilder toBuilder() => new CadetPassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetPass &&
        cadet_id == other.cadet_id &&
        pass_type == other.pass_type &&
        start_time == other.start_time &&
        end_time == other.end_time &&
        description == other.description &&
        sca_number == other.sca_number &&
        city == other.city &&
        state == other.state &&
        zip_code == other.zip_code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cadet_id.hashCode);
    _$hash = $jc(_$hash, pass_type.hashCode);
    _$hash = $jc(_$hash, start_time.hashCode);
    _$hash = $jc(_$hash, end_time.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, sca_number.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, zip_code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetPass')
          ..add('cadet_id', cadet_id)
          ..add('pass_type', pass_type)
          ..add('start_time', start_time)
          ..add('end_time', end_time)
          ..add('description', description)
          ..add('sca_number', sca_number)
          ..add('city', city)
          ..add('state', state)
          ..add('zip_code', zip_code))
        .toString();
  }
}

class CadetPassBuilder implements Builder<CadetPass, CadetPassBuilder> {
  _$CadetPass? _$v;

  String? _cadet_id;
  String? get cadet_id => _$this._cadet_id;
  set cadet_id(String? cadet_id) => _$this._cadet_id = cadet_id;

  String? _pass_type;
  String? get pass_type => _$this._pass_type;
  set pass_type(String? pass_type) => _$this._pass_type = pass_type;

  DateTime? _start_time;
  DateTime? get start_time => _$this._start_time;
  set start_time(DateTime? start_time) => _$this._start_time = start_time;

  DateTime? _end_time;
  DateTime? get end_time => _$this._end_time;
  set end_time(DateTime? end_time) => _$this._end_time = end_time;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _sca_number;
  String? get sca_number => _$this._sca_number;
  set sca_number(String? sca_number) => _$this._sca_number = sca_number;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _zip_code;
  String? get zip_code => _$this._zip_code;
  set zip_code(String? zip_code) => _$this._zip_code = zip_code;

  CadetPassBuilder();

  CadetPassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cadet_id = $v.cadet_id;
      _pass_type = $v.pass_type;
      _start_time = $v.start_time;
      _end_time = $v.end_time;
      _description = $v.description;
      _sca_number = $v.sca_number;
      _city = $v.city;
      _state = $v.state;
      _zip_code = $v.zip_code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetPass other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetPass;
  }

  @override
  void update(void Function(CadetPassBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetPass build() => _build();

  _$CadetPass _build() {
    final _$result = _$v ??
        new _$CadetPass._(
            cadet_id: BuiltValueNullFieldError.checkNotNull(
                cadet_id, r'CadetPass', 'cadet_id'),
            pass_type: BuiltValueNullFieldError.checkNotNull(
                pass_type, r'CadetPass', 'pass_type'),
            start_time: BuiltValueNullFieldError.checkNotNull(
                start_time, r'CadetPass', 'start_time'),
            end_time: BuiltValueNullFieldError.checkNotNull(
                end_time, r'CadetPass', 'end_time'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'CadetPass', 'description'),
            sca_number: sca_number,
            city: BuiltValueNullFieldError.checkNotNull(
                city, r'CadetPass', 'city'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'CadetPass', 'state'),
            zip_code: BuiltValueNullFieldError.checkNotNull(
                zip_code, r'CadetPass', 'zip_code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
