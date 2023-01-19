import 'package:falcon_net/Model/Store/Connection/Connection.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/TaskManagement.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/Delegation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Structure/FNScaffold.dart';
import '../Structure/Pages/Dashboard/Dashboard.dart';
import '../Structure/Pages/Grades.dart';
import '../Structure/Pages/LeaveLocator/LeaveLocator.dart';
import '../Structure/Pages/PassManagement/PassManagement.dart';
import '../Structure/Pages/Profile/Profile.dart';
import '../Structure/Pages/TaskManagement/Tasks/CWOC/CWOCTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/Ordering/OrderingTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/SDO/SDOTask.dart';

///Defines page routes within the app and places each within the app scaffold
///Contains each within the default background to prevent
///transparency effects during transitions
final GoRouter fnRouter = GoRouter(routes: [
  //Shell route places contents of all sub-routes as child of the scaffold
  ShellRoute(
      builder: (context, state, child) {
        return FNScaffold(child: child);
      },

      //Each route builds a page under the application scaffold
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const FNBackground(child: Dashboard()),
            routes: [
              GoRoute(
                path: "profile",
                builder: (context, state) =>
                    const FNBackground(child: Profile()),
              ),
              GoRoute(
                path: "grades",
                builder: (context, state) =>
                    const FNBackground(child: Grades()),
              ),
              GoRoute(
                path: "leave_locator",
                builder: (context, state) =>
                    FNBackground(child: LeaveLocator()),
              ),
              GoRoute(
                path: "pass_management",
                builder: (context, state) =>
                    const FNBackground(child: PassManagement()),
              ),
              GoRoute(
                  path: "task_management",
                  builder: (context, state) =>
                      const FNBackground(child: TaskManagement()),
                  routes: [
                    GoRoute(
                      path: "sdo",
                      builder: (context, state) =>
                          const FNBackground(child: SDOTask()),
                    ),
                    GoRoute(
                      path: "ordering",
                      builder: (context, state) =>
                          const FNBackground(child: OrderingTask()),
                    ),
                    GoRoute(
                      path: "cwoc",
                      builder: (context, state) =>
                          const FNBackground(child: CWOCTask()),
                    ),
                    GoRoute(
                      path: "delegation",
                      builder: (context, state) =>
                          const FNBackground(child: Delegation()),
                    ),
                  ]),
            ])
      ])
]);

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
