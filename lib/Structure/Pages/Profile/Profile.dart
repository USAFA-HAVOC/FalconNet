import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/PaddedColumn.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';
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
        text: "Pass History"
    ),
    Tab(
        text: "Settings"
    ),
  ];

  static const List<Widget> pages = [
    CadetInfo(),
    PassHistory(),
    Settings(),
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
    return FNPage(
        title: "Profile",
        children: [
          Card(
            child: PaddedColumn(
              padding: const EdgeInsets.all(10),
              children: [
                const Icon(
                    Icons.person_outline
                ),

                //Greets the user by name according to global state
                StoreConnector<GlobalState, ViewModel<User>>(
                    converter: (store) => ViewModel<User>(store: store, content: store.state.user),
                    builder: (context, model) {
                      return Text(
                        "Hi, ${model.content.personal_info.full_name}!",
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
                  duration: const Duration(milliseconds: 250),
                  sizeCurve: Curves.ease,
                ),
              ],
            ),
          )
        ]
    );
  }
}