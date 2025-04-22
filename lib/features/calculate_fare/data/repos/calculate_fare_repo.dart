import 'package:metro_scout/core/database/my_database.dart';

class CalculateFareRepo{
  final MyDatabase _db;

  CalculateFareRepo(this._db);

  Future<List<Station>> getStations() async{
    return await _db.select(_db.stations).get();
  }


}