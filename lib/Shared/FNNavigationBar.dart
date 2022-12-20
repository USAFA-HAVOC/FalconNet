import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TapIcon.dart';

class FNNavigationBar extends StatelessWidget {
  final Widget child;

  const FNNavigationBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TapIcon(Icons.menu, onTap: () => {
                      print("navigate to menu")
                    }),
                  )
                )
            ),
            Expanded(
                child: GestureDetector(
                  onTap: () => {
                    print("navigate to home")
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
                            child: TapIcon(Icons.person_outline_rounded, onTap: () => {
                              print("navigate to profile")
                            })
                        ),
                      ]
                    )
                  ],
                )
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}