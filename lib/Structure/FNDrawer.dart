import 'package:flutter/material.dart';

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
              },
              child: Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Navigate to Grades");
              },
              child: Text(
                  "Grades",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Navigate to Accountability");
              },
              child: Text(
                  "Acountability",
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Navigate to Ordering");
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