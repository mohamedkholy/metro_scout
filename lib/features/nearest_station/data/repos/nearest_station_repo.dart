import 'package:flutter/cupertino.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/models/station_data.dart';

class NearestStationRepo {
  final MyDatabase _db;

  NearestStationRepo(this._db);

  Future<List<StationData>> getStations(language) async {
    return await _db
        .select(_db.stations)
        .map(
          (station) => StationData(
            lat: station.lat,
            lng: station.lng,
            name: language == 'ar' ? station.arabicName : station.englishName,
            connectedStations:
                language == 'ar'
                    ? station.connectedStationsAr
                    : station.connectedStationsEn,
            line: station.line,
          ),
        )
        .get();
  }
}
