import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_scout/core/di/dependency_injection.dart';
import 'package:metro_scout/core/routing/my_routes.dart';
import 'package:metro_scout/features/calculate_fare/logic/calculate_fare_cubit.dart';
import 'package:metro_scout/features/calculate_fare/ui/calculate_fare_screen.dart';
import 'package:metro_scout/features/home/ui/home_screen.dart';
import 'package:metro_scout/features/metro_map/ui/metro_map_screen.dart';
import 'package:metro_scout/features/nearest_station/logic/nearest_station_cubit.dart';
import 'package:metro_scout/features/nearest_station/ui/nearest_station_screen.dart';

class AppRouter {
  static Route? getRoutes(RouteSettings settings) {

    switch (settings.name) {
      case MyRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case MyRoutes.nearestStationScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<NearestStationCubit>(),
                child: NearestStationScreen(),
              ),
        );
      case MyRoutes.calculateFareScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<CalculateFareCubit>(),
                child: CalculateFareScreen(),
              ),
        );
      case MyRoutes.metroMapScreen:
        return MaterialPageRoute(builder: (context) => MetroMapScreen(),);
      default:
        return null;
    }
  }
}
