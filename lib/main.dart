import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_scout/core/di/dependency_injection.dart';
import 'package:metro_scout/core/routing/app_router.dart';
import 'package:metro_scout/core/routing/my_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'generated/l10n.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(const MyApp());
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
