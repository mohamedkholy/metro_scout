import 'package:drift/drift.dart';

class Stations extends Table {

  RealColumn get lat => real().unique()();

  RealColumn get lng => real().unique()();

  TextColumn get stationName => text()();

  TextColumn get connectedStations => text()();

  IntColumn get line => integer()();

  @override
  Set<Column> get primaryKey => {stationName};
}
