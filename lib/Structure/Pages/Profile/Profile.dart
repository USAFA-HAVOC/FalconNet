import 'package:falcon_net/Structure/Components/PaddedColumn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../Model/Store/GlobalState.dart';
import 'CadetInfo.dart';
import 'PassHistory.dart';
import 'Settings.dart';

///Page displaying info, settings, and pass history tabs
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {

  //Tabs in tabview
  static const List<Tab> tabs = [
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

  static const List<Widget> pages = [
    CadetInfo(),
    Settings(),
    PassHistory(),
  ];

  int index = 0;

  late Widget current = CadetInfo();
  late Widget previous = CadetInfo();

  late TabController controller;

  //Initializes tab controller
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
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                    "Profile",
                    style: Theme.of(context).textTheme.titleLarge
                ),
              ),

              Card(
                child: PaddedColumn(
                  padding: EdgeInsets.all(10),
                  children: [
                    Icon(
                        Icons.person_outline
                    ),

                    //Greets the user by name according to global state
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
                        tabs: tabs,
                        onTap: (newIndex) {
                          setState(() {
                            index = newIndex;
                            previous = current;
                            current = pages[index];
                          });
                        },
                    ),

                    AnimatedCrossFade(
                        firstChild: current,
                        secondChild: previous,
                        crossFadeState: CrossFadeState.showFirst,
                        duration: Duration(milliseconds: 250),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}