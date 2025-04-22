import 'package:metro_scout/core/database/my_database.dart';

class StationNode{

  final Station station;
  bool isVisited;

  StationNode(this.station, [this.isVisited=false]);

}