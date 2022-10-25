// ignore_for_file: depend_on_referenced_packages

import 'package:falconnet/api/api.dart';
import 'package:falconnet/api/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'router/app_router.dart';
import 'theme/theme.dart';

/// Function first called when running the project
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Removes hash from the Web routes
  // usePathUrlStrategy();

  /// Initialize Hive
  // await Hive.initFlutter();
  // final hiveStorageService = HiveStorageService();
  // await hiveStorageService.openBox('falcon_net');

  /// Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  /// Run the app
  runApp( const FalconNetApp());
}

/// Starting point of our Flutter application
class FalconNetApp extends StatelessWidget {
  const FalconNetApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        /// Size of the device the designer uses in their designs on Figma
        designSize: const Size(412, 732),
        builder: (_, __) => riverpod.Consumer(
          builder: (context, ref, child) {
            final router = AppRouter(ref);

            return MultiProvider(
              providers: [
                Provider(create: (_) => Cadet((b) => b
                  ..id = ''
                  ..first_name = ''
                  ..last_name = ''
                  ..room_num = ''
                  ..accountability = false
                  ..email = ''
                  ..squadron = 0
                  ..group = 0
                  ..unit = ''
                )),
              ],
              child: MaterialApp.router(
                title: 'FalconNet',
                debugShowCheckedModeBanner: false,
                routerDelegate: router.appRouter.routerDelegate,
                routeInformationParser: router.appRouter.routeInformationParser,
                routeInformationProvider: router.appRouter.routeInformationProvider,
                theme: AppThemes.primary(),
              )
            );
          },
        ),
      );
}
