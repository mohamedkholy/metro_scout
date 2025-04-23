import 'package:drift/drift.dart';

class Stations extends Table {
  RealColumn get lat => real().unique()();

  RealColumn get lng => real().unique()();

  TextColumn get arabicName => text()();

  TextColumn get englishName => text()();

  TextColumn get connectedStationsAr => text()();

  TextColumn get connectedStationsEn => text()();

  IntColumn get line => integer()();

  @override
  Set<Column> get primaryKey => {arabicName};
}
