import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';

enum TransportType {
  airline,
  vehicle,
  other,
}

extension TransportNames on TransportType {
  String get description {
    switch (this) {
      case TransportType.vehicle: return "Vehicle";
      case TransportType.other: return "Other";
      case TransportType.airline: return "Airline";
    }
  }

  static TransportType parse(String transport) {
    switch (transport) {
      case "Vehicle": return TransportType.vehicle;
      case "Other": return TransportType.other;
      case "Airline": return TransportType.airline;
      default: return TransportType.airline;
    }
  }
}

enum VehicleType {
  pov,
  gov,
  rental,
  cab,
  uber,
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
      case VehicleType.uber: return "Uber/Lyft";
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

abstract class LeaveMethod {
  TransportType type();

  String description();
}

class AirlineMethod extends LeaveMethod {
  String airline;
  String flightNumber;
  DateTime flightDepartureTime;
  DateTime flightArrivalTime;

  AirlineMethod({
    required this.airline,
    required this.flightNumber,
    required this.flightArrivalTime,
    required this.flightDepartureTime,
  });

  @override
  TransportType type() => TransportType.airline;

  @override
  String description() =>
      "Flying on ${airline}'s flight number ${flightNumber}. Takes off at ${describeDate(flightDepartureTime)} ${describeTime(timeOf(flightDepartureTime))}. Lands at ${describeDate(flightArrivalTime)} ${describeTime(timeOf(flightArrivalTime))}.";
}

class VehicleMethod extends LeaveMethod {
  double? vehicleTravelTime;
  String? vehicleDriverName;
  VehicleType vehicleType;

  VehicleMethod({
    required this.vehicleType,
    this.vehicleDriverName,
    this.vehicleTravelTime,
  });

  @override
  TransportType type() => TransportType.vehicle;

  @override
  String description() {
    switch (vehicleType) {
      case VehicleType.uber:
        return "Taking an Uber/Lyft.";
      default:
        return "Driven in ${vehicleType.description} by ${vehicleDriverName!} for ${vehicleTravelTime!.toStringAsPrecision(1)} hours";
    }
  }
}

class OtherMethod extends LeaveMethod {
  String info;

  OtherMethod({
    required this.info,
  });

  @override
  TransportType type() => TransportType.other;

  @override
  String description() => "Other: $info";
}

class Leave {
  LeaveMethod departureMethod;
  LeaveMethod returnMethod;
  String contactName;
  String contactPhone;
  String finalZip;
  String finalState;
  String finalCity;
  String finalAddress;
  DateTime departureTime;
  DateTime returnTime;
  String id;

  Leave({
    required this.departureMethod,
    required this.returnMethod,
    required this.contactName,
    required this.contactPhone,
    required this.finalZip,
    required this.finalState,
    required this.finalCity,
    required this.finalAddress,
    required this.departureTime,
    required this.returnTime,
    required this.id
  });
}
