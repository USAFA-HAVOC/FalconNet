import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> Function(BuildContext, GoRouterState) slideFade(Widget child) {
  return (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, primary, secondary, child) {
        late final Animation<Offset> offsetAnimation = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0.0),
        ).animate(CurvedAnimation(
          parent: primary,
          curve: Curves.easeIn,
        ));
        var slide = SlideTransition(position: offsetAnimation, child: child);
        return FadeTransition(opacity: primary, child: slide);
      }
  );
}