import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Model/Store/AppStatus.dart';
import 'package:falcon_net/Router/FNTransitions.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Structure/FailureView.dart';
import 'package:falcon_net/Structure/Pages/Events/Events.dart';
import 'package:falcon_net/Structure/Pages/Profile/Developer.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/TaskManagement.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Accountability/AccountabilityTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Assignment/AssignmentTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/DelegationTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Signing/SDOTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Signing/UnitSigningTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEAnalytics.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEEvent.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitEditor/UnitEditorTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitManagement/UnitManagementTask.dart';
import 'package:falcon_net/Structure/PermanentParty/PassReport.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Model/Database/TimedRole.dart';
import '../Model/Database/User.dart';
import '../Model/Store/Actions/GlobalAction.dart';
import '../Model/Store/Endpoints.dart';
import '../Model/Store/GlobalState.dart';
import '../Structure/FNNavigationBar.dart';
import '../Structure/FNScaffold.dart';
import '../Structure/Pages/Excusals/Excusals.dart';
import '../Structure/PermanentParty/PPDrawer.dart';
import '../Structure/Pages/Dashboard/Dashboard.dart';
import '../Structure/Pages/Grades/Grades.dart';
import '../Structure/Pages/LeaveLocator/LeaveLocator.dart';
import '../Structure/Pages/PassManagement/PassManagement.dart';
import '../Structure/Pages/Profile/Profile.dart';
import '../Structure/Pages/TaskManagement/Tasks/Signing/CWOCTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/Ordering/OrderingTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/StanEval/SEParameters.dart';
import '../Structure/Pages/TaskManagement/Tasks/StanEval/SEUnit.dart';
import '../Structure/Pages/TaskManagement/Tasks/StanEval/StanEvalTask.dart';
import '../Structure/PermanentParty/PPDashboard.dart';
import '../Structure/SelectionView.dart';

/// Enum for the sign in state of the app
enum SignState { signed, account, none }

