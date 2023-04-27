import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


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
      case VehicleType.rideshare: return "Uber/Lyft";
    }
  }

  static VehicleType parse(String data) =>
      VehicleType.values.firstWhere((v) => v.name == data);

  static VehicleType parseDescription(String data) =>
      VehicleType.values.firstWhere((v) => v.description == data);
}

enum TransportType {
  vehicle,
  airline,
  other
}

extension TransportTypeNames on TransportType {
  static TransportType parse(String data) => 
      TransportType.values.firstWhere((v) => v.name == data);
  
  String display() {
    switch (this) {
      case TransportType.airline: return "Airline";
      case TransportType.vehicle: return "Vehicle";
      case TransportType.other: return "Other";
    }
  }
}

abstract class CadetLeaveTransportMethod implements Built<CadetLeaveTransportMethod, CadetLeaveTransportMethodBuilder> {
  static Serializer<CadetLeaveTransportMethod> get serializer => _$cadetLeaveTransportMethodSerializer;

  String get transport_type;

  String? get airline_name;
  String? get airline_flight_number;
  DateTime? get airline_flight_departure_time;
  DateTime? get airline_flight_arrival_time;

  String? get vehicle_type;
  double? get vehicle_travel_time_hours;
  String? get vehicle_driver_name;

  String? get other_info;

  CadetLeaveTransportMethod toUtc() {
    return rebuild((m) => m
        ..airline_flight_departure_time = airline_flight_departure_time?.toUtc()
        ..airline_flight_arrival_time = airline_flight_arrival_time?.toUtc()
    );
  }

  CadetLeaveTransportMethod toLocal() {
    return rebuild((m) => m
      ..airline_flight_departure_time = airline_flight_departure_time?.toLocal()
      ..airline_flight_arrival_time = airline_flight_arrival_time?.toLocal()
    );
  }

  CadetLeaveTransportMethod._();
  factory CadetLeaveTransportMethod([void Function(CadetLeaveTransportMethodBuilder) updates]) = _$CadetLeaveTransportMethod;
}

abstract class CadetLeave implements Built<CadetLeave, CadetLeaveBuilder> {
  static Serializer<CadetLeave> get serializer => _$cadetLeaveSerializer;

  String? get id;
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

  CadetLeave toUtc() {
    return rebuild((l) => l
        ..departure_time = departure_time.toUtc()
        ..return_time = return_time.toUtc()
        ..return_method = return_method.toUtc().toBuilder()
        ..departure_method = departure_method.toUtc().toBuilder()
    );
  }

  CadetLeave toLocal() {
    return rebuild((l) => l
      ..departure_time = departure_time.toLocal()
      ..return_time = return_time.toLocal()
      ..return_method = return_method.toLocal().toBuilder()
      ..departure_method = departure_method.toLocal().toBuilder()
    );
  }

  CadetLeave._();
  factory CadetLeave([void Function(CadetLeaveBuilder) updates]) = _$CadetLeave;
}
