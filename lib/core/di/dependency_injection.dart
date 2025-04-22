import 'package:get_it/get_it.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/features/calculate_fare/data/repos/calculate_fare_repo.dart';
import 'package:metro_scout/features/calculate_fare/logic/calculate_fare_cubit.dart';
import 'package:metro_scout/features/nearest_station/data/repos/nearest_station_repo.dart';
import 'package:metro_scout/features/nearest_station/logic/nearest_station_cubit.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<MyDatabase>(() => MyDatabase());
  getIt.registerFactory<NearestStationRepo>(() => NearestStationRepo(getIt()));
  getIt.registerFactory<NearestStationCubit>(() => NearestStationCubit(getIt()));
  getIt.registerFactory<CalculateFareRepo>(() => CalculateFareRepo(getIt()));
  getIt.registerFactory<CalculateFareCubit>(() => CalculateFareCubit(getIt()));
}
