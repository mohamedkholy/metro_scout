import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'package:metro_scout/core/theming/my_text_styles.dart';
import 'package:metro_scout/features/nearest_station/data/repos/nearest_station_repo.dart';
import 'package:metro_scout/features/nearest_station/logic/nearest_station_state.dart';
import 'package:metro_scout/generated/assets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NearestStationCubit extends Cubit<NearestStationState> {
  final NearestStationRepo _repo;
  late final List<Station> stations;
  LatLng? currentLocation;
  Station? nearestStation;
  double? distance;

  NearestStationCubit(this._repo) : super(UseCurrentLocationState());

  getStations() async {
    stations = await _repo.getStations();
  }

  toggleLocationOptionsButtons(int index) {
    if (index == 0) {
      emit(UseCurrentLocationState());
    } else {
      emit(SearchByLocationState());
    }
    if (currentLocation != null && nearestStation != null && distance!=null) {
      emit(NearMetroState(currentLocation!, nearestStation!,distance!));
    }
  }

  Future<LatLng?> getCurrentLocation(BuildContext context) async {
    if (await checkLocationService(context)) {
      if (await checkLocationPermission(context)) {
        emit(LoadingState());
        var position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        );
        return LatLng(position.latitude, position.longitude);
      }
    }
    return null;
  }

  Future<bool> checkLocationService(BuildContext context) async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      Alert(
        context: context,
        image: SvgPicture.asset(Assets.svgWorldMap, height: 100.h),
        title: "Location Service",
        desc: "To get your current location enable the location service",
        style: AlertStyle(
          titleStyle: MyTextStyles.font18PrimarySemiBold,
          descStyle: MyTextStyles.font13greyRegular,
        ),
        buttons: [
          DialogButton(
            color: MyColors.primaryColor,
            child: Text(
              "ENABLE LOCATION SERVICE",
              style: MyTextStyles.font12whiteRegular,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              await Geolocator.openLocationSettings();
            },
          ),
        ],
      ).show();
      return false;
    }
    return true;
  }

  Future<bool> checkLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    switch (permission) {
      case LocationPermission.denied:
        showDenialDialog(context, LocationPermission.denied);
        return false;
      case LocationPermission.deniedForever:
        showDenialDialog(context, LocationPermission.deniedForever);
        return false;
      default:
        return true;
    }
  }

  showDenialDialog(
    BuildContext context,
    LocationPermission locationPermission,
  ) async {
    Alert(
      context: context,
      image: SvgPicture.asset(Assets.svgMap, height: 100.h),
      title: "Location Permission",
      desc:
          locationPermission == LocationPermission.denied
              ? "To get your current location you must accept the location permission"
              : "You need to allow location permission from settings",
      style: AlertStyle(
        titleStyle: MyTextStyles.font18PrimarySemiBold,
        descStyle: MyTextStyles.font13greyRegular,
      ),
      buttons: [
        DialogButton(
          color: MyColors.primaryColor,
          child: Text(
            locationPermission == LocationPermission.denied
                ? "Ask Again"
                : "Go to settings",
            style: MyTextStyles.font12whiteRegular,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
            if (locationPermission == LocationPermission.denied) {
              checkLocationPermission(context);
            } else {
              Geolocator.openAppSettings();
            }
          },
        ),
      ],
    ).show();
  }

  getNearestStation(LatLng currentLocation) {
    Station nearestStation = stations.first;
    for (var station in stations) {
      var lngDiff = (currentLocation.longitude - nearestStation.lng).abs();
      var latDiff = (currentLocation.latitude - nearestStation.lat).abs();
      var stationLngDiff = (currentLocation.longitude - station.lng).abs();
      var stationLatDiff = (currentLocation.latitude - station.lat).abs();
      if (sqrt(pow(stationLatDiff, 2) + pow(stationLngDiff, 2)) <
          sqrt(pow(latDiff, 2) + pow(lngDiff, 2))) {
        nearestStation = station;
      }
    }
    var distance = distanceToMetro(currentLocation, nearestStation);
    if (distance > 20) {
      emit(NoNearMetroState());
      return;
    }
    this.currentLocation = currentLocation;
    this.nearestStation = nearestStation;
    this.distance=distance;
    emit(NearMetroState(currentLocation, nearestStation,distance));
  }

  double distanceToMetro(LatLng currentLocation, Station nearestStation) {
    double distance =
        Geolocator.distanceBetween(
          currentLocation.latitude,
          currentLocation.longitude,
          nearestStation.lat,
          nearestStation.lng,
        ) /
        1000;
    return distance;
  }
}
