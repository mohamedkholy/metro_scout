import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metro_scout/core/di/dependency_injection.dart';
import 'package:metro_scout/core/routing/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'package:metro_scout/firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await initializeFirebase();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: AppRouter.getRoutes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "almarai_bold",
          appBarTheme: AppBarTheme(color: Colors.white),
          scaffoldBackgroundColor: MyColors.scaffoldColor,
        ),
      ),
    );
  }
}
