import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Components/PaddedColumn.dart';

///Side menu for page navigation
class FNDrawer extends StatelessWidget {
  const FNDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: PaddedColumn(
          padding: EdgeInsets.only(
            left: 50,
            top: 20,
            bottom: 20,
          ),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                context.go("/");
              },
              child: Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),

            GestureDetector(
              onTap: () {
                context.go("/grades");
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                  "Grades",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),

            GestureDetector(
              onTap: () {
                context.go("/leave_locator");
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                  "Leave Locator",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),

            GestureDetector(
              onTap: () {
                context.go("/pass_management");
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                  "Pass Management",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
          ],
        )
    );
  }
}