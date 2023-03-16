import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Common background for all falcon net pages
///Cannot be included in shell path to prevent transparency effects
class FNBackground extends StatelessWidget {
  final Widget child;

  const FNBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: child,
    );
  }
}

CustomTransitionPage<void> Function(BuildContext, GoRouterState) fullSlide(Widget child) {
  return (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, primary, secondary, child) {
        late final Animation<Offset> offsetAnimation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: primary,
          curve: Curves.easeInOut,
        ));
        return SlideTransition(position: offsetAnimation, child: FNBackground(child: child,));
      }
  );
}

CustomTransitionPage<void> Function(BuildContext, GoRouterState) fullSlideUp(Widget child) {
  return (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, primary, secondary, child) {
        late final Animation<Offset> offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: primary,
          curve: Curves.linear,
        ));
        return SlideTransition(position: offsetAnimation, child: FNBackground(child: child,));
      }
  );
}