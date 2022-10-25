// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(CWOCViewData.serializer)
      ..add(Cadet.serializer)
      ..add(LoginResponse.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Cadet)]),
          () => new ListBuilder<Cadet>()))
    .build();
Serializer<Cadet> _$cadetSerializer = new _$CadetSerializer();
Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();
Serializer<CWOCViewData> _$cWOCViewDataSerializer =
    new _$CWOCViewDataSerializer();

class _$CadetSerializer implements StructuredSerializer<Cadet> {
  @override
  final Iterable<Type> types = const [Cadet, _$Cadet];
  @override
  final String wireName = 'Cadet';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cadet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'first_name',
      serializers.serialize(object.first_name,
          specifiedType: const FullType(String)),
      'last_name',
      serializers.serialize(object.last_name,
          specifiedType: const FullType(String)),
      'room_num',
      serializers.serialize(object.room_num,
          specifiedType: const FullType(String)),
      'accountability',
      serializers.serialize(object.accountability,
          specifiedType: const FullType(bool)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'squadron',
      serializers.serialize(object.squadron,
          specifiedType: const FullType(int)),
      'group',
      serializers.serialize(object.group, specifiedType: const FullType(int)),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Cadet deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'room_num':
          result.room_num = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'accountability':
          result.accountability = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'squadron':
          result.squadron = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const [LoginResponse, _$LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'access_token',
      serializers.serialize(object.access_token,
          specifiedType: const FullType(String)),
      'token_type',
      serializers.serialize(object.token_type,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'access_token':
          result.access_token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'token_type':
          result.token_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CWOCViewDataSerializer implements StructuredSerializer<CWOCViewData> {
  @override
  final Iterable<Type> types = const [CWOCViewData, _$CWOCViewData];
  @override
  final String wireName = 'CWOCViewData';

  @override
  Iterable<Object?> serialize(Serializers serializers, CWOCViewData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(String)),
      'squadron',
      serializers.serialize(object.squadron,
          specifiedType: const FullType(int)),
      'group',
      serializers.serialize(object.group, specifiedType: const FullType(int)),
      'squadron_accountability_percent',
      serializers.serialize(object.squadron_accountability_percent,
          specifiedType: const FullType(double)),
      'group_accountability_percent',
      serializers.serialize(object.group_accountability_percent,
          specifiedType: const FullType(double)),
      'wing_accountability_percent',
      serializers.serialize(object.wing_accountability_percent,
          specifiedType: const FullType(double)),
      'squadron_members',
      serializers.serialize(object.squadron_members,
          specifiedType: const FullType(int)),
      'group_members',
      serializers.serialize(object.group_members,
          specifiedType: const FullType(int)),
      'wing_members',
      serializers.serialize(object.wing_members,
          specifiedType: const FullType(int)),
      'unit_members',
      serializers.serialize(object.unit_members,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Cadet)])),
    ];

