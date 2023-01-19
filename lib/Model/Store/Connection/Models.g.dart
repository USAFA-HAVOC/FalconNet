// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(CWOCViewData.serializer)
      ..add(CadetDI.serializer)
      ..add(CadetPassAllocation.serializer)
      ..add(CadetPersonalInfo.serializer)
      ..add(DIRequest.serializer)
      ..add(LoginResponse.serializer)
      ..add(User.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(User)]),
          () => new ListBuilder<User>()))
    .build();
Serializer<CadetPersonalInfo> _$cadetPersonalInfoSerializer =
    new _$CadetPersonalInfoSerializer();
Serializer<DIRequest> _$dIRequestSerializer = new _$DIRequestSerializer();
Serializer<CadetDI> _$cadetDISerializer = new _$CadetDISerializer();
Serializer<CadetPassAllocation> _$cadetPassAllocationSerializer =
    new _$CadetPassAllocationSerializer();
Serializer<User> _$userSerializer = new _$UserSerializer();
Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();
Serializer<CWOCViewData> _$cWOCViewDataSerializer =
    new _$CWOCViewDataSerializer();

class _$CadetPersonalInfoSerializer
    implements StructuredSerializer<CadetPersonalInfo> {
  @override
  final Iterable<Type> types = const [CadetPersonalInfo, _$CadetPersonalInfo];
  @override
  final String wireName = 'CadetPersonalInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, CadetPersonalInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'full_name',
      serializers.serialize(object.full_name,
          specifiedType: const FullType(String)),
      'phone_number',
      serializers.serialize(object.phone_number,
          specifiedType: const FullType(String)),
      'room_number',
      serializers.serialize(object.room_number,
          specifiedType: const FullType(String)),
      'squadron',
      serializers.serialize(object.squadron,
          specifiedType: const FullType(int)),
      'group',
      serializers.serialize(object.group,
          specifiedType: const FullType(String)),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CadetPersonalInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetPersonalInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'full_name':
          result.full_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone_number':
          result.phone_number = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'room_number':
          result.room_number = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'squadron':
          result.squadron = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$DIRequestSerializer implements StructuredSerializer<DIRequest> {
  @override
  final Iterable<Type> types = const [DIRequest, _$DIRequest];
  @override
  final String wireName = 'DIRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, DIRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'cadet_id',
      serializers.serialize(object.cadet_id,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DIRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DIRequestBuilder();

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
      }
    }

    return result.build();
  }
}

class _$CadetDISerializer implements StructuredSerializer<CadetDI> {
  @override
  final Iterable<Type> types = const [CadetDI, _$CadetDI];
  @override
  final String wireName = 'CadetDI';

