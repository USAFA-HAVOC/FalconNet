// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
  ..add(C4CPassAllocation.serializer)
  ..add(CWOCViewData.serializer)
  ..add(Cadet.serializer)
  ..add(CadetPersonalInfo.serializer)
  ..add(DIRequest.serializer)
  ..add(LoginResponse.serializer)
  ..addBuilderFactory(
      const FullType(BuiltList, const [const FullType(Cadet)]),
          () => new ListBuilder<Cadet>()))
    .build();
Serializer<CadetPersonalInfo> _$cadetPersonalInfoSerializer =
new _$CadetPersonalInfoSerializer();
Serializer<DIRequest> _$dIRequestSerializer = new _$DIRequestSerializer();
Serializer<C4CPassAllocation> _$c4CPassAllocationSerializer =
new _$C4CPassAllocationSerializer();
Serializer<Cadet> _$cadetSerializer = new _$CadetSerializer();
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
      serializers.serialize(object.group, specifiedType: const FullType(int)),
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

class _$C4CPassAllocationSerializer
    implements StructuredSerializer<C4CPassAllocation> {
  @override
  final Iterable<Type> types = const [C4CPassAllocation, _$C4CPassAllocation];
  @override
  final String wireName = 'C4CPassAllocation';

  @override
  Iterable<Object?> serialize(Serializers serializers, C4CPassAllocation object,
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
    return result;
  }

  @override
  C4CPassAllocation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new C4CPassAllocationBuilder();

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
      }
    }

    return result.build();
  }
}

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
      'personal_info',
      serializers.serialize(object.personal_info,
          specifiedType: const FullType(CadetPersonalInfo)),
      'last_login',
      serializers.serialize(object.last_login,
          specifiedType: const FullType(DateTime)),
      'di_time',
      serializers.serialize(object.di_time,
          specifiedType: const FullType(DateTime)),
      'individual_pass_status',
      serializers.serialize(object.individual_pass_status,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pass_allocation;
    if (value != null) {
      result
        ..add('pass_allocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(C4CPassAllocation)));
    }
    value = object.di_signed_by;
    if (value != null) {
      result
        ..add('di_signed_by')
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
        case 'personal_info':
          result.personal_info.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetPersonalInfo))!
          as CadetPersonalInfo);
          break;
        case 'pass_allocation':
          result.pass_allocation.replace(serializers.deserialize(value,
              specifiedType: const FullType(C4CPassAllocation))!
          as C4CPassAllocation);
          break;
        case 'last_login':
          result.last_login = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'di_time':
          result.di_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'di_signed_by':
          result.di_signed_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'individual_pass_status':
          result.individual_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
              const FullType(BuiltList, const [const FullType(Cadet)]))!
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
  final int group;
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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, email.hashCode), full_name.hashCode),
                        phone_number.hashCode),
                    room_number.hashCode),
                squadron.hashCode),
            group.hashCode),
        unit.hashCode));
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

  int? _group;
  int? get group => _$this._group;
  set group(int? group) => _$this._group = group;

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
    return $jf($jc(0, cadet_id.hashCode));
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

class _$C4CPassAllocation extends C4CPassAllocation {
  @override
  final int? weekend_overnight_passes;
  @override
  final int? weekday_overnight_passes;
  @override
  final int? weekday_day_passes;

  factory _$C4CPassAllocation(
      [void Function(C4CPassAllocationBuilder)? updates]) =>
      (new C4CPassAllocationBuilder()..update(updates))._build();

  _$C4CPassAllocation._(
      {this.weekend_overnight_passes,
        this.weekday_overnight_passes,
        this.weekday_day_passes})
      : super._();

  @override
  C4CPassAllocation rebuild(void Function(C4CPassAllocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  C4CPassAllocationBuilder toBuilder() =>
      new C4CPassAllocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is C4CPassAllocation &&
        weekend_overnight_passes == other.weekend_overnight_passes &&
        weekday_overnight_passes == other.weekday_overnight_passes &&
        weekday_day_passes == other.weekday_day_passes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, weekend_overnight_passes.hashCode),
            weekday_overnight_passes.hashCode),
        weekday_day_passes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'C4CPassAllocation')
      ..add('weekend_overnight_passes', weekend_overnight_passes)
      ..add('weekday_overnight_passes', weekday_overnight_passes)
      ..add('weekday_day_passes', weekday_day_passes))
        .toString();
  }
}

