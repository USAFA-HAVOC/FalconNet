import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Shared/PaddedColumn.dart';

class FNDrawer extends StatelessWidget {
  const FNDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: PaddedColumn(
          padding: EdgeInsets.all(20),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print("Navigate to Dashboard");
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
                print("Navigate to Grades");
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                  "Grades",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Navigate to Accountability");
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                  "Acountability",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Navigate to Ordering");
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                  "Ordering",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),

          ],
        )
    );
  }
}