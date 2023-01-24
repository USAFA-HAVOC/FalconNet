import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'CadetLeave.g.dart';

enum VehicleType {
  pov,
  gov,
  rental,
  cab,
  rideshare,
  carpool,
}

extension VehicleNames on VehicleType {
  String get description {
    switch (this) {
      case VehicleType.cab: return "Cab";
      case VehicleType.carpool: return "Carpool";
      case VehicleType.gov: return "GOV";
      case VehicleType.pov: return "POV";
      case VehicleType.rental: return "Rental";
      case VehicleType.rideshare: return "Rideshare";
    }
  }

  static VehicleType parse(String vehicle) {
    Map<String, VehicleType> map = {};
    VehicleType.values.forEach((v) {
      map[v.description] = v;
    });
    return map[vehicle] ?? VehicleType.pov;
  }
}

abstract class CadetLeaveTransportMethod implements Built<CadetLeaveTransportMethod, CadetLeaveTransportMethodBuilder> {
  static Serializer<CadetLeaveTransportMethod> get serializer => _$cadetLeaveTransportMethodSerializer;

  String get transport_type;

  String get airline_name;
  String get airline_flight_number;
  DateTime get airline_flight_departure_time;
  DateTime get airline_flight_arrival_time;

  String get vehicle_type;
  double get vehicle_travel_time_hours;
  String get vehicle_driver_name;

  String get other_info;

  CadetLeaveTransportMethod._();
  factory CadetLeaveTransportMethod([void Function(CadetLeaveTransportMethodBuilder) updates]) = _$CadetLeaveTransportMethod;
}

abstract class CadetLeave implements Built<CadetLeave, CadetLeaveBuilder> {
  static Serializer<CadetLeave> get serializer => _$cadetLeaveSerializer;

  String get cadet_id;
  DateTime get departure_time;
  DateTime get return_time;
  String get final_address;
  String get final_city;
  String get final_state;
  String get final_zip;
  String get emergency_contact_name;
  String get emergency_contact_phone;
  CadetLeaveTransportMethod get departure_method;
  CadetLeaveTransportMethod get return_method;

  CadetLeave._();
  factory CadetLeave([void Function(CadetLeaveBuilder) updates]) = _$CadetLeave;
}
