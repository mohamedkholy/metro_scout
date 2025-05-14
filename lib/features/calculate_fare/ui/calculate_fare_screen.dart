import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/models/station_data.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'package:metro_scout/core/theming/my_text_styles.dart';
import 'package:metro_scout/features/calculate_fare/ui/widgets/stations_autocomplete.dart';
import 'package:metro_scout/features/calculate_fare/logic/calculate_fare_cubit.dart';
import 'package:metro_scout/features/calculate_fare/logic/calculate_fare_state.dart';
import 'package:metro_scout/generated/l10n.dart';

class CalculateFareScreen extends StatelessWidget {
  StationData? startingStation;
  StationData? destinationStation;
  final GlobalKey<FormState> formKey = GlobalKey();

  CalculateFareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S
          .of(context)
          .calculateFare)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10.dg, 10.dg, 10.dg, 20.dg),
            child: FutureBuilder(
              future: context.read<CalculateFareCubit>().getStations(
                Localizations
                    .localeOf(context)
                    .languageCode,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  var stations = snapshot.data as List<StationData>;
                  return Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        StationsAutocomplete(
                          stations: stations,
                          onSelected: (station) {
                            startingStation = station;
                          },
                          validate: () {
                            if (startingStation == destinationStation) {
                              return S
                                  .of(context)
                                  .sameStationError;
                            }
                            return null;
                          },
                          title: S
                              .of(context)
                              .fromStation,
                          hint: S
                              .of(context)
                              .selectStartStation,
                        ),
                        SizedBox(height: 10.h),
                        StationsAutocomplete(
                          stations: stations,
                          onSelected: (station) {
                            destinationStation = station;
                          },
                          validate: () {
                            if (startingStation == destinationStation) {
                              return S
                                  .of(context)
                                  .sameStationError;
                            }
                            return null;
                          },
                          title: S
                              .of(context)
                              .toStation,
                          hint: S
                              .of(context)
                              .selectDestinationStation,
                        ),
                        SizedBox(height: 15.h),
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: MyColors.primaryColor,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<CalculateFareCubit>()
                                  .calculateFare(
                                startingStation!,
                                destinationStation!,
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 15.dg,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                S
                                    .of(context)
                                    .calculateFare,
                                style: MyTextStyles.font12whiteRegular,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        BlocBuilder<CalculateFareCubit, CalculateFareState>(
                          builder: (context, state) {
                            if (state is LoadingState) {
                              return Center(
                                child: SizedBox(
                                  width: 50.dg,
                                  height: 50.dg,
                                  child: CircularProgressIndicator(
                                    color: MyColors.primaryColor,
                                  ),
                                ),
                              );
                            } else if (state is LoadedState) {
                              return Column(
                                children:
                                [
                                  Card(
                                    color: Colors.white,
                                    elevation: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.dg),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S
                                                .of(context)
                                                .routeDetails,
                                            style:
                                            MyTextStyles
                                                .font16PrimarySemiBold,
                                          ),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              Container(
                                                width: 8.dg,
                                                height: 8.dg,
                                                decoration: BoxDecoration(
                                                  shape:
                                                  BoxShape.circle,
                                                  color:
                                                  MyColors
                                                      .primaryColor,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                  ),
                                                  height: 2.h,
                                                  color: MyColors.grey,
                                                ),
                                              ),
                                              Container(
                                                width: 8.dg,
                                                height: 8.dg,
                                                decoration: BoxDecoration(
                                                  shape:
                                                  BoxShape.circle,
                                                  color:
                                                  MyColors
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12.h),
                                          ...[
                                            [
                                              Icons.train_outlined,
                                              S
                                                  .of(context)
                                                  .totalStations,
                                              "${state.stations.length} ${S
                                                  .of(context)
                                                  .stations}",
                                            ],
                                            [
                                              Icons.access_time_rounded,
                                              S
                                                  .of(context)
                                                  .estimatedTime,
                                              "${state.estimatedTime} ${S
                                                  .of(context)
                                                  .minutes}",
                                            ],
                                            [
                                              Icons
                                                  .monetization_on_outlined,
                                              S
                                                  .of(context)
                                                  .ticketPrice,
                                              "${state.ticketPrice} ${S
                                                  .of(context)
                                                  .egp}",
                                            ],
                                          ].map(
                                                (e) =>
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: 8.h,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            e.first
                                                            as IconData,
                                                            size: 15.dg,
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          Text(
                                                            e[1].toString(),
                                                            style:
                                                            MyTextStyles
                                                                .font14PrimarySemiBold,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        e.last.toString(),
                                                        style:
                                                        MyTextStyles
                                                            .font14PrimarySemiBold,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Card(
                                    color: Colors.white,
                                    elevation: 2,
                                    child: Container(
                                      margin: EdgeInsets.all(10.dg),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S
                                                .of(context)
                                                .stations,
                                            style:
                                            MyTextStyles
                                                .font16PrimarySemiBold,
                                          ),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              Container(
                                                width: 8.dg,
                                                height: 8.dg,
                                                decoration: BoxDecoration(
                                                  shape:
                                                  BoxShape.circle,
                                                  color:
                                                  MyColors
                                                      .primaryColor,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                  ),
                                                  height: 2.h,
                                                  color: MyColors.grey,
                                                ),
                                              ),
                                              Container(
                                                width: 8.dg,
                                                height: 8.dg,
                                                decoration: BoxDecoration(
                                                  shape:
                                                  BoxShape.circle,
                                                  color:
                                                  MyColors
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12.h),
                                          ListView.builder(
                                            physics:
                                            NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                            state.stations.length,
                                            itemBuilder: (context,
                                                index,) {
                                              var station =
                                              state.stations[index];
                                              return Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                          7.dg,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                          station.line ==
                                                              1
                                                              ? CupertinoColors
                                                              .activeBlue
                                                              : station.line ==
                                                              2
                                                              ? Colors
                                                              .red
                                                              : CupertinoColors
                                                              .activeGreen,
                                                          shape:
                                                          BoxShape
                                                              .circle,
                                                        ),
                                                      ),
                                                      if (index !=
                                                          state
                                                              .stations
                                                              .length -
                                                              1)
                                                        Container(
                                                          height: 15.w,
                                                          width: 2,
                                                          color:
                                                          Colors
                                                              .grey,
                                                        ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    station.name,
                                                    style:
                                                    MyTextStyles
                                                        .font11greyRegular,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].animate(interval: .05.seconds)
                                    .fadeIn()
                                    .slideY(),
                              );
                            }
                            return Container();
                          },
                        ),
                      ].animate(interval: .1.seconds).fadeIn().slideX(),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
