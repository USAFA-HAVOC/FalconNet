import 'package:falcon_net/Structure/FNDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'FNNavigationBar.dart';
import 'Components/TapIcon.dart';

///Scaffold containing all application pages
///Places navigation bar above content and
///initiates navigation drawer to the left
class FNScaffold extends StatelessWidget {
  final Widget child;

  const FNScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    //Constrains content to the size of the screen
    return ConstrainedBox(
      constraints: BoxConstraints.loose(MediaQuery.of(context).size),
      child: Scaffold(

        //Automatically imply leading supresses automatic menu button functionality
        //Places custom navigation bar in space of app bar
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