    return result;
  }

  @override
  CWOCViewData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CWOCViewDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'squadron':
          result.squadron = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'squadron_accountability_percent':
          result.squadron_accountability_percent = serializers.deserialize(
              value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'group_accountability_percent':
          result.group_accountability_percent = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'wing_accountability_percent':
          result.wing_accountability_percent = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'squadron_members':
          result.squadron_members = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group_members':
          result.group_members = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'wing_members':
          result.wing_members = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unit_members':
          result.unit_members.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Cadet)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Cadet extends Cadet {
  @override
  final String id;
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String room_num;
  @override
  final bool accountability;
  @override
  final String email;
  @override
  final int squadron;
  @override
  final int group;
  @override
  final String unit;

  factory _$Cadet([void Function(CadetBuilder)? updates]) =>
      (new CadetBuilder()..update(updates))._build();

  _$Cadet._(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.room_num,
      required this.accountability,
      required this.email,
      required this.squadron,
      required this.group,
      required this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Cadet', 'id');
    BuiltValueNullFieldError.checkNotNull(first_name, r'Cadet', 'first_name');
    BuiltValueNullFieldError.checkNotNull(last_name, r'Cadet', 'last_name');
    BuiltValueNullFieldError.checkNotNull(room_num, r'Cadet', 'room_num');
    BuiltValueNullFieldError.checkNotNull(
        accountability, r'Cadet', 'accountability');
    BuiltValueNullFieldError.checkNotNull(email, r'Cadet', 'email');
    BuiltValueNullFieldError.checkNotNull(squadron, r'Cadet', 'squadron');
    BuiltValueNullFieldError.checkNotNull(group, r'Cadet', 'group');
    BuiltValueNullFieldError.checkNotNull(unit, r'Cadet', 'unit');
  }

  @override
  Cadet rebuild(void Function(CadetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetBuilder toBuilder() => new CadetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cadet &&
        id == other.id &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        room_num == other.room_num &&
        accountability == other.accountability &&
        email == other.email &&
        squadron == other.squadron &&
        group == other.group &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), first_name.hashCode),
                                last_name.hashCode),
                            room_num.hashCode),
                        accountability.hashCode),
                    email.hashCode),
                squadron.hashCode),
            group.hashCode),
        unit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cadet')
          ..add('id', id)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('room_num', room_num)
          ..add('accountability', accountability)
          ..add('email', email)
          ..add('squadron', squadron)
          ..add('group', group)
          ..add('unit', unit))
        .toString();
  }
}

class CadetBuilder implements Builder<Cadet, CadetBuilder> {
  _$Cadet? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _room_num;
  String? get room_num => _$this._room_num;
  set room_num(String? room_num) => _$this._room_num = room_num;

  bool? _accountability;
  bool? get accountability => _$this._accountability;
  set accountability(bool? accountability) =>
      _$this._accountability = accountability;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  int? _squadron;
  int? get squadron => _$this._squadron;
  set squadron(int? squadron) => _$this._squadron = squadron;

  int? _group;
  int? get group => _$this._group;
  set group(int? group) => _$this._group = group;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  CadetBuilder();

  CadetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _room_num = $v.room_num;
      _accountability = $v.accountability;
      _email = $v.email;
      _squadron = $v.squadron;
      _group = $v.group;
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cadet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cadet;
  }

  @override
  void update(void Function(CadetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Cadet build() => _build();

  _$Cadet _build() {
    final _$result = _$v ??
        new _$Cadet._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Cadet', 'id'),
            first_name: BuiltValueNullFieldError.checkNotNull(
                first_name, r'Cadet', 'first_name'),
            last_name: BuiltValueNullFieldError.checkNotNull(
                last_name, r'Cadet', 'last_name'),
            room_num: BuiltValueNullFieldError.checkNotNull(
                room_num, r'Cadet', 'room_num'),
            accountability: BuiltValueNullFieldError.checkNotNull(
                accountability, r'Cadet', 'accountability'),
            email:
                BuiltValueNullFieldError.checkNotNull(email, r'Cadet', 'email'),
            squadron: BuiltValueNullFieldError.checkNotNull(
                squadron, r'Cadet', 'squadron'),
            group:
                BuiltValueNullFieldError.checkNotNull(group, r'Cadet', 'group'),
            unit:
                BuiltValueNullFieldError.checkNotNull(unit, r'Cadet', 'unit'));
    replace(_$result);
    return _$result;
  }
}

class _$LoginResponse extends LoginResponse {
  @override
  final String access_token;
  @override
  final String token_type;

  factory _$LoginResponse([void Function(LoginResponseBuilder)? updates]) =>
      (new LoginResponseBuilder()..update(updates))._build();

  _$LoginResponse._({required this.access_token, required this.token_type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        access_token, r'LoginResponse', 'access_token');
    BuiltValueNullFieldError.checkNotNull(
        token_type, r'LoginResponse', 'token_type');
  }

  @override
  LoginResponse rebuild(void Function(LoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse &&
        access_token == other.access_token &&
        token_type == other.token_type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, access_token.hashCode), token_type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginResponse')
          ..add('access_token', access_token)
          ..add('token_type', token_type))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse? _$v;

