import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Model/Data/UserSettings.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

///Settings page
///Modifies global state settings as values are changed
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<UserSettings>>(
        converter: (store) => ViewModel<UserSettings>(store: store, content: store.state.settings),
        builder: (context, model) {
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
                        value: model.content.darkTheme,

                        //Dispatches set setting action with new value
                        onChanged: (value) {
                          model.dispatch(SettingsAction(property: UserSettingsProperty.darkTheme, value: value));
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
                        value: model.content.pushNotifications,

                        //Dispatches set setting action with new value
                        onChanged: (value) {
                          model.dispatch(SettingsAction(property: UserSettingsProperty.pushNotifications, value: value));
                        },
                      )
                  ),
                ],
              ),

              NotificationsExtension(beginOpen: model.content.pushNotifications),
            ],
          );
        }
    );
  }
}

///Displays push notification extended sub-menu
///Statefulness prevents animation discontinuity errors by capturing
///open status as a parameter rather than capturing at build
class NotificationsExtension extends StatefulWidget {
  final bool beginOpen;

  const NotificationsExtension({super.key, required this.beginOpen});

  @override
  State<NotificationsExtension> createState() => NotificationsExtensionState();
}

class NotificationsExtensionState extends State<NotificationsExtension> with SingleTickerProviderStateMixin {

  //Animation controllers for push notifications expansion
  late final AnimationController controller;

  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    //Initialize controller with animation value based on begin open parameter
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
      value: widget.beginOpen ? 1 : 0,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<UserSettings>>(
      converter: (store) => ViewModel<UserSettings>(store: store, content: store.state.settings),
      builder: (context, model) {

        /*
        If animation controller state doesn't match setting state, initiate
        animation to appropriate value
         */
        if (model.content.pushNotifications && controller.value != 1) {
          controller.animateTo(1);
        }

        if (!model.content.pushNotifications && controller.value != 0) {
          controller.animateTo(0);
        }

        return SizeTransition(
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
                          value: model.content.passPush,

                          //Dispatches set setting action with new value
                          onChanged: (value) {
                            model.dispatch(SettingsAction(property: UserSettingsProperty.passPush, value: value));
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
                          "Dormitory Inspection",
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                    ),

                    Expanded(
                        flex: 2,
                        child: Switch(
                          value: model.content.diPush,

                          //Dispatches set setting action with new value
                          onChanged: (value) {
                            model.dispatch(SettingsAction(property: UserSettingsProperty.diPush, value: value));
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
                          value: model.content.taskPush,

                          //Dispatches set setting action with new value
                          onChanged: (value) {
                            model.dispatch(SettingsAction(property: UserSettingsProperty.taskPush, value: value));
                          },
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}