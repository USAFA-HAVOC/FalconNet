import 'package:falconnet/features/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

import '../features/dashboard/pages/dashboard_page.dart';
import '../features/food/pages/food_page.dart';
import '../features/grades/pages/grades_page.dart';
import '../features/home/pages/home_page.dart';
import '../shared/falcon_navigation_bar.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter(WidgetRef ref) {
    appRouter = _getAppRouter(ref);
  }

  /// Use this for testing to change the initial
  /// location and quickly access some page
  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  late GoRouter appRouter;
  static String initialLocation = RoutePaths.home;

  GoRouter _getAppRouter(WidgetRef ref) => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: initialLocation,
        debugLogDiagnostics: true,
        routerNeglect: true,
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return FalconNavigationBar(child: child);
            },
            routes: [
              GoRoute(
                path: RoutePaths.home,
                name: RouteNames.home,
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                ),
                pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: HomePage(
                    key: state.pageKey,
                  ),
                ),
              ),
              GoRoute(
                path: RoutePaths.dashboard,
                name: RouteNames.dashboard,
                pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: DashboardPage(
                    key: state.pageKey,
                  ),
                ),
                builder: (context, state) => DashboardPage(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: RoutePaths.grades,
                name: RouteNames.grades,
                pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: GradesPage(
                    key: state.pageKey,
                  ),
                ),
              ),
              GoRoute(
                path: RoutePaths.food,
                name: RouteNames.food,
                pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: FoodPage(
                    key: state.pageKey,
                  ),
                ),
              ),
              GoRoute(
                path: RoutePaths.profile,
                name: RouteNames.profile,
                pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: ProfilePage(
                    key: state.pageKey,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
