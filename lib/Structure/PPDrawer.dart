import 'package:flutter/material.dart';

import 'Components/PaddedColumn.dart';
import 'DrawerItem.dart';

///Side menu for page navigation
class PPDrawer extends StatelessWidget {
  const PPDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size viewport = MediaQuery.of(context).size;
    return ConstrainedBox(

      //Sets height as exactly three quarters of screen in both dimensions
      //Change to loose to shrink to size of content
      constraints: BoxConstraints.tight(Size(viewport.width * 0.75, viewport.height * 0.75)),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadiusDirectional.horizontal(end: Radius.circular(10)),
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
                    path: "/permanent_party"
                ),

                DrawerItem(
                    icon: Icons.checklist,
                    title: "Accountability",
                    path: "/permanent_party/accountability"
                ),

                DrawerItem(
                    icon: Icons.people,
                    title: "Unit Management",
                    path: "/permanent_party/unit_management"
                ),
              ],
            ),
          )
      ),
    );
  }
}