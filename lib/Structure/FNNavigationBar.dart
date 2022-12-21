import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Shared/TapIcon.dart';

class FNNavigationBar extends StatelessWidget {
  const FNNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TapIcon(
                    Icons.menu,
                    color: Colors.black,
                    onTap: () {
                      print("navigate to menu");
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                print("navigate to home");
                context.go("/");
              },
              child: Image.asset(
                "aflogo.png",
                height: 50,
              ),
            )
        ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: TapIcon(Icons.notifications, onTap: () => {
                            print("navigate to notifications")
                          })
                      ),
                      Expanded(
                          child: TapIcon(Icons.person_outline_rounded, onTap: () {
                            print("navigate to profile");
                            context.go("/profile");
                          })
                      ),
                    ]
                )
              ],
            )
        ),
      ],
    );
  }
}