import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'package:metro_scout/core/theming/my_text_styles.dart';
import 'package:metro_scout/features/nearest_station/logic/nearest_station_cubit.dart';
import 'package:metro_scout/features/nearest_station/logic/nearest_station_state.dart';
import 'package:metro_scout/features/nearest_station/ui/widgets/location_toggle_buttons.dart';
import 'package:metro_scout/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';

class NearestStationScreen extends StatefulWidget {
  const NearestStationScreen({super.key});

  @override
  State<NearestStationScreen> createState() => _NearestStationScreenState();
}

class _NearestStationScreenState extends State<NearestStationScreen> {
  GoogleMapController? mapController;
  late NearestStationCubit cubit;
  late BitmapDescriptor metroIcon;
  late bool? isMetroNear;
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    _initAsync();
    super.initState();
  }

  void _initAsync() async {
    cubit = context.read<NearestStationCubit>();
    metroIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25.dg, 25.dg)),
      Assets.pngMetro,
    );
  }

  @override
  void didChangeDependencies() {
    cubit.getStations(Localizations.localeOf(context).languageCode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).nearestStation)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: LocationToggleButtons()),
                SizedBox(height: 15.h),
                BlocBuilder<NearestStationCubit, NearestStationState>(
                  buildWhen:
                      (previous, current) =>
                          current is UseCurrentLocationState ||
                          current is SearchByLocationState,
                  builder: (context, state) {
                    if (state is UseCurrentLocationState) {
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Icon(
                                Icons.my_location,
                                color: MyColors.lightPrimary,
                                size: 20.dg,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                S.of(context).useCurrentLocation,
                                style: MyTextStyles.font12PrimarySemiBold,
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                S.of(context).findNearestCurrent,
                                style: MyTextStyles.font11greyRegular,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15.h),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: MyColors.primaryColor,
                                onPressed: () async {
                                  final LatLng? currentLocation = await cubit
                                      .getCurrentLocation(context);
                                  if (currentLocation != null) {
                                    cubit.getNearestStation(currentLocation);
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 15.dg,
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      S.of(context).findNearestStation,
                                      style: MyTextStyles.font12whiteRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Icon(
                                Icons.map,
                                color: MyColors.lightPrimary,
                                size: 20.dg,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                S.of(context).searchByLocation,
                                style: MyTextStyles.font12PrimarySemiBold,
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                S.of(context).searchSpecificLocation,
                                style: MyTextStyles.font11greyRegular,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.h),
                              TextFormField(
                                controller: addressController,
                                style: MyTextStyles.font11greyRegular,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search_outlined,
                                    color: Colors.grey,
                                    size: 15.dg,
                                  ),
                                  hintText: S.of(context).enterAddress,
                                  hintStyle: MyTextStyles.font11greyRegular,
                                  contentPadding: const EdgeInsetsDirectional.only(
                                    start: 16.0,
                                    end: 4.0,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: MyColors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10.h),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.h),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: MyColors.primaryColor,
                                onPressed: () async {
                                  if (addressController.text.isNotEmpty) {
                                    final locations = await locationFromAddress(
                                      addressController.text,
                                    );
                                    if (locations.isNotEmpty) {
                                      cubit.getNearestStation(
                                        LatLng(
                                          locations.first.latitude,
                                          locations.first.longitude,
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 15.dg,
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      S.of(context).searchLocation,
                                      style: MyTextStyles.font12whiteRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 10.h),
                BlocBuilder<NearestStationCubit, NearestStationState>(
                  builder: (context, state) {
                    if (state is NearMetroState) {
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${S.of(context).stationName}: ${state.nearestStation.name}",
                                      style: MyTextStyles.font12PrimarySemiBold,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "${S.of(context).distance}: ${state.distance.toStringAsFixed(2)} ${S.of(context).km}",
                                      style: MyTextStyles.font12greyRegular,
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  final startLat =
                                      state.currentLocation.latitude;
                                  final startLng =
                                      state.currentLocation.longitude;
                                  final destLat = state.nearestStation.lat;
                                  final destLng = state.nearestStation.lng;

                                  final uri = Uri.parse(
                                    'https://www.google.com/maps/dir/?api=1'
                                    '&origin=$startLat,$startLng'
                                    '&destination=$destLat,$destLng'
                                    '&travelmode=transit',
                                  );

                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(
                                      uri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  } else {
                                    throw 'Could not launch $uri';
                                  }
                                },
                                icon: const Icon(Icons.directions),
                                label: Text(S.of(context).navigate),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: MyColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(height: 10.h),
                BlocConsumer<NearestStationCubit, NearestStationState>(
                  listenWhen:
                      (previous, current) => current is NoNearMetroState,
                  buildWhen: (previous, current) {
                    return previous is LoadingState || current is! NoNearMetroState;
                  },
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(S.of(context).noStationsFound)),
                    );
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(
                        child: SizedBox(
                          width: 50.dg,
                          height: 50.dg,
                          child: const CircularProgressIndicator(
                            color: MyColors.primaryColor,
                          ),
                        ),
                      );
                    } else if (state is NearMetroState) {
                      final LatLng southwest = LatLng(
                        min(
                          state.nearestStation.lat,
                          state.currentLocation.latitude,
                        ),
                        min(
                          state.nearestStation.lng,
                          state.currentLocation.longitude,
                        ),
                      );
                      final LatLng northeast = LatLng(
                        max(
                          state.nearestStation.lat,
                          state.currentLocation.latitude,
                        ),
                        max(
                          state.nearestStation.lng,
                          state.currentLocation.longitude,
                        ),
                      );
                      final bounds = LatLngBounds(
                        southwest: southwest,
                        northeast: northeast,
                      );
                      mapController?.animateCamera(
                        CameraUpdate.newLatLngBounds(bounds, 50.dg),
                      );
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                        child: SizedBox(
                          height: 500,
                          child: GoogleMap(
                            gestureRecognizers: {
                              Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer(),
                              ),
                            },
                            onMapCreated: (controller) {
                              mapController = controller;
                              controller.animateCamera(
                                CameraUpdate.newLatLngBounds(bounds, 50.dg),
                              );
                            },
                            onTap: (latLng) {
                              cubit.getNearestStation(latLng);
                            },
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(30.0444, 31.2357), //cairo center
                              zoom: 10,
                            ),
                            markers: {
                              Marker(
                                markerId: const MarkerId("nearestMetro"),
                                icon: metroIcon,
                                position: LatLng(
                                  state.nearestStation.lat,
                                  state.nearestStation.lng,
                                ),
                                infoWindow: InfoWindow(
                                  title: state.nearestStation.name,
                                ),
                              ),
                              Marker(
                                markerId: const MarkerId("currentLocation"),
                                position: state.currentLocation,
                              ),
                            },
                          ),
                        ),
                      );
                    } else if (state is SearchByLocationState) {
                      const LatLng cairoCenter = LatLng(30.0444, 31.2357);
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                        child: SizedBox(
                          height: 500,
                          child: GoogleMap(
                            onTap: (latLng) {
                              cubit.getNearestStation(latLng);
                            },
                            gestureRecognizers: {
                              Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer(),
                              ),
                            },
                            onMapCreated: (controller) {
                              mapController = controller;
                            },
                            initialCameraPosition: const CameraPosition(
                              target: cairoCenter,
                              zoom: 10,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ].animate(interval: .1.seconds).fadeIn().slideX(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}
