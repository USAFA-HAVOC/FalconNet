import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/Cadet.dart';
import 'package:falcon_net/Structure/Components/PaddedColumn.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';
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
  int previousIndex = 0;

  late TabController tabController;

  //Initializes tab controller
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
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
                    StoreConnector<GlobalState, ViewModel<CadetModel>>(
                        converter: (store) => ViewModel<CadetModel>(store: store, content: store.state.cadet),
                        builder: (context, model) {
                          return Text(
                            "Hi, ${model.content.name}!",
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        }
                    ),

                    TabBar(
                        controller: tabController,
                        labelPadding: EdgeInsets.zero,
                        tabs: tabs,
                        onTap: (newIndex) {
                          setState(() {
                            previousIndex = index;
                            index = newIndex;
                          });
                        },
                    ),

                    AnimatedCrossFade(
                        firstChild: pages[index],
                        secondChild: pages[previousIndex],
                        crossFadeState: CrossFadeState.showFirst,
                        duration: Duration(milliseconds: 250),
                        sizeCurve: Curves.ease,
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