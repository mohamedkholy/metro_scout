// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $StationsTable extends Stations with TableInfo<$StationsTable, Station> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _stationNameMeta = const VerificationMeta(
    'stationName',
  );
  @override
  late final GeneratedColumn<String> stationName = GeneratedColumn<String>(
    'station_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _connectedStationsMeta = const VerificationMeta(
    'connectedStations',
  );
  @override
  late final GeneratedColumn<String> connectedStations =
      GeneratedColumn<String>(
        'connected_stations',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
    'line',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lat,
    lng,
    stationName,
    connectedStations,
    line,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Station> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('station_name')) {
      context.handle(
        _stationNameMeta,
        stationName.isAcceptableOrUnknown(
          data['station_name']!,
          _stationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stationNameMeta);
    }
    if (data.containsKey('connected_stations')) {
      context.handle(
        _connectedStationsMeta,
        connectedStations.isAcceptableOrUnknown(
          data['connected_stations']!,
          _connectedStationsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_connectedStationsMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
        _lineMeta,
        line.isAcceptableOrUnknown(data['line']!, _lineMeta),
      );
    } else if (isInserting) {
      context.missing(_lineMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stationName};
  @override
  Station map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Station(
      lat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}lat'],
          )!,
      lng:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}lng'],
          )!,
      stationName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}station_name'],
          )!,
      connectedStations:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}connected_stations'],
          )!,
      line:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}line'],
          )!,
    );
  }

  @override
  $StationsTable createAlias(String alias) {
    return $StationsTable(attachedDatabase, alias);
  }
}

