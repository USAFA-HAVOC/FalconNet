import 'package:flutter/material.dart';

import '../../Model/Database/CadetLeave.dart';
import '../../Utility/TemporalFormatting.dart';
import 'PaddedColumn.dart';

class LeaveDescription extends StatelessWidget {
  final CadetLeave leave;
  const LeaveDescription({super.key, required this.leave});

  String describeTransport(CadetLeaveTransportMethod method) {
    switch (method.transport_type) {
      case "vehicle": {
        var type = method.vehicle_type;
        if (type == "Uber/Lyft") {
          return "Using rideshare service.";
        }
        else {
          return "Driven by ${method.vehicle_driver_name} in ${method.vehicle_type} for ${method.vehicle_travel_time_hours!.toStringAsFixed(1)} hours";
        }
      }
      case "airline": {
        var departure = method.airline_flight_departure_time!;
        var arrival = method.airline_flight_arrival_time!;
        return "Flying with ${method.airline_name} on flight #${method.airline_flight_number}. "
            "Departing at ${describeTime(TimeOfDay.fromDateTime(departure))} on ${describeDate(departure)}. "
            "Arriving at ${describeTime(TimeOfDay.fromDateTime(arrival))} on ${describeDate(arrival)}. ";
      }
      case "other": {
        return "Other: ${method.other_info!}";
      }
      default: return "Error: cannot read transport type";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "General",
          style: Theme.of(context).textTheme.titleSmall,
        ),

        //Stack of destination information in a stack with labels
        PaddedColumn(
          padding: const EdgeInsets.symmetric(vertical: 2),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address: ${leave.final_address} ${leave.final_city}, ${leave.final_state} ${leave.final_zip}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Text(
              "Emergency Contact: ${leave.emergency_contact_name} ${leave.emergency_contact_phone}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Text(
              "Departure: ${describeDate(leave.departure_time)} ${describeTime(timeOf(leave.departure_time))}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Text(
              "Return: ${describeDate(leave.return_time)} ${describeTime(timeOf(leave.return_time))}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const Divider(thickness: 1,),

        Text(
          "Departure",
          style: Theme.of(context).textTheme.titleSmall,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            describeTransport(leave.departure_method),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),

        const Divider(thickness: 1,),

        Text(
          "Return",
          style: Theme.of(context).textTheme.titleSmall,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            describeTransport(leave.return_method),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

}