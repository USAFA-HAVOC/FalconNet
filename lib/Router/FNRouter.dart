import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Roles.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Model/Store/AppStatus.dart';
import 'package:falcon_net/Router/FNTransitions.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Structure/Pages/Failure.dart';
import 'package:falcon_net/Structure/Pages/Profile/Developer.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/TaskManagement.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/AccountabilityTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Assignment/AssignmentTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/DelegationTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEAnalytics.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEEvent.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitEditor/UnitEditorTask.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitManagement/UnitManagementTask.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Model/Database/TimedRole.dart';
import '../Model/Database/User.dart';
import '../Model/Store/Actions/GlobalAction.dart';
import '../Model/Store/Endpoints.dart';
import '../Model/Store/GlobalState.dart';
import '../Structure/FNNavigationBar.dart';
import '../Structure/FNScaffold.dart';
import '../Structure/PermanentParty/PPDrawer.dart';
import '../Structure/Pages/Dashboard/Dashboard.dart';
import '../Structure/Pages/Grades/Grades.dart';
import '../Structure/Pages/LeaveLocator/LeaveLocator.dart';
import '../Structure/Pages/PassManagement/PassManagement.dart';
import '../Structure/Pages/Profile/Profile.dart';
import '../Structure/Pages/TaskManagement/Tasks/CWOCTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/Ordering/OrderingTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/SDOTask.dart';
import '../Structure/Pages/TaskManagement/Tasks/StanEval/SEParameters.dart';
import '../Structure/Pages/TaskManagement/Tasks/StanEval/SEUnit.dart';
import '../Structure/Pages/TaskManagement/Tasks/StanEval/StanEvalTask.dart';
import '../Structure/PermanentParty/PPDashboard.dart';
import '../Structure/SelectionView.dart';

enum SignState {
  signed,
  account,
  none
}