class Station extends DataClass implements Insertable<Station> {
  final double lat;
  final double lng;
  final String stationName;
  final String connectedStations;
  final int line;
  const Station({
    required this.lat,
    required this.lng,
    required this.stationName,
    required this.connectedStations,
    required this.line,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['station_name'] = Variable<String>(stationName);
    map['connected_stations'] = Variable<String>(connectedStations);
    map['line'] = Variable<int>(line);
    return map;
  }

  StationsCompanion toCompanion(bool nullToAbsent) {
    return StationsCompanion(
      lat: Value(lat),
      lng: Value(lng),
      stationName: Value(stationName),
      connectedStations: Value(connectedStations),
      line: Value(line),
    );
  }

  factory Station.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Station(
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      stationName: serializer.fromJson<String>(json['stationName']),
      connectedStations: serializer.fromJson<String>(json['connectedStations']),
      line: serializer.fromJson<int>(json['line']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'stationName': serializer.toJson<String>(stationName),
      'connectedStations': serializer.toJson<String>(connectedStations),
      'line': serializer.toJson<int>(line),
    };
  }

  Station copyWith({
    double? lat,
    double? lng,
    String? stationName,
    String? connectedStations,
    int? line,
  }) => Station(
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    stationName: stationName ?? this.stationName,
    connectedStations: connectedStations ?? this.connectedStations,
    line: line ?? this.line,
  );
  Station copyWithCompanion(StationsCompanion data) {
    return Station(
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      stationName:
          data.stationName.present ? data.stationName.value : this.stationName,
      connectedStations:
          data.connectedStations.present
              ? data.connectedStations.value
              : this.connectedStations,
      line: data.line.present ? data.line.value : this.line,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Station(')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('stationName: $stationName, ')
          ..write('connectedStations: $connectedStations, ')
          ..write('line: $line')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lat, lng, stationName, connectedStations, line);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Station &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.stationName == this.stationName &&
          other.connectedStations == this.connectedStations &&
          other.line == this.line);
}

class StationsCompanion extends UpdateCompanion<Station> {
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> stationName;
  final Value<String> connectedStations;
  final Value<int> line;
  final Value<int> rowid;
  const StationsCompanion({
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.stationName = const Value.absent(),
    this.connectedStations = const Value.absent(),
    this.line = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StationsCompanion.insert({
    required double lat,
    required double lng,
    required String stationName,
    required String connectedStations,
    required int line,
    this.rowid = const Value.absent(),
  }) : lat = Value(lat),
       lng = Value(lng),
       stationName = Value(stationName),
       connectedStations = Value(connectedStations),
       line = Value(line);
  static Insertable<Station> custom({
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? stationName,
    Expression<String>? connectedStations,
    Expression<int>? line,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (stationName != null) 'station_name': stationName,
      if (connectedStations != null) 'connected_stations': connectedStations,
      if (line != null) 'line': line,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StationsCompanion copyWith({
    Value<double>? lat,
    Value<double>? lng,
    Value<String>? stationName,
    Value<String>? connectedStations,
    Value<int>? line,
    Value<int>? rowid,
  }) {
    return StationsCompanion(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      stationName: stationName ?? this.stationName,
      connectedStations: connectedStations ?? this.connectedStations,
      line: line ?? this.line,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (stationName.present) {
      map['station_name'] = Variable<String>(stationName.value);
    }
    if (connectedStations.present) {
      map['connected_stations'] = Variable<String>(connectedStations.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StationsCompanion(')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('stationName: $stationName, ')
          ..write('connectedStations: $connectedStations, ')
          ..write('line: $line, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $StationsTable stations = $StationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stations];
}

typedef $$StationsTableCreateCompanionBuilder =
    StationsCompanion Function({
      required double lat,
      required double lng,
      required String stationName,
      required String connectedStations,
      required int line,
      Value<int> rowid,
    });
typedef $$StationsTableUpdateCompanionBuilder =
    StationsCompanion Function({
      Value<double> lat,
      Value<double> lng,
      Value<String> stationName,
      Value<String> connectedStations,
      Value<int> line,
      Value<int> rowid,
    });

class $$StationsTableFilterComposer
    extends Composer<_$MyDatabase, $StationsTable> {
  $$StationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stationName => $composableBuilder(
    column: $table.stationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get connectedStations => $composableBuilder(
    column: $table.connectedStations,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get line => $composableBuilder(
    column: $table.line,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StationsTableOrderingComposer
    extends Composer<_$MyDatabase, $StationsTable> {
  $$StationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stationName => $composableBuilder(
    column: $table.stationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get connectedStations => $composableBuilder(
    column: $table.connectedStations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get line => $composableBuilder(
    column: $table.line,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StationsTableAnnotationComposer
    extends Composer<_$MyDatabase, $StationsTable> {
  $$StationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get stationName => $composableBuilder(
    column: $table.stationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get connectedStations => $composableBuilder(
    column: $table.connectedStations,
    builder: (column) => column,
  );

  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);
}

class $$StationsTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $StationsTable,
          Station,
          $$StationsTableFilterComposer,
          $$StationsTableOrderingComposer,
          $$StationsTableAnnotationComposer,
          $$StationsTableCreateCompanionBuilder,
          $$StationsTableUpdateCompanionBuilder,
          (Station, BaseReferences<_$MyDatabase, $StationsTable, Station>),
          Station,
          PrefetchHooks Function()
        > {
  $$StationsTableTableManager(_$MyDatabase db, $StationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$StationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$StationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$StationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<String> stationName = const Value.absent(),
                Value<String> connectedStations = const Value.absent(),
                Value<int> line = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StationsCompanion(
                lat: lat,
                lng: lng,
                stationName: stationName,
                connectedStations: connectedStations,
                line: line,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required double lat,
                required double lng,
                required String stationName,
                required String connectedStations,
                required int line,
                Value<int> rowid = const Value.absent(),
              }) => StationsCompanion.insert(
                lat: lat,
                lng: lng,
                stationName: stationName,
                connectedStations: connectedStations,
                line: line,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StationsTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $StationsTable,
      Station,
      $$StationsTableFilterComposer,
      $$StationsTableOrderingComposer,
      $$StationsTableAnnotationComposer,
      $$StationsTableCreateCompanionBuilder,
      $$StationsTableUpdateCompanionBuilder,
      (Station, BaseReferences<_$MyDatabase, $StationsTable, Station>),
      Station,
      PrefetchHooks Function()
    >;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$StationsTableTableManager get stations =>
      $$StationsTableTableManager(_db, _db.stations);
}
