import 'dart:html';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Pages/Home.dart';
import '../Pages/Profile.dart';
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
                  builder: (context, state) => const Profile()
                )
              ]
          )
        ]
      )
    ]
);