class C4CPassAllocationBuilder
    implements Builder<C4CPassAllocation, C4CPassAllocationBuilder> {
  _$C4CPassAllocation? _$v;

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

  C4CPassAllocationBuilder();

  C4CPassAllocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weekend_overnight_passes = $v.weekend_overnight_passes;
      _weekday_overnight_passes = $v.weekday_overnight_passes;
      _weekday_day_passes = $v.weekday_day_passes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(C4CPassAllocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$C4CPassAllocation;
  }

  @override
  void update(void Function(C4CPassAllocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  C4CPassAllocation build() => _build();

  _$C4CPassAllocation _build() {
    final _$result = _$v ??
        new _$C4CPassAllocation._(
            weekend_overnight_passes: weekend_overnight_passes,
            weekday_overnight_passes: weekday_overnight_passes,
            weekday_day_passes: weekday_day_passes);
    replace(_$result);
    return _$result;
  }
}

class _$Cadet extends Cadet {
  @override
  final String id;
  @override
  final CadetPersonalInfo personal_info;
  @override
  final C4CPassAllocation? pass_allocation;
  @override
  final DateTime last_login;
  @override
  final DateTime di_time;
  @override
  final String? di_signed_by;
  @override
  final String individual_pass_status;
  @override
  final String? effective_pass_status;

  factory _$Cadet([void Function(CadetBuilder)? updates]) =>
      (new CadetBuilder()..update(updates))._build();

  _$Cadet._(
      {required this.id,
        required this.personal_info,
        this.pass_allocation,
        required this.last_login,
        required this.di_time,
        this.di_signed_by,
        required this.individual_pass_status,
        this.effective_pass_status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Cadet', 'id');
    BuiltValueNullFieldError.checkNotNull(
        personal_info, r'Cadet', 'personal_info');
    BuiltValueNullFieldError.checkNotNull(last_login, r'Cadet', 'last_login');
    BuiltValueNullFieldError.checkNotNull(di_time, r'Cadet', 'di_time');
    BuiltValueNullFieldError.checkNotNull(
        individual_pass_status, r'Cadet', 'individual_pass_status');
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
        personal_info == other.personal_info &&
        pass_allocation == other.pass_allocation &&
        last_login == other.last_login &&
        di_time == other.di_time &&
        di_signed_by == other.di_signed_by &&
        individual_pass_status == other.individual_pass_status &&
        effective_pass_status == other.effective_pass_status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), personal_info.hashCode),
                            pass_allocation.hashCode),
                        last_login.hashCode),
                    di_time.hashCode),
                di_signed_by.hashCode),
            individual_pass_status.hashCode),
        effective_pass_status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cadet')
      ..add('id', id)
      ..add('personal_info', personal_info)
      ..add('pass_allocation', pass_allocation)
      ..add('last_login', last_login)
      ..add('di_time', di_time)
      ..add('di_signed_by', di_signed_by)
      ..add('individual_pass_status', individual_pass_status)
      ..add('effective_pass_status', effective_pass_status))
        .toString();
  }
}

class CadetBuilder implements Builder<Cadet, CadetBuilder> {
  _$Cadet? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CadetPersonalInfoBuilder? _personal_info;
  CadetPersonalInfoBuilder get personal_info =>
      _$this._personal_info ??= new CadetPersonalInfoBuilder();
  set personal_info(CadetPersonalInfoBuilder? personal_info) =>
      _$this._personal_info = personal_info;

  C4CPassAllocationBuilder? _pass_allocation;
  C4CPassAllocationBuilder get pass_allocation =>
      _$this._pass_allocation ??= new C4CPassAllocationBuilder();
  set pass_allocation(C4CPassAllocationBuilder? pass_allocation) =>
      _$this._pass_allocation = pass_allocation;

  DateTime? _last_login;
  DateTime? get last_login => _$this._last_login;
  set last_login(DateTime? last_login) => _$this._last_login = last_login;

  DateTime? _di_time;
  DateTime? get di_time => _$this._di_time;
  set di_time(DateTime? di_time) => _$this._di_time = di_time;

  String? _di_signed_by;
  String? get di_signed_by => _$this._di_signed_by;
  set di_signed_by(String? di_signed_by) => _$this._di_signed_by = di_signed_by;

  String? _individual_pass_status;
  String? get individual_pass_status => _$this._individual_pass_status;
  set individual_pass_status(String? individual_pass_status) =>
      _$this._individual_pass_status = individual_pass_status;

  String? _effective_pass_status;
  String? get effective_pass_status => _$this._effective_pass_status;
  set effective_pass_status(String? effective_pass_status) =>
      _$this._effective_pass_status = effective_pass_status;

  CadetBuilder();

  CadetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _personal_info = $v.personal_info.toBuilder();
      _pass_allocation = $v.pass_allocation?.toBuilder();
      _last_login = $v.last_login;
      _di_time = $v.di_time;
      _di_signed_by = $v.di_signed_by;
      _individual_pass_status = $v.individual_pass_status;
      _effective_pass_status = $v.effective_pass_status;
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
    _$Cadet _$result;
    try {
      _$result = _$v ??
          new _$Cadet._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Cadet', 'id'),
              personal_info: personal_info.build(),
              pass_allocation: _pass_allocation?.build(),
              last_login: BuiltValueNullFieldError.checkNotNull(
                  last_login, r'Cadet', 'last_login'),
              di_time: BuiltValueNullFieldError.checkNotNull(
                  di_time, r'Cadet', 'di_time'),
              di_signed_by: di_signed_by,
              individual_pass_status: BuiltValueNullFieldError.checkNotNull(
                  individual_pass_status, r'Cadet', 'individual_pass_status'),
              effective_pass_status: effective_pass_status);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'personal_info';
        personal_info.build();
        _$failedField = 'pass_allocation';
        _pass_allocation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Cadet', _$failedField, e.toString());
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
  final BuiltList<Cadet> unit_members;

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
    return $jf($jc(
        $jc(
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
                                    unit_accountability_percent.hashCode),
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas