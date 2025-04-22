import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/features/calculate_fare/data/models/station_node.dart';
import 'package:metro_scout/features/calculate_fare/data/repos/calculate_fare_repo.dart';
import 'package:metro_scout/features/calculate_fare/logic/calculate_fare_state.dart';

class CalculateFareCubit extends Cubit<CalculateFareState> {
  final CalculateFareRepo _repo;
  List<Station>? stations;

  CalculateFareCubit(this._repo) : super(InitialState());

  Future<List<Station>> getStations() async {
    var result = await _repo.getStations();
    result.sort((a, b) => a.stationName.compareTo(b.stationName));
    stations ??= result.toList();
    return result;
  }

  calculateFare(Station startingStation, Station destinationStation) {
    emit(LoadingState());
    List<StationNode> stationNodes =
        stations!.map((e) => StationNode(e)).toList();
    StationNode start = stationNodes.firstWhere(
      (element) => element.station.stationName == startingStation.stationName,
    );
    Queue<List<StationNode>> paths = Queue.of([
      [start],
    ]);
    while (paths.isNotEmpty) {
      List<StationNode> path = paths.removeFirst();
      StationNode currentNode = path.last;
      if (currentNode.isVisited) {
        continue;
      }
      currentNode.isVisited = true;
      if (currentNode.station.stationName == destinationStation.stationName) {
        List<Station> stationsPath = path.map((e) => e.station).toList();
        int stationsCount = stationsPath.length - 1;
        int estimatesTime = ((stationsCount / 80 * 60) + (stationsCount)).ceil();
        int ticketPrice;
        switch (stationsCount) {
          case <= 9:
            ticketPrice = 8;
          case <= 16:
            ticketPrice = 10;
          case <= 23:
            ticketPrice = 15;
          default:
            ticketPrice = 20;
        }
        emit(LoadedState(stationsPath, estimatesTime,ticketPrice));
        return;
      }
      for (String station in currentNode.station.connectedStations.split('-')) {
        StationNode stationNode = stationNodes.firstWhere(
          (element) => element.station.stationName == station,
        );
        var newPath = path.toList();
        newPath.add(stationNode);
        paths.add(newPath);
      }
    }
  }
}
