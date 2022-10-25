import 'package:falconnet/api/api.dart';
import 'package:falconnet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../api/models.dart';

class FalconNavigationBar extends StatefulWidget {
  const FalconNavigationBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<FalconNavigationBar> createState() {
    return FalconNavigationBarState();
  }
}

class FalconNavigationBarState extends State<FalconNavigationBar> {
  Cadet cadet = Cadet((b) => b
                  ..id = ''
                  ..first_name = ''
                  ..last_name = ''
                  ..room_num = ''
                  ..accountability = false
                  ..email = ''
                  ..squadron = 0
                  ..group = 0
                  ..unit = ''
                );

  bool loaded = false;

  FalconNavigationBarState() : super();

  @override
  Widget build(BuildContext context) {
      if (!loaded) {
        login("c26Ben.MURPHY@afacademy.af.edu").then((value) {
          setState(() {
            cadet = value;
            loaded = true;
          });
        });
      }
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          flexibleSpace: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              SizedBox(
                width: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Material(
                        color: const Color(0xffD9D9D9),
                        child: InkWell(
                          onTap: () => GoRouter.of(context).go('/profile'),
                          splashColor: Colors.grey[500],
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.person_outline_rounded),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, ${cadet.first_name}!'),
                        Text('USAFCW/CS-${cadet.squadron}'),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 120,
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    unselectedFontSize: 1,
                    selectedFontSize: 1,
                    elevation: 2,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: SvgPicture.asset(
                          'assets/icons/home.svg',
                          height: 25,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          'assets/icons/pen.png',
                          height: 25,
                        ),
                        label: 'Dashboard',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset('assets/icons/exam.png'),
                        label: 'Grades',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/icons/food.svg'),
                        label: 'Food',
                      ),
                    ],
                    currentIndex: _calculateSelectedIndex(context),
                    onTap: (int idx) => _onItemTapped(idx, context),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: widget.child,
      );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/dashboard')) {
      return 1;
    }
    if (location.startsWith('/grades')) {
      return 2;
    }
    if (location.startsWith('/food')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/dashboard');
        break;
      case 2:
        GoRouter.of(context).go('/grades');
        break;
      case 3:
        GoRouter.of(context).go('/food');
        break;
    }
  }
}