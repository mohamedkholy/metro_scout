import 'package:metro_scout/core/database/my_database.dart';

class NearestStationRepo{
  final MyDatabase _db;

  NearestStationRepo(this._db);

  Future<List<Station>> getStations() async{
    return await _db.select(_db.stations).get();
  }
}