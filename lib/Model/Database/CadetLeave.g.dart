// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CadetLeave.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CadetLeaveTransportMethod> _$cadetLeaveTransportMethodSerializer =
    new _$CadetLeaveTransportMethodSerializer();
Serializer<CadetLeave> _$cadetLeaveSerializer = new _$CadetLeaveSerializer();

class _$CadetLeaveTransportMethodSerializer
    implements StructuredSerializer<CadetLeaveTransportMethod> {
  @override
  final Iterable<Type> types = const [
    CadetLeaveTransportMethod,
    _$CadetLeaveTransportMethod
  ];
  @override
  final String wireName = 'CadetLeaveTransportMethod';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CadetLeaveTransportMethod object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'transport_type',
      serializers.serialize(object.transport_type,
          specifiedType: const FullType(String)),
      'airline_name',
      serializers.serialize(object.airline_name,
          specifiedType: const FullType(String)),
      'airline_flight_number',
      serializers.serialize(object.airline_flight_number,
          specifiedType: const FullType(String)),
      'airline_flight_departure_time',
      serializers.serialize(object.airline_flight_departure_time,
          specifiedType: const FullType(DateTime)),
      'airline_flight_arrival_time',
      serializers.serialize(object.airline_flight_arrival_time,
          specifiedType: const FullType(DateTime)),
      'vehicle_type',
      serializers.serialize(object.vehicle_type,
          specifiedType: const FullType(String)),
      'vehicle_travel_time_hours',
      serializers.serialize(object.vehicle_travel_time_hours,
          specifiedType: const FullType(double)),
      'vehicle_driver_name',
      serializers.serialize(object.vehicle_driver_name,
          specifiedType: const FullType(String)),
      'other_info',
      serializers.serialize(object.other_info,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CadetLeaveTransportMethod deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetLeaveTransportMethodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'transport_type':
          result.transport_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'airline_name':
          result.airline_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'airline_flight_number':
          result.airline_flight_number = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'airline_flight_departure_time':
          result.airline_flight_departure_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'airline_flight_arrival_time':
          result.airline_flight_arrival_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'vehicle_type':
          result.vehicle_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vehicle_travel_time_hours':
          result.vehicle_travel_time_hours = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'vehicle_driver_name':
          result.vehicle_driver_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'other_info':
          result.other_info = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CadetLeaveSerializer implements StructuredSerializer<CadetLeave> {
  @override
  final Iterable<Type> types = const [CadetLeave, _$CadetLeave];
  @override
  final String wireName = 'CadetLeave';

  @override
  Iterable<Object?> serialize(Serializers serializers, CadetLeave object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'cadet_id',
      serializers.serialize(object.cadet_id,
          specifiedType: const FullType(String)),
      'departure_time',
      serializers.serialize(object.departure_time,
          specifiedType: const FullType(DateTime)),
      'return_time',
      serializers.serialize(object.return_time,
          specifiedType: const FullType(DateTime)),
      'final_address',
      serializers.serialize(object.final_address,
          specifiedType: const FullType(String)),
      'final_city',
      serializers.serialize(object.final_city,
          specifiedType: const FullType(String)),
      'final_state',
      serializers.serialize(object.final_state,
          specifiedType: const FullType(String)),
      'final_zip',
      serializers.serialize(object.final_zip,
          specifiedType: const FullType(String)),
      'emergency_contact_name',
      serializers.serialize(object.emergency_contact_name,
          specifiedType: const FullType(String)),
      'emergency_contact_phone',
      serializers.serialize(object.emergency_contact_phone,
          specifiedType: const FullType(String)),
      'departure_method',
      serializers.serialize(object.departure_method,
          specifiedType: const FullType(CadetLeaveTransportMethod)),
      'return_method',
      serializers.serialize(object.return_method,
          specifiedType: const FullType(CadetLeaveTransportMethod)),
    ];

    return result;
  }

  @override
  CadetLeave deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetLeaveBuilder();

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
        case 'departure_time':
          result.departure_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'return_time':
          result.return_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'final_address':
          result.final_address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'final_city':
          result.final_city = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'final_state':
          result.final_state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'final_zip':
          result.final_zip = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'emergency_contact_name':
          result.emergency_contact_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'emergency_contact_phone':
          result.emergency_contact_phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'departure_method':
          result.departure_method.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CadetLeaveTransportMethod))!
              as CadetLeaveTransportMethod);
          break;
        case 'return_method':
          result.return_method.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CadetLeaveTransportMethod))!
              as CadetLeaveTransportMethod);
          break;
      }
    }

    return result.build();
  }
}

