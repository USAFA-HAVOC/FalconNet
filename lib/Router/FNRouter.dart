import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/TaskManagement.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/DelegationTask.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Model/Database/TimedRole.dart';
import '../Model/Store/GlobalStateModel.dart';
import '../Structure/FNScaffold.dart';
import '../Structure/Pages/Dashboard/Dashboard.dart';
import '../Structure/Pages/Grades/Grades.dart';
import '../Structure/Pages/LeaveLocator/LeaveLocator.dart';
import '../Structure/Pages/PassManagement/PassManagement.dart';
import '../Structure/Pages/Profile/Profile.dart';
import '../Structure/Pages/TaskManagement/Tasks/CWOC/CWOCTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/Ordering/OrderingTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/SDO/SDOTask.dart';

///Defines page routes within the app and places each within the app scaffold
///Contains each within the default background to prevent
///transparency effects during transitions
GoRouter fnRouter(GlobalKey<NavigatorState> key) => GoRouter(
  navigatorKey: key,
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => state.extra as Widget,
    ),

    //Shell route places contents of all sub-routes as child of the scaffold
    ShellRoute(
        builder: (context, state, child) {
          return FNScaffold(child: FNBackground(child: child,));
        },

        //Each route builds a page under the application scaffold
        routes: [
          GoRoute(
              path: "/",
              builder: (context, state) => const Dashboard(),

              routes: [
                GoRoute(
                  path: "profile",
                  builder: (context, state) => const Profile(),
                ),
                GoRoute(
                  path: "grades",
                  builder: (context, state) => const Grades(),
                ),
                GoRoute(
                  path: "leave_locator",
                  builder: (context, state) => LeaveLocator(),
                ),
                GoRoute(
                  path: "pass_management",
                  builder: (context, state) => const PassManagement(),
                ),
                GoRoute(
                    path: "task_management",
                    builder: (context, state) => const TaskManagement(),
                    routes: [
                      GoRoute(
                        path: "sdo",
                        builder: (context, state) => const SDOTask(),
                      ),
                      GoRoute(
                        path: "ordering",
                        builder: (context, state) => const OrderingTask(),
                      ),
                      GoRoute(
                        path: "cwoc",
                        builder: (context, state) => const CWOCTask(),
                      ),
                      GoRoute(
                        path: "delegation",
                        builder: (context, state) =>
                          StoreConnector<GlobalState, ViewModel<List<TimedRole>>>(
                            converter: (store) => ViewModel(store: store, content: store.state.user.roles.toList()),
                            builder: (context, model) => DelegationTask(owner: model.content),
                          )
                      ),
                    ]),
              ])
        ])
  ]
);

///Common background for all falcon net pages
///Cannot be included in shell path to prevent transparency effects
class FNBackground extends StatelessWidget {
  final Widget child;

  const FNBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: child,
    );
  }
}
