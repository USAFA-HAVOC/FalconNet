import 'dart:html';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Pages/Home.dart';
import '../Shared/FNNavigationBar.dart';

final GoRouter fnRouter = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return FNNavigationBar(
            child: child
          );
        },
        routes: [
          GoRoute(
              path: "/",
              builder: (context, state) => const Home()
          )
        ]
      )
    ]
);