class _$CadetLeaveTransportMethod extends CadetLeaveTransportMethod {
  @override
  final String transport_type;
  @override
  final String airline_name;
  @override
  final String airline_flight_number;
  @override
  final DateTime airline_flight_departure_time;
  @override
  final DateTime airline_flight_arrival_time;
  @override
  final String vehicle_type;
  @override
  final double vehicle_travel_time_hours;
  @override
  final String vehicle_driver_name;
  @override
  final String other_info;

  factory _$CadetLeaveTransportMethod(
          [void Function(CadetLeaveTransportMethodBuilder)? updates]) =>
      (new CadetLeaveTransportMethodBuilder()..update(updates))._build();

  _$CadetLeaveTransportMethod._(
      {required this.transport_type,
      required this.airline_name,
      required this.airline_flight_number,
      required this.airline_flight_departure_time,
      required this.airline_flight_arrival_time,
      required this.vehicle_type,
      required this.vehicle_travel_time_hours,
      required this.vehicle_driver_name,
      required this.other_info})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        transport_type, r'CadetLeaveTransportMethod', 'transport_type');
    BuiltValueNullFieldError.checkNotNull(
        airline_name, r'CadetLeaveTransportMethod', 'airline_name');
    BuiltValueNullFieldError.checkNotNull(airline_flight_number,
        r'CadetLeaveTransportMethod', 'airline_flight_number');
    BuiltValueNullFieldError.checkNotNull(airline_flight_departure_time,
        r'CadetLeaveTransportMethod', 'airline_flight_departure_time');
    BuiltValueNullFieldError.checkNotNull(airline_flight_arrival_time,
        r'CadetLeaveTransportMethod', 'airline_flight_arrival_time');
    BuiltValueNullFieldError.checkNotNull(
        vehicle_type, r'CadetLeaveTransportMethod', 'vehicle_type');
    BuiltValueNullFieldError.checkNotNull(vehicle_travel_time_hours,
        r'CadetLeaveTransportMethod', 'vehicle_travel_time_hours');
    BuiltValueNullFieldError.checkNotNull(vehicle_driver_name,
        r'CadetLeaveTransportMethod', 'vehicle_driver_name');
    BuiltValueNullFieldError.checkNotNull(
        other_info, r'CadetLeaveTransportMethod', 'other_info');
  }

  @override
  CadetLeaveTransportMethod rebuild(
          void Function(CadetLeaveTransportMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetLeaveTransportMethodBuilder toBuilder() =>
      new CadetLeaveTransportMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetLeaveTransportMethod &&
        transport_type == other.transport_type &&
        airline_name == other.airline_name &&
        airline_flight_number == other.airline_flight_number &&
        airline_flight_departure_time == other.airline_flight_departure_time &&
        airline_flight_arrival_time == other.airline_flight_arrival_time &&
        vehicle_type == other.vehicle_type &&
        vehicle_travel_time_hours == other.vehicle_travel_time_hours &&
        vehicle_driver_name == other.vehicle_driver_name &&
        other_info == other.other_info;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transport_type.hashCode);
    _$hash = $jc(_$hash, airline_name.hashCode);
    _$hash = $jc(_$hash, airline_flight_number.hashCode);
    _$hash = $jc(_$hash, airline_flight_departure_time.hashCode);
    _$hash = $jc(_$hash, airline_flight_arrival_time.hashCode);
    _$hash = $jc(_$hash, vehicle_type.hashCode);
    _$hash = $jc(_$hash, vehicle_travel_time_hours.hashCode);
    _$hash = $jc(_$hash, vehicle_driver_name.hashCode);
    _$hash = $jc(_$hash, other_info.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetLeaveTransportMethod')
          ..add('transport_type', transport_type)
          ..add('airline_name', airline_name)
          ..add('airline_flight_number', airline_flight_number)
          ..add('airline_flight_departure_time', airline_flight_departure_time)
          ..add('airline_flight_arrival_time', airline_flight_arrival_time)
          ..add('vehicle_type', vehicle_type)
          ..add('vehicle_travel_time_hours', vehicle_travel_time_hours)
          ..add('vehicle_driver_name', vehicle_driver_name)
          ..add('other_info', other_info))
        .toString();
  }
}

