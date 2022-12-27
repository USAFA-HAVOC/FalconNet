import 'package:falcon_net/Structure/Pages/TaskManagement/TaskManagement.dart';
import 'package:go_router/go_router.dart';
import '../Structure/FNScaffold.dart';
import '../Structure/Pages/Dashboard/Dashboard.dart';
import '../Structure/Pages/Grades.dart';
import '../Structure/Pages/LeaveLocator/LeaveLocator.dart';
import '../Structure/Pages/PassManagement/PassManagement.dart';
import '../Structure/Pages/Profile/Profile.dart';

///Defines page routes within the app and places each within the app scaffold
final GoRouter fnRouter = GoRouter(
    routes: [

      //Shell route places contents of all sub-routes as child of the scaffold
      ShellRoute(
        builder: (context, state, child) {
          return FNScaffold(
            child: child
          );
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
                ),
              ]
          )
        ]
      )
    ]
);