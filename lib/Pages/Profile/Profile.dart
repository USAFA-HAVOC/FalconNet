import 'package:falcon_net/Pages/Profile/CadetInfo.dart';
import 'package:falcon_net/Pages/Profile/PassHistory.dart';
import 'package:falcon_net/Shared/PaddedColumn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';
import 'Settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {

  static const List<Tab> tabs = <Tab>[
    Tab(
        text: "Info"
    ),
    Tab(
        text: "Settings"
    ),
    Tab(
        text: "Pass History"
    ),
  ];

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaddedColumn(
      padding: EdgeInsets.only(bottom: 10),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
            "Profile",
            style: Theme.of(context).textTheme.titleLarge
        ),
        Card(
          child: PaddedColumn(
            padding: EdgeInsets.all(10),
            children: [
              Icon(
                  Icons.person_outline
              ),
              StoreBuilder<GlobalState>(
                builder: (context, store) {
                  return Text(
                    "Hi, ${store.state.cadet.name}!",
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }
              ),
              TabBar(
                  controller: controller,
                  labelPadding: EdgeInsets.zero,
                  tabs: tabs
              ),
              ConstrainedBox(
                constraints: BoxConstraints.loose(Size.fromHeight(MediaQuery.of(context).size.height - 340)),
                child: TabBarView(
                  controller: controller,
                  children: [
                    CadetInfo(),
                    Settings(),
                    PassHistory(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}