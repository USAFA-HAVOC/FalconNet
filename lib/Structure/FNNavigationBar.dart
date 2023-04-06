import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Overhead navigation bar
class FNNavigationBar extends StatefulWidget {
  final String dashboardPath;
  final String profilePath;

  const FNNavigationBar({super.key, this.dashboardPath = "/", this.profilePath = "/profile"});

  @override
  State<StatefulWidget> createState() => FNNavigationBarState();
}

class FNNavigationBarState extends State<FNNavigationBar> {
  bool global = true;
  bool profile = false;
  bool first = true;
  void Function() listener = () => {};
  GoRouter? router;

  @override
  void dispose() {
    super.dispose();

    router?.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {

    router = GoRouter.of(context);
    if (first) {
      listener = () => setState(() {
        global = !GoRouter.of(context).location.contains("/task_management/");
        profile = GoRouter.of(context).location.contains("/profile");
      });
      first = false;
      router?.addListener(listener);
    }

    return LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.bottomStart,

                //Set to opaque in order to capture taps on invisible padding
                //Otherwise, will only capture taps directly on icon
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (global) {
                      Scaffold.of(context).openDrawer();
                    }
                    else {
                      context.pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(25),

                    child: Icon(
                      global ? Icons.menu : Icons.arrow_back,
                    ),
                  ),
                ),
              ),
            ),



            Expanded(

              //Navigates to home
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,

                  onTap: () {
                    context.go(widget.dashboardPath);
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      "assets/images/aflogo.png",
                      height: 60,
                    ),

                  )
              ),
            ),

            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (profile) {
                            context.go(widget.dashboardPath);
                          }
                          else {
                            context.go(widget.profilePath);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Icon(Icons.person_rounded),
                        ),
                      ),
                    )
                  ]
              ),
            ),
          ],
        )
    );
  }
}