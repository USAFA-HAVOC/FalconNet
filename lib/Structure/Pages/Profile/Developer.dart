import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AsyncPage.dart';

class DeveloperOptions {
  bool server;

  DeveloperOptions({this.server = false});
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
      server: prefs.getBool("dev-server") ?? false
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
                    "Must restart app to reflect API changes",
                    textAlign: TextAlign.center,
                )
              ]
          )
        ],
    );
  }
}