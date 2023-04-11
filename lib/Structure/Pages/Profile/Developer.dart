import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/Store/Actions/GlobalAction.dart';
import '../../../Model/Store/GlobalState.dart';
import '../../Components/AsyncPage.dart';
import '../../Components/ViewModel.dart';

class DeveloperOptions {
  bool server;
  bool permanentParty;

  DeveloperOptions({this.server = false, this.permanentParty = false});
}

class Developer extends StatefulWidget {
  const Developer({super.key});

  @override
  State<StatefulWidget> createState() => DeveloperState();
}

class DeveloperState extends State<Developer> {
  late Future<DeveloperOptions> optionsFuture;

  @override
  void initState() {
    super.initState();
    optionsFuture = buildOptions();
  }

  Future<DeveloperOptions> buildOptions() async {
    var prefs = await SharedPreferences.getInstance();
    return DeveloperOptions(
      server: prefs.getBool("dev-server") ?? false,
      permanentParty: prefs.getBool("dev-pp") ?? false
    );
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Developer Settings",
        connection: optionsFuture,
        builder: (context, options) => [
          const PageWidget(
              title: "Disclaimer",
              children: [
                Text(
                    "Do not modify anything on this page unless you have been "
                        "expressly instructed to do so by a FalconNet developer. If "
                        "you do not understand what you are doing on this page, "
                        "leave now."
                )
              ]
          ),

          PageWidget(
              title: "API Settings",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Development Server",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),

                    Switch(
                      value: options.server,
                      onChanged: (change) {
                        SharedPreferences.getInstance().then((prefs) => prefs.setBool("dev-server", change));
                        setState(() {
                          optionsFuture = Future.value((options..server = change));
                        });
                      }
                    ),
                  ],
                ),

                const Text(
                    "Must restart app to reflect dev setting changes",
                    textAlign: TextAlign.center,
                )
              ]
          ),

          PageWidget(
              title: "Local Settings",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Permanent Party",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),

                    Switch(
                        value: options.permanentParty,
                        onChanged: (change) {
                          setState(() {
                            optionsFuture = Future.value((options..permanentParty = change));
                          });
                          SharedPreferences.getInstance().then((prefs) => prefs.setBool("dev-pp", change));
                        }
                    )
                  ],
                ),

                const Text(
                  "Must restart app to reflect dev setting changes",
                  textAlign: TextAlign.center,
                )
              ]
          )
        ],
    );
  }
}