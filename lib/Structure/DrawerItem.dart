import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Drawer menu item displaying an icon and destination
///On click, navigates to its given destination and closes the drawer
class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String path;

  const DrawerItem({super.key, required this.icon, required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      //Closes drawer and navigates to given path
        onTap: () {
          context.go(path);
          Scaffold.of(context).closeDrawer();
        },

        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Icon(icon)
            ),

            const Spacer(flex: 1,),

            Expanded(
              flex: 7,
              child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium
              ),
            )
          ],
        )
    );
  }
}