class CadetLeaveTransportMethodBuilder
    implements
        Builder<CadetLeaveTransportMethod, CadetLeaveTransportMethodBuilder> {
  _$CadetLeaveTransportMethod? _$v;

  String? _transport_type;
  String? get transport_type => _$this._transport_type;
  set transport_type(String? transport_type) =>
      _$this._transport_type = transport_type;

  String? _airline_name;
  String? get airline_name => _$this._airline_name;
  set airline_name(String? airline_name) => _$this._airline_name = airline_name;

  String? _airline_flight_number;
  String? get airline_flight_number => _$this._airline_flight_number;
  set airline_flight_number(String? airline_flight_number) =>
      _$this._airline_flight_number = airline_flight_number;

  DateTime? _airline_flight_departure_time;
  DateTime? get airline_flight_departure_time =>
      _$this._airline_flight_departure_time;
  set airline_flight_departure_time(DateTime? airline_flight_departure_time) =>
      _$this._airline_flight_departure_time = airline_flight_departure_time;

  DateTime? _airline_flight_arrival_time;
  DateTime? get airline_flight_arrival_time =>
      _$this._airline_flight_arrival_time;
  set airline_flight_arrival_time(DateTime? airline_flight_arrival_time) =>
      _$this._airline_flight_arrival_time = airline_flight_arrival_time;

  String? _vehicle_type;
  String? get vehicle_type => _$this._vehicle_type;
  set vehicle_type(String? vehicle_type) => _$this._vehicle_type = vehicle_type;

  double? _vehicle_travel_time_hours;
  double? get vehicle_travel_time_hours => _$this._vehicle_travel_time_hours;
  set vehicle_travel_time_hours(double? vehicle_travel_time_hours) =>
      _$this._vehicle_travel_time_hours = vehicle_travel_time_hours;

  String? _vehicle_driver_name;
  String? get vehicle_driver_name => _$this._vehicle_driver_name;
  set vehicle_driver_name(String? vehicle_driver_name) =>
      _$this._vehicle_driver_name = vehicle_driver_name;

  String? _other_info;
  String? get other_info => _$this._other_info;
  set other_info(String? other_info) => _$this._other_info = other_info;

  CadetLeaveTransportMethodBuilder();

  CadetLeaveTransportMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transport_type = $v.transport_type;
      _airline_name = $v.airline_name;
      _airline_flight_number = $v.airline_flight_number;
      _airline_flight_departure_time = $v.airline_flight_departure_time;
      _airline_flight_arrival_time = $v.airline_flight_arrival_time;
      _vehicle_type = $v.vehicle_type;
      _vehicle_travel_time_hours = $v.vehicle_travel_time_hours;
      _vehicle_driver_name = $v.vehicle_driver_name;
      _other_info = $v.other_info;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetLeaveTransportMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetLeaveTransportMethod;
  }

  @override
  void update(void Function(CadetLeaveTransportMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetLeaveTransportMethod build() => _build();

  _$CadetLeaveTransportMethod _build() {
    final _$result = _$v ??
        new _$CadetLeaveTransportMethod._(
            transport_type: BuiltValueNullFieldError.checkNotNull(
                transport_type, r'CadetLeaveTransportMethod', 'transport_type'),
            airline_name: BuiltValueNullFieldError.checkNotNull(
                airline_name, r'CadetLeaveTransportMethod', 'airline_name'),
            airline_flight_number: BuiltValueNullFieldError.checkNotNull(
                airline_flight_number, r'CadetLeaveTransportMethod', 'airline_flight_number'),
            airline_flight_departure_time: BuiltValueNullFieldError.checkNotNull(
                airline_flight_departure_time, r'CadetLeaveTransportMethod', 'airline_flight_departure_time'),
            airline_flight_arrival_time: BuiltValueNullFieldError.checkNotNull(
                airline_flight_arrival_time, r'CadetLeaveTransportMethod', 'airline_flight_arrival_time'),
            vehicle_type: BuiltValueNullFieldError.checkNotNull(
                vehicle_type, r'CadetLeaveTransportMethod', 'vehicle_type'),
            vehicle_travel_time_hours: BuiltValueNullFieldError.checkNotNull(
                vehicle_travel_time_hours, r'CadetLeaveTransportMethod', 'vehicle_travel_time_hours'),
            vehicle_driver_name: BuiltValueNullFieldError.checkNotNull(vehicle_driver_name, r'CadetLeaveTransportMethod', 'vehicle_driver_name'),
            other_info: BuiltValueNullFieldError.checkNotNull(other_info, r'CadetLeaveTransportMethod', 'other_info'));
    replace(_$result);
    return _$result;
  }
}

class _$CadetLeave extends CadetLeave {
  @override
  final String cadet_id;
  @override
  final DateTime departure_time;
  @override
  final DateTime return_time;
  @override
  final String final_address;
  @override
  final String final_city;
  @override
  final String final_state;
  @override
  final String final_zip;
  @override
  final String emergency_contact_name;
  @override
  final String emergency_contact_phone;
  @override
  final CadetLeaveTransportMethod departure_method;
  @override
  final CadetLeaveTransportMethod return_method;

  factory _$CadetLeave([void Function(CadetLeaveBuilder)? updates]) =>
      (new CadetLeaveBuilder()..update(updates))._build();

  _$CadetLeave._(
      {required this.cadet_id,
      required this.departure_time,
      required this.return_time,
      required this.final_address,
      required this.final_city,
      required this.final_state,
      required this.final_zip,
      required this.emergency_contact_name,
      required this.emergency_contact_phone,
      required this.departure_method,
      required this.return_method})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(cadet_id, r'CadetLeave', 'cadet_id');
    BuiltValueNullFieldError.checkNotNull(
        departure_time, r'CadetLeave', 'departure_time');
    BuiltValueNullFieldError.checkNotNull(
        return_time, r'CadetLeave', 'return_time');
    BuiltValueNullFieldError.checkNotNull(
        final_address, r'CadetLeave', 'final_address');
    BuiltValueNullFieldError.checkNotNull(
        final_city, r'CadetLeave', 'final_city');
    BuiltValueNullFieldError.checkNotNull(
        final_state, r'CadetLeave', 'final_state');
    BuiltValueNullFieldError.checkNotNull(
        final_zip, r'CadetLeave', 'final_zip');
    BuiltValueNullFieldError.checkNotNull(
        emergency_contact_name, r'CadetLeave', 'emergency_contact_name');
    BuiltValueNullFieldError.checkNotNull(
        emergency_contact_phone, r'CadetLeave', 'emergency_contact_phone');
    BuiltValueNullFieldError.checkNotNull(
        departure_method, r'CadetLeave', 'departure_method');
    BuiltValueNullFieldError.checkNotNull(
        return_method, r'CadetLeave', 'return_method');
  }

  @override
  CadetLeave rebuild(void Function(CadetLeaveBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetLeaveBuilder toBuilder() => new CadetLeaveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetLeave &&
        cadet_id == other.cadet_id &&
        departure_time == other.departure_time &&
        return_time == other.return_time &&
        final_address == other.final_address &&
        final_city == other.final_city &&
        final_state == other.final_state &&
        final_zip == other.final_zip &&
        emergency_contact_name == other.emergency_contact_name &&
        emergency_contact_phone == other.emergency_contact_phone &&
        departure_method == other.departure_method &&
        return_method == other.return_method;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cadet_id.hashCode);
    _$hash = $jc(_$hash, departure_time.hashCode);
    _$hash = $jc(_$hash, return_time.hashCode);
    _$hash = $jc(_$hash, final_address.hashCode);
    _$hash = $jc(_$hash, final_city.hashCode);
    _$hash = $jc(_$hash, final_state.hashCode);
    _$hash = $jc(_$hash, final_zip.hashCode);
    _$hash = $jc(_$hash, emergency_contact_name.hashCode);
    _$hash = $jc(_$hash, emergency_contact_phone.hashCode);
    _$hash = $jc(_$hash, departure_method.hashCode);
    _$hash = $jc(_$hash, return_method.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetLeave')
          ..add('cadet_id', cadet_id)
          ..add('departure_time', departure_time)
          ..add('return_time', return_time)
          ..add('final_address', final_address)
          ..add('final_city', final_city)
          ..add('final_state', final_state)
          ..add('final_zip', final_zip)
          ..add('emergency_contact_name', emergency_contact_name)
          ..add('emergency_contact_phone', emergency_contact_phone)
          ..add('departure_method', departure_method)
          ..add('return_method', return_method))
        .toString();
  }
}