  @override
  Iterable<Object?> serialize(Serializers serializers, CadetDI object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.last_signed;
    if (value != null) {
      result
        ..add('last_signed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.signed_by;
    if (value != null) {
      result
        ..add('signed_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CadetDI deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetDIBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'last_signed':
          result.last_signed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'signed_by':
          result.signed_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CadetPassAllocationSerializer
    implements StructuredSerializer<CadetPassAllocation> {
  @override
  final Iterable<Type> types = const [
    CadetPassAllocation,
    _$CadetPassAllocation
  ];
  @override
  final String wireName = 'CadetPassAllocation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CadetPassAllocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.weekend_overnight_passes;
    if (value != null) {
      result
        ..add('weekend_overnight_passes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekday_overnight_passes;
    if (value != null) {
      result
        ..add('weekday_overnight_passes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekday_day_passes;
    if (value != null) {
      result
        ..add('weekday_day_passes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.individual_pass_status;
    if (value != null) {
      result
        ..add('individual_pass_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.effective_pass_status;
    if (value != null) {
      result
        ..add('effective_pass_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CadetPassAllocation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetPassAllocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'weekend_overnight_passes':
          result.weekend_overnight_passes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weekday_overnight_passes':
          result.weekday_overnight_passes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weekday_day_passes':
          result.weekday_day_passes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'individual_pass_status':
          result.individual_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'effective_pass_status':
          result.effective_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'personal_info',
      serializers.serialize(object.personal_info,
          specifiedType: const FullType(CadetPersonalInfo)),
    ];
    Object? value;
    value = object.pass_allocation;
    if (value != null) {
      result
        ..add('pass_allocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetPassAllocation)));
    }
    value = object.di;
    if (value != null) {
      result
        ..add('di')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetDI)));
    }
    value = object.last_login;
    if (value != null) {
      result
        ..add('last_login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'personal_info':
          result.personal_info.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CadetPersonalInfo))!
              as CadetPersonalInfo);
          break;
        case 'pass_allocation':
          result.pass_allocation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CadetPassAllocation))!
              as CadetPassAllocation);
          break;
        case 'di':
          result.di.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetDI))! as CadetDI);
          break;
        case 'last_login':
          result.last_login = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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
      'unit_accountability_percent',
      serializers.serialize(object.unit_accountability_percent,
          specifiedType: const FullType(double)),
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
              const FullType(BuiltList, const [const FullType(User)])),
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
        case 'unit_accountability_percent':
          result.unit_accountability_percent = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
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
                      const FullType(BuiltList, const [const FullType(User)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CadetPersonalInfo extends CadetPersonalInfo {
  @override
  final String email;
  @override
  final String full_name;
  @override
  final String phone_number;
  @override
  final String room_number;
  @override
  final int squadron;
  @override
  final String group;
  @override
  final String unit;

  factory _$CadetPersonalInfo(
          [void Function(CadetPersonalInfoBuilder)? updates]) =>
      (new CadetPersonalInfoBuilder()..update(updates))._build();

  _$CadetPersonalInfo._(
      {required this.email,
      required this.full_name,
      required this.phone_number,
      required this.room_number,
      required this.squadron,
      required this.group,
      required this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'CadetPersonalInfo', 'email');
    BuiltValueNullFieldError.checkNotNull(
        full_name, r'CadetPersonalInfo', 'full_name');
    BuiltValueNullFieldError.checkNotNull(
        phone_number, r'CadetPersonalInfo', 'phone_number');
    BuiltValueNullFieldError.checkNotNull(
        room_number, r'CadetPersonalInfo', 'room_number');
    BuiltValueNullFieldError.checkNotNull(
        squadron, r'CadetPersonalInfo', 'squadron');
    BuiltValueNullFieldError.checkNotNull(group, r'CadetPersonalInfo', 'group');
    BuiltValueNullFieldError.checkNotNull(unit, r'CadetPersonalInfo', 'unit');
  }

  @override
  CadetPersonalInfo rebuild(void Function(CadetPersonalInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetPersonalInfoBuilder toBuilder() =>
      new CadetPersonalInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetPersonalInfo &&
        email == other.email &&
        full_name == other.full_name &&
        phone_number == other.phone_number &&
        room_number == other.room_number &&
        squadron == other.squadron &&
        group == other.group &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, full_name.hashCode);
    _$hash = $jc(_$hash, phone_number.hashCode);
    _$hash = $jc(_$hash, room_number.hashCode);
    _$hash = $jc(_$hash, squadron.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetPersonalInfo')
          ..add('email', email)
          ..add('full_name', full_name)
          ..add('phone_number', phone_number)
          ..add('room_number', room_number)
          ..add('squadron', squadron)
          ..add('group', group)
          ..add('unit', unit))
        .toString();
  }
}

class CadetPersonalInfoBuilder
    implements Builder<CadetPersonalInfo, CadetPersonalInfoBuilder> {
  _$CadetPersonalInfo? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _full_name;
  String? get full_name => _$this._full_name;
  set full_name(String? full_name) => _$this._full_name = full_name;

  String? _phone_number;
  String? get phone_number => _$this._phone_number;
  set phone_number(String? phone_number) => _$this._phone_number = phone_number;

  String? _room_number;
  String? get room_number => _$this._room_number;
  set room_number(String? room_number) => _$this._room_number = room_number;

  int? _squadron;
  int? get squadron => _$this._squadron;
  set squadron(int? squadron) => _$this._squadron = squadron;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  CadetPersonalInfoBuilder();

  CadetPersonalInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _full_name = $v.full_name;
      _phone_number = $v.phone_number;
      _room_number = $v.room_number;
      _squadron = $v.squadron;
      _group = $v.group;
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetPersonalInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetPersonalInfo;
  }

  @override
  void update(void Function(CadetPersonalInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetPersonalInfo build() => _build();

  _$CadetPersonalInfo _build() {
    final _$result = _$v ??
        new _$CadetPersonalInfo._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'CadetPersonalInfo', 'email'),
            full_name: BuiltValueNullFieldError.checkNotNull(
                full_name, r'CadetPersonalInfo', 'full_name'),
            phone_number: BuiltValueNullFieldError.checkNotNull(
                phone_number, r'CadetPersonalInfo', 'phone_number'),
            room_number: BuiltValueNullFieldError.checkNotNull(
                room_number, r'CadetPersonalInfo', 'room_number'),
            squadron: BuiltValueNullFieldError.checkNotNull(
                squadron, r'CadetPersonalInfo', 'squadron'),
            group: BuiltValueNullFieldError.checkNotNull(
                group, r'CadetPersonalInfo', 'group'),
            unit: BuiltValueNullFieldError.checkNotNull(
                unit, r'CadetPersonalInfo', 'unit'));
    replace(_$result);
    return _$result;
  }
}

class _$DIRequest extends DIRequest {
  @override
  final String cadet_id;

  factory _$DIRequest([void Function(DIRequestBuilder)? updates]) =>
      (new DIRequestBuilder()..update(updates))._build();

  _$DIRequest._({required this.cadet_id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(cadet_id, r'DIRequest', 'cadet_id');
  }

  @override
  DIRequest rebuild(void Function(DIRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DIRequestBuilder toBuilder() => new DIRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DIRequest && cadet_id == other.cadet_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cadet_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DIRequest')
          ..add('cadet_id', cadet_id))
        .toString();
  }
}

class DIRequestBuilder implements Builder<DIRequest, DIRequestBuilder> {
  _$DIRequest? _$v;

  String? _cadet_id;
  String? get cadet_id => _$this._cadet_id;
  set cadet_id(String? cadet_id) => _$this._cadet_id = cadet_id;

  DIRequestBuilder();

  DIRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cadet_id = $v.cadet_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DIRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DIRequest;
  }

  @override
  void update(void Function(DIRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DIRequest build() => _build();

  _$DIRequest _build() {
    final _$result = _$v ??
        new _$DIRequest._(
            cadet_id: BuiltValueNullFieldError.checkNotNull(
                cadet_id, r'DIRequest', 'cadet_id'));
    replace(_$result);
    return _$result;
  }
}

class _$CadetDI extends CadetDI {
  @override
  final DateTime? last_signed;
  @override
  final String? signed_by;

  factory _$CadetDI([void Function(CadetDIBuilder)? updates]) =>
      (new CadetDIBuilder()..update(updates))._build();

  _$CadetDI._({this.last_signed, this.signed_by}) : super._();

  @override
  CadetDI rebuild(void Function(CadetDIBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetDIBuilder toBuilder() => new CadetDIBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetDI &&
        last_signed == other.last_signed &&
        signed_by == other.signed_by;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, last_signed.hashCode);
    _$hash = $jc(_$hash, signed_by.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetDI')
          ..add('last_signed', last_signed)
          ..add('signed_by', signed_by))
        .toString();
  }
}

class CadetDIBuilder implements Builder<CadetDI, CadetDIBuilder> {
  _$CadetDI? _$v;

  DateTime? _last_signed;
  DateTime? get last_signed => _$this._last_signed;
  set last_signed(DateTime? last_signed) => _$this._last_signed = last_signed;

  String? _signed_by;
  String? get signed_by => _$this._signed_by;
  set signed_by(String? signed_by) => _$this._signed_by = signed_by;

  CadetDIBuilder();

  CadetDIBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _last_signed = $v.last_signed;
      _signed_by = $v.signed_by;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetDI other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetDI;
  }

  @override
  void update(void Function(CadetDIBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetDI build() => _build();

  _$CadetDI _build() {
    final _$result =
        _$v ?? new _$CadetDI._(last_signed: last_signed, signed_by: signed_by);
    replace(_$result);
    return _$result;
  }
}

class _$CadetPassAllocation extends CadetPassAllocation {
  @override
  final int? weekend_overnight_passes;
  @override
  final int? weekday_overnight_passes;
  @override
  final int? weekday_day_passes;
  @override
  final String? individual_pass_status;
  @override
  final String? effective_pass_status;

  factory _$CadetPassAllocation(
          [void Function(CadetPassAllocationBuilder)? updates]) =>
      (new CadetPassAllocationBuilder()..update(updates))._build();

  _$CadetPassAllocation._(
      {this.weekend_overnight_passes,
      this.weekday_overnight_passes,
      this.weekday_day_passes,
      this.individual_pass_status,
      this.effective_pass_status})
      : super._();

  @override
  CadetPassAllocation rebuild(
          void Function(CadetPassAllocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetPassAllocationBuilder toBuilder() =>
      new CadetPassAllocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetPassAllocation &&
        weekend_overnight_passes == other.weekend_overnight_passes &&
        weekday_overnight_passes == other.weekday_overnight_passes &&
        weekday_day_passes == other.weekday_day_passes &&
        individual_pass_status == other.individual_pass_status &&
        effective_pass_status == other.effective_pass_status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weekend_overnight_passes.hashCode);
    _$hash = $jc(_$hash, weekday_overnight_passes.hashCode);
    _$hash = $jc(_$hash, weekday_day_passes.hashCode);
    _$hash = $jc(_$hash, individual_pass_status.hashCode);
    _$hash = $jc(_$hash, effective_pass_status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetPassAllocation')
          ..add('weekend_overnight_passes', weekend_overnight_passes)
          ..add('weekday_overnight_passes', weekday_overnight_passes)
          ..add('weekday_day_passes', weekday_day_passes)
          ..add('individual_pass_status', individual_pass_status)
          ..add('effective_pass_status', effective_pass_status))
        .toString();
  }
}

class CadetPassAllocationBuilder
    implements Builder<CadetPassAllocation, CadetPassAllocationBuilder> {
  _$CadetPassAllocation? _$v;

  int? _weekend_overnight_passes;
  int? get weekend_overnight_passes => _$this._weekend_overnight_passes;
  set weekend_overnight_passes(int? weekend_overnight_passes) =>
      _$this._weekend_overnight_passes = weekend_overnight_passes;

  int? _weekday_overnight_passes;
  int? get weekday_overnight_passes => _$this._weekday_overnight_passes;
  set weekday_overnight_passes(int? weekday_overnight_passes) =>
      _$this._weekday_overnight_passes = weekday_overnight_passes;

  int? _weekday_day_passes;
  int? get weekday_day_passes => _$this._weekday_day_passes;
  set weekday_day_passes(int? weekday_day_passes) =>
      _$this._weekday_day_passes = weekday_day_passes;

  String? _individual_pass_status;
  String? get individual_pass_status => _$this._individual_pass_status;
  set individual_pass_status(String? individual_pass_status) =>
      _$this._individual_pass_status = individual_pass_status;

  String? _effective_pass_status;
  String? get effective_pass_status => _$this._effective_pass_status;
  set effective_pass_status(String? effective_pass_status) =>
      _$this._effective_pass_status = effective_pass_status;

  CadetPassAllocationBuilder();

  CadetPassAllocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weekend_overnight_passes = $v.weekend_overnight_passes;
      _weekday_overnight_passes = $v.weekday_overnight_passes;
      _weekday_day_passes = $v.weekday_day_passes;
      _individual_pass_status = $v.individual_pass_status;
      _effective_pass_status = $v.effective_pass_status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetPassAllocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetPassAllocation;
  }

  @override
  void update(void Function(CadetPassAllocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetPassAllocation build() => _build();

  _$CadetPassAllocation _build() {
    final _$result = _$v ??
        new _$CadetPassAllocation._(
            weekend_overnight_passes: weekend_overnight_passes,
            weekday_overnight_passes: weekday_overnight_passes,
            weekday_day_passes: weekday_day_passes,
            individual_pass_status: individual_pass_status,
            effective_pass_status: effective_pass_status);
    replace(_$result);
    return _$result;
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final CadetPersonalInfo personal_info;
  @override
  final CadetPassAllocation? pass_allocation;
  @override
  final CadetDI? di;
  @override
  final DateTime? last_login;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {required this.id,
      required this.personal_info,
      this.pass_allocation,
      this.di,
      this.last_login})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'User', 'id');
    BuiltValueNullFieldError.checkNotNull(
        personal_info, r'User', 'personal_info');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        personal_info == other.personal_info &&
        pass_allocation == other.pass_allocation &&
        di == other.di &&
        last_login == other.last_login;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, personal_info.hashCode);
    _$hash = $jc(_$hash, pass_allocation.hashCode);
    _$hash = $jc(_$hash, di.hashCode);
    _$hash = $jc(_$hash, last_login.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('personal_info', personal_info)
          ..add('pass_allocation', pass_allocation)
          ..add('di', di)
          ..add('last_login', last_login))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CadetPersonalInfoBuilder? _personal_info;
  CadetPersonalInfoBuilder get personal_info =>
      _$this._personal_info ??= new CadetPersonalInfoBuilder();
  set personal_info(CadetPersonalInfoBuilder? personal_info) =>
      _$this._personal_info = personal_info;

  CadetPassAllocationBuilder? _pass_allocation;
  CadetPassAllocationBuilder get pass_allocation =>
      _$this._pass_allocation ??= new CadetPassAllocationBuilder();
  set pass_allocation(CadetPassAllocationBuilder? pass_allocation) =>
      _$this._pass_allocation = pass_allocation;

  CadetDIBuilder? _di;
  CadetDIBuilder get di => _$this._di ??= new CadetDIBuilder();
  set di(CadetDIBuilder? di) => _$this._di = di;

  DateTime? _last_login;
  DateTime? get last_login => _$this._last_login;
  set last_login(DateTime? last_login) => _$this._last_login = last_login;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _personal_info = $v.personal_info.toBuilder();
      _pass_allocation = $v.pass_allocation?.toBuilder();
      _di = $v.di?.toBuilder();
      _last_login = $v.last_login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'User', 'id'),
              personal_info: personal_info.build(),
              pass_allocation: _pass_allocation?.build(),
              di: _di?.build(),
              last_login: last_login);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'personal_info';
        personal_info.build();
        _$failedField = 'pass_allocation';
        _pass_allocation?.build();
        _$failedField = 'di';
        _di?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'User', _$failedField, e.toString());
      }
      rethrow;
    }
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
    var _$hash = 0;
    _$hash = $jc(_$hash, access_token.hashCode);
    _$hash = $jc(_$hash, token_type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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
  final double unit_accountability_percent;
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
  final BuiltList<User> unit_members;

  factory _$CWOCViewData([void Function(CWOCViewDataBuilder)? updates]) =>
      (new CWOCViewDataBuilder()..update(updates))._build();

  _$CWOCViewData._(
      {required this.unit,
      required this.squadron,
      required this.group,
      required this.unit_accountability_percent,
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
    BuiltValueNullFieldError.checkNotNull(unit_accountability_percent,
        r'CWOCViewData', 'unit_accountability_percent');
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
        unit_accountability_percent == other.unit_accountability_percent &&
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
    var _$hash = 0;
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, squadron.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, unit_accountability_percent.hashCode);
    _$hash = $jc(_$hash, squadron_accountability_percent.hashCode);
    _$hash = $jc(_$hash, group_accountability_percent.hashCode);
    _$hash = $jc(_$hash, wing_accountability_percent.hashCode);
    _$hash = $jc(_$hash, squadron_members.hashCode);
    _$hash = $jc(_$hash, group_members.hashCode);
    _$hash = $jc(_$hash, wing_members.hashCode);
    _$hash = $jc(_$hash, unit_members.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CWOCViewData')
          ..add('unit', unit)
          ..add('squadron', squadron)
          ..add('group', group)
          ..add('unit_accountability_percent', unit_accountability_percent)
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

  double? _unit_accountability_percent;
  double? get unit_accountability_percent =>
      _$this._unit_accountability_percent;
  set unit_accountability_percent(double? unit_accountability_percent) =>
      _$this._unit_accountability_percent = unit_accountability_percent;

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

  ListBuilder<User>? _unit_members;
  ListBuilder<User> get unit_members =>
      _$this._unit_members ??= new ListBuilder<User>();
  set unit_members(ListBuilder<User>? unit_members) =>
      _$this._unit_members = unit_members;

  CWOCViewDataBuilder();

  CWOCViewDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unit = $v.unit;
      _squadron = $v.squadron;
      _group = $v.group;
      _unit_accountability_percent = $v.unit_accountability_percent;
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
              unit_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  unit_accountability_percent, r'CWOCViewData', 'unit_accountability_percent'),
              squadron_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  squadron_accountability_percent, r'CWOCViewData', 'squadron_accountability_percent'),
              group_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  group_accountability_percent, r'CWOCViewData', 'group_accountability_percent'),
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
