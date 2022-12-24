import 'dart:html';
import 'package:falcon_net/Pages/LeaveLocator/LeaveLocator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Pages/Grades.dart';
import '../Pages/Home/Home.dart';
import '../Pages/Profile/Profile.dart';
import '../Structure/FNScaffold.dart';

final GoRouter fnRouter = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return FNScaffold(
            child: child
          );
        },
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
              ]
          )
        ]
      )
    ]
);