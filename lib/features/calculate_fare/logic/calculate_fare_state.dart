import 'package:metro_scout/core/database/my_database.dart';

sealed class CalculateFareState{
}


class InitialState extends CalculateFareState{
}

class LoadingState extends CalculateFareState{
}

class LoadedState extends CalculateFareState{
  final List<Station> stations;
  final int estimatedTime;
  final int ticketPrice;
  LoadedState(this.stations, this.estimatedTime, this.ticketPrice);
}