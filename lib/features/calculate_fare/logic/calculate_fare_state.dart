import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/models/station_data.dart';

sealed class CalculateFareState{
}


class InitialState extends CalculateFareState{
}

class LoadingState extends CalculateFareState{
}

class LoadedState extends CalculateFareState{
  final List<StationData> stations;
  final int estimatedTime;
  final int ticketPrice;
  LoadedState(this.stations, this.estimatedTime, this.ticketPrice);
}