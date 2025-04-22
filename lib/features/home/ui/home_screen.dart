import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_scout/core/routing/my_routes.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'package:metro_scout/core/theming/my_text_styles.dart';

import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.train, color: MyColors.primaryColor, size: 24.dg),
            SizedBox(width: 3.w),
            Text(
              S.of(context).metroScout,
              style: MyTextStyles.font20PrimaryBold,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  [
                    SizedBox(height: 10.h),
                    Text(
                      S.of(context).welcomeMetroScout,
                      style: MyTextStyles.font18blackSemiBold,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      S.of(context).tagline,
                      style: MyTextStyles.font13greyRegular,
                    ),
                    SizedBox(height: 20.h),
                    ...[
                      [
                        Icons.location_on,
                        S.of(context).findNearestStation,
                        S.of(context).locateStations,
                       MyRoutes.nearestStationScreen
                      ],
                      [
                        Icons.calculate,
                        S.of(context).calculateFare,
                        S.of(context).checkFare,
                        MyRoutes.calculateFareScreen
                      ],
                      [
                        Icons.map_sharp,
                        S.of(context).metroMap,
                        S.of(context).viewCompleteMetroNetwork,
                        MyRoutes.metroMapScreen
                      ],
                    ].map(
                      (e) => Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        child: SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal: 7.w,
                            ),
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(e.last.toString());
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: Row(
                              children: [
                                Icon(
                                  e.first as IconData,
                                  size: 28.dg,
                                  color: MyColors.lightPrimary,
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e[1].toString(),
                                      style: MyTextStyles.font16PrimarySemiBold,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      e[2].toString(),
                                      style: MyTextStyles.font11greyRegular,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].animate(interval: .07.seconds).fadeIn().slideX(),
            ),
          ),
        ),
      ),
    );
  }
}