///Defines page routes within the app and places each within the app scaffold
///Contains each within the default background to prevent
///transparency effects during transitions
GoRouter fnRouter(GlobalKey<NavigatorState> key, SignState sign, bool party) => GoRouter(
  navigatorKey: key,
  initialLocation: sign == SignState.none ? "/selection" : (party ? "/permanent_party" : "/"),
  routes: [
    GoRoute(
      path: "/login",
      pageBuilder: (context, state) => fullSlideUp(state.extra as Widget)(context, state),
    ),

    GoRoute(
      path: "/selection",
      builder: (context, state) => StoreConnector<GlobalState, ViewModel<void>>(
        converter: (store) => ViewModel(store: store, content: null),
        builder: (context, model) => SelectionView(
            onSigned: () {
              model.dispatch(GlobalAction.initialize());
              context.go("/");
            },
            onDemo: () {
              demo();
              model.dispatch(GlobalAction.initialize());
              context.go("/");
            }
        ),
      )
    ),

    ShellRoute(
      builder: (context, state, child) {
        return StoreConnector<GlobalState, ViewModel<AppStatus>>(
            converter: (store) => ViewModel(store: store, content: store.state.status),
            builder: (context, model) {
              if (model.content == AppStatus.nominal) {
                return FNScaffold(
                  navBar: const FNNavigationBar(
                    dashboardPath: "/permanent_party",
                    profilePath: "/permanent_party/profile",
                  ),
                  drawer: const PPDrawer(),
                  child: child
                );
              }
              else if (model.content == AppStatus.loading) {
                return LoadingShimmer(height: MediaQuery.of(context).size.height);
              }
              else if (model.content == AppStatus.failed) {
                return const Failure(type: FailureType.failed);
              }
              else {
                return const Failure(type: FailureType.error);
              }
            }
        );
      },

      routes: [
        GoRoute(
          path: "/permanent_party",
          builder: (context, state) => const FNBackground(child: PPDashboard()),
          routes: [
            GoRoute(
                path: "profile",
                pageBuilder: fullSlide(const Profile(party: true,)),
                routes: [
                  GoRoute(
                      path: "developer",
                      pageBuilder: fullSlide(const Developer())
                  )
                ]
            ),

            GoRoute(
                path: "stan_eval",
                pageBuilder: fullSlide(StoreConnector<GlobalState, ViewModel<String>>(
                  converter: (store) => ViewModel(store: store, content: store.state.user.personal_info.unit!),
                  builder: (context, model) => FutureBuilder(
                      future: Endpoints.unitGrades(StringRequest((r) => r..string = model.content)),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SEAnalytics(parameters: SEParameters(
                            name: model.content,
                            grades: snapshot.data!
                          ));
                        }
                        else {
                          return FNPage(
                            title: "${model.content} Analytics",
                            children: const [
                              LoadingShimmer(height: 200,)
                            ]
                          );
                        }
                      }
                  )
                ))
            ),

            GoRoute(
              path: "accountability",
              pageBuilder: fullSlide(const AccountabilityTask())
            ),

            GoRoute(
              path: "unit_management",
              pageBuilder: fullSlide(const UnitManagementTask())
            ),

            GoRoute(
              path: "delegation",
              pageBuilder: fullSlide(StoreConnector<GlobalState, ViewModel<List<TimedRole>>>(
                converter: (store) => ViewModel(store: store, content: store.state.user.roles.toList()),
                builder: (context, model) => DelegationTask(owner: model.content)
              ))
            ),

            GoRoute(
              path: "signing",
              pageBuilder: fullSlide(const CWOCTask(label: "Signing",))
            ),

            GoRoute(
              path: "unit_assignment",
              pageBuilder: fullSlide(
                  StoreConnector<GlobalState, ViewModel<User>>(
                    converter: (store) => ViewModel(store: store, content: store.state.user),
                    builder: (context, model) => AssignmentTask(
                      info: model.content.personal_info,
                      type: AssignmentType.unit,
                      scope: AssignmentScope.all,
                    ),
                  )
              ),
            ),

            GoRoute(
              path: "squadron_assignment",
              pageBuilder: fullSlide(
                  StoreConnector<GlobalState, ViewModel<User>>(
                    converter: (store) => ViewModel(store: store, content: store.state.user),
                    builder: (context, model) => AssignmentTask(
                      info: model.content.personal_info,
                      type: AssignmentType.squadron,
                      scope: AssignmentScope.all,
                    ),
                  )
              ),
            ),
          ]
        )
      ]
    ),

    //Shell route places contents of all sub-routes as child of the scaffold
    ShellRoute(
        builder: (context, state, child) {
          return StoreConnector<GlobalState, ViewModel<AppStatus>>(
            converter: (store) => ViewModel(store: store, content: store.state.status),
            builder: (context, model) {
              if (model.content == AppStatus.nominal) {
                return FNScaffold(
                    child: child
                );
              }
              else if (model.content == AppStatus.loading) {
                return LoadingShimmer(height: MediaQuery.of(context).size.height);
              }
              else if (model.content == AppStatus.failed) {
                return const Failure(type: FailureType.failed);
              }
              else {
                return const Failure(type: FailureType.error);
              }
            }
          );
        },

        //Each route builds a page under the application scaffold
        routes: [
          GoRoute(
              path: "/",
              builder: (context, state) => const FNBackground(child: Dashboard()),
              routes: [
                GoRoute(
                  path: "grades",
                  pageBuilder: fullSlide(const Grades()),
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
                          pageBuilder: fullSlide(const Developer())
                      )
                    ]
                ),

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
                          StoreConnector<GlobalState, ViewModel<User>>(
                            converter: (store) => ViewModel(store: store, content: store.state.user),
                            builder: (context, model) => AssignmentTask(
                              info: model.content.personal_info,
                              type: AssignmentType.unit,
                              scope: model.content.roles.any((r) => r.role == Roles.fn_admin.name || r.role == Roles.wing_admin.name) ?
                              AssignmentScope.all : AssignmentScope.own,
                            ),
                          ),
                        ),
                      ),

                      GoRoute(
                        path: "squadron_assignment",
                        pageBuilder: fullSlide(
                          StoreConnector<GlobalState, ViewModel<User>>(
                            converter: (store) => ViewModel(store: store, content: store.state.user),
                            builder: (context, model) => AssignmentTask(
                              info: model.content.personal_info,
                              type: AssignmentType.squadron,
                              scope: model.content.roles.any((r) => r.role == Roles.fn_admin.name || r.role == Roles.wing_admin.name) ?
                              AssignmentScope.all : AssignmentScope.own,
                            ),
                          )
                        ),
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
                        pageBuilder: fullSlide(const UnitManagementTask()),
                      ),

                      GoRoute(
                        path: "delegation",
                        pageBuilder: fullSlide(
                          StoreConnector<GlobalState, ViewModel<List<TimedRole>>>(
                            converter: (store) => ViewModel(store: store, content: store.state.user.roles.toList()),
                            builder: (context, model) => DelegationTask(owner: model.content,),
                          )
                        ),
                      ),

                      GoRoute(
                        path: "accountability",
                        pageBuilder: fullSlide(const AccountabilityTask())
                      ),

                      GoRoute(
                        path: "stan_eval",
                        pageBuilder: fullSlide(const StanEvalTask()),
                        routes: [
                          GoRoute(
                            path: "unit",
                            pageBuilder: (context, state) => fullSlide(SEUnit(unit: state.extra as String))(context, state),
                            routes: [
                              GoRoute(
                                path: "analytics",
                                pageBuilder: (context, state) => fullSlide(SEAnalytics(parameters: state.extra as SEParameters))(context, state)
                              ),

                              GoRoute(
                                  path: "event",
                                  pageBuilder: (context, state) => fullSlide(SEEvent(
                                      parameters: state.extra as SEEventParameters
                                  ))(context, state)
                              ),
                            ]
                          )
                        ]
                      ),
                    ]
                ),
              ]
          )
        ]
    )
  ]
);