class CadetLeaveBuilder implements Builder<CadetLeave, CadetLeaveBuilder> {
  _$CadetLeave? _$v;

  String? _cadet_id;
  String? get cadet_id => _$this._cadet_id;
  set cadet_id(String? cadet_id) => _$this._cadet_id = cadet_id;

  DateTime? _departure_time;
  DateTime? get departure_time => _$this._departure_time;
  set departure_time(DateTime? departure_time) =>
      _$this._departure_time = departure_time;

  DateTime? _return_time;
  DateTime? get return_time => _$this._return_time;
  set return_time(DateTime? return_time) => _$this._return_time = return_time;

  String? _final_address;
  String? get final_address => _$this._final_address;
  set final_address(String? final_address) =>
      _$this._final_address = final_address;

  String? _final_city;
  String? get final_city => _$this._final_city;
  set final_city(String? final_city) => _$this._final_city = final_city;

  String? _final_state;
  String? get final_state => _$this._final_state;
  set final_state(String? final_state) => _$this._final_state = final_state;

  String? _final_zip;
  String? get final_zip => _$this._final_zip;
  set final_zip(String? final_zip) => _$this._final_zip = final_zip;

  String? _emergency_contact_name;
  String? get emergency_contact_name => _$this._emergency_contact_name;
  set emergency_contact_name(String? emergency_contact_name) =>
      _$this._emergency_contact_name = emergency_contact_name;

