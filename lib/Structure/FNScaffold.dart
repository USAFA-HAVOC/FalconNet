import 'package:falcon_net/Structure/FNDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'FNNavigationBar.dart';
import 'Components/TapIcon.dart';

class FNScaffold extends StatelessWidget {
  final Widget child;

  const FNScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(MediaQuery.of(context).size),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: const FNNavigationBar()
        ),
        drawer: const FNDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }
}