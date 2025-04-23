import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/models/station_data.dart';

class StationNode{

  final StationData station;
  bool isVisited;

  StationNode(this.station, [this.isVisited=false]);

}