import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FalconNavigationBar extends StatelessWidget {
  const FalconNavigationBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        flexibleSpace: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
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
                        // overlayColor: MaterialStateProperty.all(Colors.black),
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
                    children: const [
                      Text('Hi, David!'),
                      Text('USAFCW/CS-25'),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedFontSize: 1,
                selectedFontSize: 1,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_box_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: '',
                  ),
                ],
                currentIndex: _calculateSelectedIndex(context),
                onTap: (int idx) => _onItemTapped(idx, context),
              ),
            ),
          ],
        ),
      ),
      body: child,
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
    if (location.startsWith('/settings')) {
      return 2;
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
        GoRouter.of(context).go('/settings');
        break;
    }
  }
}
