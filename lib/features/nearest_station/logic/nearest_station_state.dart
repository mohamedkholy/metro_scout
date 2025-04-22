import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metro_scout/core/database/my_database.dart';

sealed class NearestStationState {}

class UseCurrentLocationState extends NearestStationState {}

class SearchByLocationState extends NearestStationState {}

class NoNearMetroState extends NearestStationState {}

class LoadingState extends NearestStationState {}

class NearMetroState extends NearestStationState {
  final LatLng currentLocation;
  final Station nearestStation;
  final double distance;

  NearMetroState(this.currentLocation, this.nearestStation, this.distance);
}
