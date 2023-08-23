import 'package:flutter/material.dart';

import 'Components/PaddedColumn.dart';
import 'DrawerItem.dart';

///Side menu for page navigation
class FNDrawer extends StatelessWidget {
  const FNDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size viewport = MediaQuery.of(context).size;
    return ConstrainedBox(
      //Sets height as exactly three quarters of screen in both dimensions
      //Change to loose to shrink to size of content
      constraints: BoxConstraints.tight(
          Size(viewport.width * 0.75, viewport.height)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadiusDirectional.horizontal(
              end: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: PaddedColumn(
            mainAxisSize: MainAxisSize.min,
            padding: const EdgeInsets.symmetric(vertical: 20),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DrawerItem(
                icon: Icons.home,
                title: "Dashboard",
                path: "/",
              ),
              DrawerItem(
                icon: Icons.event,
                title: "Events",
                path: "/events",
              ),
              DrawerItem(
                icon: Icons.time_to_leave,
                title: "Excusals",
                path: "/excusals",
              ),
              DrawerItem(
                icon: Icons.grade,
                title: "Grades",
                path: "/grades",
              ),
              DrawerItem(
                icon: Icons.flight_takeoff,
                title: "Leave Locator",
                path: "/leave_locator",
              ),
              DrawerItem(
                icon: Icons.task_rounded,
                title: "Task Management",
                path: "/task_management",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