  String? _emergency_contact_phone;
  String? get emergency_contact_phone => _$this._emergency_contact_phone;
  set emergency_contact_phone(String? emergency_contact_phone) =>
      _$this._emergency_contact_phone = emergency_contact_phone;

  CadetLeaveTransportMethodBuilder? _departure_method;
  CadetLeaveTransportMethodBuilder get departure_method =>
      _$this._departure_method ??= new CadetLeaveTransportMethodBuilder();
  set departure_method(CadetLeaveTransportMethodBuilder? departure_method) =>
      _$this._departure_method = departure_method;

  CadetLeaveTransportMethodBuilder? _return_method;
  CadetLeaveTransportMethodBuilder get return_method =>
      _$this._return_method ??= new CadetLeaveTransportMethodBuilder();
  set return_method(CadetLeaveTransportMethodBuilder? return_method) =>
      _$this._return_method = return_method;

  CadetLeaveBuilder();

  CadetLeaveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cadet_id = $v.cadet_id;
      _departure_time = $v.departure_time;
      _return_time = $v.return_time;
      _final_address = $v.final_address;
      _final_city = $v.final_city;
      _final_state = $v.final_state;
      _final_zip = $v.final_zip;
      _emergency_contact_name = $v.emergency_contact_name;
      _emergency_contact_phone = $v.emergency_contact_phone;
      _departure_method = $v.departure_method.toBuilder();
      _return_method = $v.return_method.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetLeave other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetLeave;
  }

  @override
  void update(void Function(CadetLeaveBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetLeave build() => _build();

  _$CadetLeave _build() {
    _$CadetLeave _$result;
    try {
      _$result = _$v ??
          new _$CadetLeave._(
              cadet_id: BuiltValueNullFieldError.checkNotNull(
                  cadet_id, r'CadetLeave', 'cadet_id'),
              departure_time: BuiltValueNullFieldError.checkNotNull(
                  departure_time, r'CadetLeave', 'departure_time'),
              return_time: BuiltValueNullFieldError.checkNotNull(
                  return_time, r'CadetLeave', 'return_time'),
              final_address: BuiltValueNullFieldError.checkNotNull(
                  final_address, r'CadetLeave', 'final_address'),
              final_city: BuiltValueNullFieldError.checkNotNull(
                  final_city, r'CadetLeave', 'final_city'),
              final_state: BuiltValueNullFieldError.checkNotNull(
                  final_state, r'CadetLeave', 'final_state'),
              final_zip: BuiltValueNullFieldError.checkNotNull(
                  final_zip, r'CadetLeave', 'final_zip'),
              emergency_contact_name: BuiltValueNullFieldError.checkNotNull(
                  emergency_contact_name, r'CadetLeave', 'emergency_contact_name'),
              emergency_contact_phone:
                  BuiltValueNullFieldError.checkNotNull(emergency_contact_phone, r'CadetLeave', 'emergency_contact_phone'),
              departure_method: departure_method.build(),
              return_method: return_method.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'departure_method';
        departure_method.build();
        _$failedField = 'return_method';
        return_method.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CadetLeave', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