  String? _access_token;
  String? get access_token => _$this._access_token;
  set access_token(String? access_token) => _$this._access_token = access_token;

  String? _token_type;
  String? get token_type => _$this._token_type;
  set token_type(String? token_type) => _$this._token_type = token_type;

  LoginResponseBuilder();

  LoginResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _access_token = $v.access_token;
      _token_type = $v.token_type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void Function(LoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginResponse build() => _build();

  _$LoginResponse _build() {
    final _$result = _$v ??
        new _$LoginResponse._(
            access_token: BuiltValueNullFieldError.checkNotNull(
                access_token, r'LoginResponse', 'access_token'),
            token_type: BuiltValueNullFieldError.checkNotNull(
                token_type, r'LoginResponse', 'token_type'));
    replace(_$result);
    return _$result;
  }
}

class _$CWOCViewData extends CWOCViewData {
  @override
  final String unit;
  @override
  final int squadron;
  @override
  final int group;
  @override
  final double squadron_accountability_percent;
  @override
  final double group_accountability_percent;
  @override
  final double wing_accountability_percent;
  @override
  final int squadron_members;
  @override
  final int group_members;
  @override
  final int wing_members;
  @override
  final BuiltList<Cadet> unit_members;

  factory _$CWOCViewData([void Function(CWOCViewDataBuilder)? updates]) =>
      (new CWOCViewDataBuilder()..update(updates))._build();

  _$CWOCViewData._(
      {required this.unit,
      required this.squadron,
      required this.group,
      required this.squadron_accountability_percent,
      required this.group_accountability_percent,
      required this.wing_accountability_percent,
      required this.squadron_members,
      required this.group_members,
      required this.wing_members,
      required this.unit_members})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(unit, r'CWOCViewData', 'unit');
    BuiltValueNullFieldError.checkNotNull(
        squadron, r'CWOCViewData', 'squadron');
    BuiltValueNullFieldError.checkNotNull(group, r'CWOCViewData', 'group');
    BuiltValueNullFieldError.checkNotNull(squadron_accountability_percent,
        r'CWOCViewData', 'squadron_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(group_accountability_percent,
        r'CWOCViewData', 'group_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(wing_accountability_percent,
        r'CWOCViewData', 'wing_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(
        squadron_members, r'CWOCViewData', 'squadron_members');
    BuiltValueNullFieldError.checkNotNull(
        group_members, r'CWOCViewData', 'group_members');
    BuiltValueNullFieldError.checkNotNull(
        wing_members, r'CWOCViewData', 'wing_members');
    BuiltValueNullFieldError.checkNotNull(
        unit_members, r'CWOCViewData', 'unit_members');
  }

  @override
  CWOCViewData rebuild(void Function(CWOCViewDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CWOCViewDataBuilder toBuilder() => new CWOCViewDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CWOCViewData &&
        unit == other.unit &&
        squadron == other.squadron &&
        group == other.group &&
        squadron_accountability_percent ==
            other.squadron_accountability_percent &&
        group_accountability_percent == other.group_accountability_percent &&
        wing_accountability_percent == other.wing_accountability_percent &&
        squadron_members == other.squadron_members &&
        group_members == other.group_members &&
        wing_members == other.wing_members &&
        unit_members == other.unit_members;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, unit.hashCode),
                                        squadron.hashCode),
                                    group.hashCode),
                                squadron_accountability_percent.hashCode),
                            group_accountability_percent.hashCode),
                        wing_accountability_percent.hashCode),
                    squadron_members.hashCode),
                group_members.hashCode),
            wing_members.hashCode),
        unit_members.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CWOCViewData')
          ..add('unit', unit)
          ..add('squadron', squadron)
          ..add('group', group)
          ..add('squadron_accountability_percent',
              squadron_accountability_percent)
          ..add('group_accountability_percent', group_accountability_percent)
          ..add('wing_accountability_percent', wing_accountability_percent)
          ..add('squadron_members', squadron_members)
          ..add('group_members', group_members)
          ..add('wing_members', wing_members)
          ..add('unit_members', unit_members))
        .toString();
  }
}

