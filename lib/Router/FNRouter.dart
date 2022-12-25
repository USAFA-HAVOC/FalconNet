import 'package:go_router/go_router.dart';
import '../Structure/FNScaffold.dart';
import '../Structure/Pages/Grades.dart';
import '../Structure/Pages/Home/Home.dart';
import '../Structure/Pages/LeaveLocator/LeaveLocator.dart';
import '../Structure/Pages/PassManagement/PassManagement.dart';
import '../Structure/Pages/Profile/Profile.dart';

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
              builder: (context, state) => const Home(),
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
              ]
          )
        ]
      )
    ]
);