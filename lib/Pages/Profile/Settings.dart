import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/StateAction.dart';
import 'package:falcon_net/Model/UserSettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          if (store.state.settings.pushNotifications) {
            controller.value = 1.0;
          }
          return ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Text(
                        "Dark Theme",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Switch(
                        value: store.state.settings.darkTheme,
                        onChanged: (value) {
                          store.dispatch(StateAction.setSetting(property: UserSettingsProperty.darkTheme, value: value));
                        },
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Text(
                        "Push Notifications",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Switch(
                        value: store.state.settings.pushNotifications,
                        onChanged: (value) {
                          store.dispatch(StateAction.setSetting(property: UserSettingsProperty.pushNotifications, value: value));
                          controller.animateTo(value ? 1.0 : 0.0);
                        },
                      )
                  ),
                ],
              ),
              SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 10,
                              child: Text(
                                "Overdue Passes",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child: Switch(
                                value: store.state.settings.passPush,
                                onChanged: (value) {
                                  store.dispatch(StateAction.setSetting(property: UserSettingsProperty.passPush, value: value));
                                },
                              )
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 10,
                              child: Text(
                                "DI",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child: Switch(
                                value: store.state.settings.diPush,
                                onChanged: (value) {
                                  store.dispatch(StateAction.setSetting(property: UserSettingsProperty.diPush, value: value));
                                },
                              )
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 10,
                              child: Text(
                                "Task Management",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child: Switch(
                                value: store.state.settings.taskPush,
                                onChanged: (value) {
                                  store.dispatch(StateAction.setSetting(property: UserSettingsProperty.taskPush, value: value));
                                },
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
    );
  }
}