class CWOCViewDataBuilder
    implements Builder<CWOCViewData, CWOCViewDataBuilder> {
  _$CWOCViewData? _$v;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  int? _squadron;
  int? get squadron => _$this._squadron;
  set squadron(int? squadron) => _$this._squadron = squadron;

  int? _group;
  int? get group => _$this._group;
  set group(int? group) => _$this._group = group;

  double? _squadron_accountability_percent;
  double? get squadron_accountability_percent =>
      _$this._squadron_accountability_percent;
  set squadron_accountability_percent(
          double? squadron_accountability_percent) =>
      _$this._squadron_accountability_percent = squadron_accountability_percent;

  double? _group_accountability_percent;
  double? get group_accountability_percent =>
      _$this._group_accountability_percent;
  set group_accountability_percent(double? group_accountability_percent) =>
      _$this._group_accountability_percent = group_accountability_percent;

  double? _wing_accountability_percent;
  double? get wing_accountability_percent =>
      _$this._wing_accountability_percent;
  set wing_accountability_percent(double? wing_accountability_percent) =>
      _$this._wing_accountability_percent = wing_accountability_percent;

  int? _squadron_members;
  int? get squadron_members => _$this._squadron_members;
  set squadron_members(int? squadron_members) =>
      _$this._squadron_members = squadron_members;

  int? _group_members;
  int? get group_members => _$this._group_members;
  set group_members(int? group_members) =>
      _$this._group_members = group_members;

  int? _wing_members;
  int? get wing_members => _$this._wing_members;
  set wing_members(int? wing_members) => _$this._wing_members = wing_members;

  ListBuilder<Cadet>? _unit_members;
  ListBuilder<Cadet> get unit_members =>
      _$this._unit_members ??= new ListBuilder<Cadet>();
  set unit_members(ListBuilder<Cadet>? unit_members) =>
      _$this._unit_members = unit_members;

  CWOCViewDataBuilder();

  CWOCViewDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unit = $v.unit;
      _squadron = $v.squadron;
      _group = $v.group;
      _squadron_accountability_percent = $v.squadron_accountability_percent;
      _group_accountability_percent = $v.group_accountability_percent;
      _wing_accountability_percent = $v.wing_accountability_percent;
      _squadron_members = $v.squadron_members;
      _group_members = $v.group_members;
      _wing_members = $v.wing_members;
      _unit_members = $v.unit_members.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CWOCViewData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CWOCViewData;
  }

  @override
  void update(void Function(CWOCViewDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CWOCViewData build() => _build();

  _$CWOCViewData _build() {
    _$CWOCViewData _$result;
    try {
      _$result = _$v ??
          new _$CWOCViewData._(
              unit: BuiltValueNullFieldError.checkNotNull(
                  unit, r'CWOCViewData', 'unit'),
              squadron: BuiltValueNullFieldError.checkNotNull(
                  squadron, r'CWOCViewData', 'squadron'),
              group: BuiltValueNullFieldError.checkNotNull(
                  group, r'CWOCViewData', 'group'),
              squadron_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  squadron_accountability_percent,
                  r'CWOCViewData',
                  'squadron_accountability_percent'),
              group_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  group_accountability_percent,
                  r'CWOCViewData',
                  'group_accountability_percent'),
              wing_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  wing_accountability_percent, r'CWOCViewData', 'wing_accountability_percent'),
              squadron_members: BuiltValueNullFieldError.checkNotNull(
                  squadron_members, r'CWOCViewData', 'squadron_members'),
              group_members: BuiltValueNullFieldError.checkNotNull(group_members, r'CWOCViewData', 'group_members'),
              wing_members: BuiltValueNullFieldError.checkNotNull(wing_members, r'CWOCViewData', 'wing_members'),
              unit_members: unit_members.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unit_members';
        unit_members.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CWOCViewData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