///Defines page routes within the app and places each within the app scaffold
///Contains each within the default background to prevent
///transparency effects during transitions
GoRouter fnRouter(GlobalKey<NavigatorState> key, SignState sign, bool party) =>
    GoRouter(
        navigatorKey: key,
        initialLocation: sign == SignState.none
            ? "/selection"
            : (party ? "/permanent_party" : "/"),
        observers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
        ],
        routes: [
          GoRoute(
            path: "/login",
            pageBuilder: (context, state) =>
                fullSlideUp(state.extra as Widget)(context, state),
          ),

          GoRoute(
            path: "/selection",
            builder: (context, state) =>
                StoreConnector<GlobalState, ViewModel<void>>(
              converter: (store) => ViewModel(store: store, content: null),
              builder: (context, model) => SelectionView(
                onSigned: () {
                  FirebaseAnalytics.instance.logEvent(name: 'sign-in');
                  model.dispatch(GlobalAction.initialize());
                  context.go("/");
                },
                onDemo: () {
                  demo();
                  FirebaseAnalytics.instance.logEvent(name: 'demo');
                  model.dispatch(GlobalAction.initialize());
                  context.go("/");
                },
              ),
            ),
          ),

          ShellRoute(
              builder: (context, state, child) {
                return StoreConnector<GlobalState, ViewModel<AppStatus>>(
                    converter: (store) =>
                        ViewModel(store: store, content: store.state.status),
                    builder: (context, model) {
                      if (model.content == AppStatus.nominal) {
                        return FNScaffold(
                          navBar: const FNNavigationBar(
                            dashboardPath: "/permanent_party",
                            profilePath: "/permanent_party/profile",
                          ),
                          drawer: const PPDrawer(),
                          child: child,
                        );
                      } else if (model.content == AppStatus.loading) {
                        return LoadingShimmer(
                            height: MediaQuery.of(context)
                                .size
                                .height); // Shimmer on app load
                      } else if (model.content == AppStatus.failed) {
                        return const FailureView(type: FailureType.failed);
                      } else {
                        return const FailureView(type: FailureType.error);
                      }
                    });
              },
              routes: [
                GoRoute(
                    path: "/permanent_party",
                    builder: (context, state) =>
                        const FNBackground(child: PPDashboard()),
                    routes: [
                      GoRoute(
                          path: "profile",
                          pageBuilder: fullSlide(const Profile(
                            party: true,
                          )),
                          routes: [
                            GoRoute(
                                path: "developer",
                                pageBuilder: fullSlide(const Developer()))
                          ]),
                      GoRoute(
                          path: "stan_eval",
                          pageBuilder: fullSlide(StoreConnector<GlobalState,
                                  ViewModel<String>>(
                              converter: (store) => ViewModel(
                                  store: store,
                                  content: store.state.user.assigned_unit!),
                              builder: (context, model) => FutureBuilder(
                                  future: Endpoints.unitGrades(StringRequest(
                                      (r) => r..string = model.content)),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return SEAnalytics(
                                          parameters: SEParameters(
                                              name: model.content,
                                              grades: snapshot.data!));
                                    } else {
                                      return FNPage(
                                          title: "${model.content} Analytics",
                                          children: const [
                                            LoadingShimmer(
                                              height: 200,
                                            )
                                          ]);
                                    }
                                  })))),
                      GoRoute(
                          path: "accountability",
                          pageBuilder: fullSlide(StoreConnector<GlobalState, String>(
                            converter: (store) => store.state.user.assigned_unit!,
                            builder: (context, unit) => AccountabilityTask(unit: unit)
                          ))
                      ),
                      GoRoute(
                          path: "pass-reports",
                          pageBuilder: fullSlide(const PassReport())
                      ),
                      GoRoute(
                          path: "unit_management",
                          pageBuilder: fullSlide(StoreConnector<GlobalState, ViewModel<User>>(
                              converter: (store) => ViewModel(store: store, content: store.state.user),
                              builder: (context, model) => UnitManagementTask(user: model.content)
                          ))),
                      GoRoute(
                          path: "delegation",
                          pageBuilder: fullSlide(StoreConnector<GlobalState,
                                  ViewModel<List<TimedRole>>>(
                              converter: (store) => ViewModel(
                                  store: store,
                                  content: store.state.user.roles.toList()),
                              builder: (context, model) =>
                                  DelegationTask(owner: model.content)))),
                      GoRoute(
                          path: "signing",
                          pageBuilder: fullSlide(const CWOCTask(
                            label: "Signing",
                          ))),
                      GoRoute(
                        path: "unit_assignment",
                        pageBuilder: fullSlide(StoreConnector<GlobalState,
                            ViewModel<List<String>>>(
                          converter: (store) => ViewModel(
                              store: store,
                              content: store.state.user.units.toList()),
                          builder: (context, model) => AssignmentTask(
                            owner: model.content,
                          ),
                        )),
                      ),
                    ])
              ]),

          //Shell route places contents of all sub-routes as child of the scaffold
          ShellRoute(
              builder: (context, state, child) {
                return StoreConnector<GlobalState, ViewModel<AppStatus>>(
                    converter: (store) =>
                        ViewModel(store: store, content: store.state.status),
                    builder: (context, model) {
                      if (model.content == AppStatus.nominal) {
                        return FNScaffold(child: child);
                      } else if (model.content == AppStatus.loading) {
                        return LoadingShimmer(
                            height: MediaQuery.of(context).size.height);
                      } else if (model.content == AppStatus.failed) {
                        return const FailureView(type: FailureType.failed);
                      } else {
                        return const FailureView(type: FailureType.error);
                      }
                    });
              },

              //Each route builds a page under the application scaffold
              routes: [
                GoRoute(
                    path: "/",
                    builder: (context, state) =>
                        const FNBackground(child: Dashboard()),
                    routes: [
                      GoRoute(
                        path: "grades",
                        pageBuilder: fullSlide(const Grades()),
                      ),
                      GoRoute(
                        path: "events",
                        pageBuilder: fullSlide(const Events()),
                      ),
                      GoRoute(
                        path: "excusals",
                        pageBuilder: fullSlide(const Excusals()),
                      ),
                      GoRoute(
                        path: "leave_locator",
                        pageBuilder: fullSlide(const LeaveLocator()),
                      ),
                      GoRoute(
                        path: "pass_management",
                        pageBuilder: fullSlide(const PassManagement()),
                      ),
                      GoRoute(
                          path: "profile",
                          pageBuilder: fullSlide(const Profile()),
                          routes: [
                            GoRoute(
                                path: "developer",
                                pageBuilder: fullSlide(const Developer()))
                          ]),
                      GoRoute(
                          path: "task_management",
                          pageBuilder: fullSlide(const TaskManagement()),
                          routes: [
                            GoRoute(
                              path: "sdo",
                              pageBuilder: fullSlide(const SDOTask()),
                            ),
                            GoRoute(
                              path: "ordering",
                              pageBuilder: fullSlide(const OrderingTask()),
                            ),
                            GoRoute(
                              path: "cwoc",
                              pageBuilder: fullSlide(const CWOCTask()),
                            ),
                            GoRoute(
                              path: "unit_assignment",
                              pageBuilder: fullSlide(
                                StoreConnector<GlobalState,
                                    ViewModel<List<String>>>(
                                  converter: (store) => ViewModel(
                                      store: store,
                                      content: store.state.user.units.toList()),
                                  builder: (context, model) => AssignmentTask(
                                    owner: model.content,
                                  ),
                                ),
                              ),
                            ),
                            GoRoute(
                              path: "event_signing",
                              pageBuilder: fullSlide(const UnitSigningTask()),
                            ),
                            GoRoute(
                              path: "cwoc",
                              pageBuilder: fullSlide(const CWOCTask()),
                            ),
                            GoRoute(
                              path: "unit_editor",
                              pageBuilder: fullSlide(const UnitEditorTask()),
                            ),
                            GoRoute(
                              path: "unit_management",
                              pageBuilder:
                                  fullSlide(StoreConnector<GlobalState, ViewModel<User>>(
                                    converter: (store) => ViewModel(store: store, content: store.state.user),
                                    builder: (context, model) => UnitManagementTask(user: model.content)
                                  )),
                            ),
                            GoRoute(
                              path: "delegation",
                              pageBuilder: fullSlide(StoreConnector<GlobalState,
                                  ViewModel<List<TimedRole>>>(
                                converter: (store) => ViewModel(
                                    store: store,
                                    content: store.state.user.roles.toList()),
                                builder: (context, model) => DelegationTask(
                                  owner: model.content,
                                ),
                              )),
                            ),
                            GoRoute(
                                path: "accountability",
                                pageBuilder: fullSlide(StoreConnector<GlobalState, String>(
                                  converter: (store) => store.state.user.assigned_unit!,
                                  builder: (context, unit) => AccountabilityTask(unit: unit)
                                ))
                            ),
                            GoRoute(
                                path: "stan_eval",
                                pageBuilder: fullSlide(const StanEvalTask()),
                                routes: [
                                  GoRoute(
                                      path: "unit",
                                      pageBuilder: (context, state) =>
                                          fullSlide(SEUnit(
                                                  unit: state.extra as String))(
                                              context, state),
                                      routes: [
                                        GoRoute(
                                            path: "analytics",
                                            pageBuilder: (context, state) =>
                                                fullSlide(SEAnalytics(
                                                        parameters: state.extra
                                                            as SEParameters))(
                                                    context, state)),
                                        GoRoute(
                                            path: "event",
                                            pageBuilder: (context, state) =>
                                                fullSlide(SEEvent(
                                                        parameters: state.extra
                                                            as SEEventParameters))(
                                                    context, state)),
                                      ])
                                ]),
                          ]),
                    ])
              ])
        ]);
