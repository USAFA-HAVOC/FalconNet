import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Model/Store/FNDateTimeSerializer.dart';
import 'package:falcon_net/Services/AuthService.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/Store/Endpoints.dart';

class PassReport extends StatefulWidget {
  const PassReport({super.key});

  @override
  State<StatefulWidget> createState() => PassReportState();
}

class PassReportState extends State<PassReport> {
  List<UserSummary> selected = <UserSummary>[];
  DateTimeRange range = DateTimeRange(start: DateTime.now().subtract(const Duration(days: 7)), end: DateTime.now());
  late Future<List<UserSummary>> connection;

  @override
  void initState() {
    super.initState();
    connection = retrieve();
  }

  Future<List<UserSummary>> retrieve() async {
    var data = await Endpoints.getUnit(UnitDataRequestBuilder().build());
    return data.members.toList();
  }

  void generateReport(BuildContext context) async {
    var uri = Uri(
      scheme: "https",
      host: APIData().apiLocation.split("/").last,
      path: "/admin/pass-report.pdf",
      queryParameters: {
        "token" : AuthService().token ?? "no_token_lol",
        "start" : (range.start.toUtc().millisecondsSinceEpoch / 1000).round().toString(),
        "end" : (range.end.toUtc().millisecondsSinceEpoch / 1000).round().toString(),
        "cadets" : selected.map((u) => u.user_id).join(",")
      }
    );

    launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: "Pass Report"
    );
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Pass Reports",
        connection: connection,
        builder: (context, cadets) => [
          PageWidget(
            title: "Generate Report",
            children: [
              const Text(
                "Leave cadet field blank to retrieve entire unit"
              ),

              MultiSelectDialogField<UserSummary>(
                items: cadets.map((u) => MultiSelectItem<UserSummary>(u, u.name)).toList(),
                searchable: true,
                searchHint: "Search for a cadet...",
                buttonText: const Text("Select Cadets"),
                title: const Text("Select Cadets"),
                selectedColor: Theme.of(context).indicatorColor,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Theme.of(context).indicatorColor,
                    width: 1.5,
                  ),
                ),
                onConfirm: (values) {
                  setState(() {
                    selected = values;
                  });
                },
                chipDisplay: MultiSelectChipDisplay(
                  chipColor: Theme.of(context).indicatorColor,
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  final DateTimeRange? dateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now()
                        .subtract(const Duration(days: 365 * 5)),
                    lastDate: DateTime.now(),
                  );
                  if (dateRange != null) {
                    setState(() {
                      range = dateRange;
                    });
                  }
                },
                child: Text(
                  '${describeDate(range.start.toLocal())} - ${describeDate(range.end.toLocal())}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => generateReport(context),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]
          )
        ]
    );
  }
}