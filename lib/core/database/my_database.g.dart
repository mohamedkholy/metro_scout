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
  static const VerificationMeta _arabicNameMeta = const VerificationMeta(
    'arabicName',
  );
  @override
  late final GeneratedColumn<String> arabicName = GeneratedColumn<String>(
    'arabic_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishNameMeta = const VerificationMeta(
    'englishName',
  );
  @override
  late final GeneratedColumn<String> englishName = GeneratedColumn<String>(
    'english_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _connectedStationsArMeta =
      const VerificationMeta('connectedStationsAr');
  @override
  late final GeneratedColumn<String> connectedStationsAr =
      GeneratedColumn<String>(
        'connected_stations_ar',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _connectedStationsEnMeta =
      const VerificationMeta('connectedStationsEn');
  @override
  late final GeneratedColumn<String> connectedStationsEn =
      GeneratedColumn<String>(
        'connected_stations_en',
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
    arabicName,
    englishName,
    connectedStationsAr,
    connectedStationsEn,
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
    if (data.containsKey('arabic_name')) {
      context.handle(
        _arabicNameMeta,
        arabicName.isAcceptableOrUnknown(data['arabic_name']!, _arabicNameMeta),
      );
    } else if (isInserting) {
      context.missing(_arabicNameMeta);
    }
    if (data.containsKey('english_name')) {
      context.handle(
        _englishNameMeta,
        englishName.isAcceptableOrUnknown(
          data['english_name']!,
          _englishNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishNameMeta);
    }
    if (data.containsKey('connected_stations_ar')) {
      context.handle(
        _connectedStationsArMeta,
        connectedStationsAr.isAcceptableOrUnknown(
          data['connected_stations_ar']!,
          _connectedStationsArMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_connectedStationsArMeta);
    }
    if (data.containsKey('connected_stations_en')) {
      context.handle(
        _connectedStationsEnMeta,
        connectedStationsEn.isAcceptableOrUnknown(
          data['connected_stations_en']!,
          _connectedStationsEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_connectedStationsEnMeta);
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
  Set<GeneratedColumn> get $primaryKey => {arabicName};
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
      arabicName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}arabic_name'],
          )!,
      englishName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}english_name'],
          )!,
      connectedStationsAr:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}connected_stations_ar'],
          )!,
      connectedStationsEn:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}connected_stations_en'],
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
  final String arabicName;
  final String englishName;
  final String connectedStationsAr;
  final String connectedStationsEn;
  final int line;
  const Station({
    required this.lat,
    required this.lng,
    required this.arabicName,
    required this.englishName,
    required this.connectedStationsAr,
    required this.connectedStationsEn,
    required this.line,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['arabic_name'] = Variable<String>(arabicName);
    map['english_name'] = Variable<String>(englishName);
    map['connected_stations_ar'] = Variable<String>(connectedStationsAr);
    map['connected_stations_en'] = Variable<String>(connectedStationsEn);
    map['line'] = Variable<int>(line);
    return map;
  }

  StationsCompanion toCompanion(bool nullToAbsent) {
    return StationsCompanion(
      lat: Value(lat),
      lng: Value(lng),
      arabicName: Value(arabicName),
      englishName: Value(englishName),
      connectedStationsAr: Value(connectedStationsAr),
      connectedStationsEn: Value(connectedStationsEn),
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
      arabicName: serializer.fromJson<String>(json['arabicName']),
      englishName: serializer.fromJson<String>(json['englishName']),
      connectedStationsAr: serializer.fromJson<String>(
        json['connectedStationsAr'],
      ),
      connectedStationsEn: serializer.fromJson<String>(
        json['connectedStationsEn'],
      ),
      line: serializer.fromJson<int>(json['line']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'arabicName': serializer.toJson<String>(arabicName),
      'englishName': serializer.toJson<String>(englishName),
      'connectedStationsAr': serializer.toJson<String>(connectedStationsAr),
      'connectedStationsEn': serializer.toJson<String>(connectedStationsEn),
      'line': serializer.toJson<int>(line),
    };
  }

  Station copyWith({
    double? lat,
    double? lng,
    String? arabicName,
    String? englishName,
    String? connectedStationsAr,
    String? connectedStationsEn,
    int? line,
  }) => Station(
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    arabicName: arabicName ?? this.arabicName,
    englishName: englishName ?? this.englishName,
    connectedStationsAr: connectedStationsAr ?? this.connectedStationsAr,
    connectedStationsEn: connectedStationsEn ?? this.connectedStationsEn,
    line: line ?? this.line,
  );
  Station copyWithCompanion(StationsCompanion data) {
    return Station(
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      arabicName:
          data.arabicName.present ? data.arabicName.value : this.arabicName,
      englishName:
          data.englishName.present ? data.englishName.value : this.englishName,
      connectedStationsAr:
          data.connectedStationsAr.present
              ? data.connectedStationsAr.value
              : this.connectedStationsAr,
      connectedStationsEn:
          data.connectedStationsEn.present
              ? data.connectedStationsEn.value
              : this.connectedStationsEn,
      line: data.line.present ? data.line.value : this.line,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Station(')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('arabicName: $arabicName, ')
          ..write('englishName: $englishName, ')
          ..write('connectedStationsAr: $connectedStationsAr, ')
          ..write('connectedStationsEn: $connectedStationsEn, ')
          ..write('line: $line')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lat,
    lng,
    arabicName,
    englishName,
    connectedStationsAr,
    connectedStationsEn,
    line,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Station &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.arabicName == this.arabicName &&
          other.englishName == this.englishName &&
          other.connectedStationsAr == this.connectedStationsAr &&
          other.connectedStationsEn == this.connectedStationsEn &&
          other.line == this.line);
}

class StationsCompanion extends UpdateCompanion<Station> {
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> arabicName;
  final Value<String> englishName;
  final Value<String> connectedStationsAr;
  final Value<String> connectedStationsEn;
  final Value<int> line;
  final Value<int> rowid;
  const StationsCompanion({
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.arabicName = const Value.absent(),
    this.englishName = const Value.absent(),
    this.connectedStationsAr = const Value.absent(),
    this.connectedStationsEn = const Value.absent(),
    this.line = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StationsCompanion.insert({
    required double lat,
    required double lng,
    required String arabicName,
    required String englishName,
    required String connectedStationsAr,
    required String connectedStationsEn,
    required int line,
    this.rowid = const Value.absent(),
  }) : lat = Value(lat),
       lng = Value(lng),
       arabicName = Value(arabicName),
       englishName = Value(englishName),
       connectedStationsAr = Value(connectedStationsAr),
       connectedStationsEn = Value(connectedStationsEn),
       line = Value(line);
  static Insertable<Station> custom({
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? arabicName,
    Expression<String>? englishName,
    Expression<String>? connectedStationsAr,
    Expression<String>? connectedStationsEn,
    Expression<int>? line,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (arabicName != null) 'arabic_name': arabicName,
      if (englishName != null) 'english_name': englishName,
      if (connectedStationsAr != null)
        'connected_stations_ar': connectedStationsAr,
      if (connectedStationsEn != null)
        'connected_stations_en': connectedStationsEn,
      if (line != null) 'line': line,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StationsCompanion copyWith({
    Value<double>? lat,
    Value<double>? lng,
    Value<String>? arabicName,
    Value<String>? englishName,
    Value<String>? connectedStationsAr,
    Value<String>? connectedStationsEn,
    Value<int>? line,
    Value<int>? rowid,
  }) {
    return StationsCompanion(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      arabicName: arabicName ?? this.arabicName,
      englishName: englishName ?? this.englishName,
      connectedStationsAr: connectedStationsAr ?? this.connectedStationsAr,
      connectedStationsEn: connectedStationsEn ?? this.connectedStationsEn,
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
    if (arabicName.present) {
      map['arabic_name'] = Variable<String>(arabicName.value);
    }
    if (englishName.present) {
      map['english_name'] = Variable<String>(englishName.value);
    }
    if (connectedStationsAr.present) {
      map['connected_stations_ar'] = Variable<String>(
        connectedStationsAr.value,
      );
    }
    if (connectedStationsEn.present) {
      map['connected_stations_en'] = Variable<String>(
        connectedStationsEn.value,
      );
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
          ..write('arabicName: $arabicName, ')
          ..write('englishName: $englishName, ')
          ..write('connectedStationsAr: $connectedStationsAr, ')
          ..write('connectedStationsEn: $connectedStationsEn, ')
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
      required String arabicName,
      required String englishName,
      required String connectedStationsAr,
      required String connectedStationsEn,
      required int line,
      Value<int> rowid,
    });
typedef $$StationsTableUpdateCompanionBuilder =
    StationsCompanion Function({
      Value<double> lat,
      Value<double> lng,
      Value<String> arabicName,
      Value<String> englishName,
      Value<String> connectedStationsAr,
      Value<String> connectedStationsEn,
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

  ColumnFilters<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get connectedStationsAr => $composableBuilder(
    column: $table.connectedStationsAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get connectedStationsEn => $composableBuilder(
    column: $table.connectedStationsEn,
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

  ColumnOrderings<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get connectedStationsAr => $composableBuilder(
    column: $table.connectedStationsAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get connectedStationsEn => $composableBuilder(
    column: $table.connectedStationsEn,
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

  GeneratedColumn<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get connectedStationsAr => $composableBuilder(
    column: $table.connectedStationsAr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get connectedStationsEn => $composableBuilder(
    column: $table.connectedStationsEn,
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
                Value<String> arabicName = const Value.absent(),
                Value<String> englishName = const Value.absent(),
                Value<String> connectedStationsAr = const Value.absent(),
                Value<String> connectedStationsEn = const Value.absent(),
                Value<int> line = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StationsCompanion(
                lat: lat,
                lng: lng,
                arabicName: arabicName,
                englishName: englishName,
                connectedStationsAr: connectedStationsAr,
                connectedStationsEn: connectedStationsEn,
                line: line,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required double lat,
                required double lng,
                required String arabicName,
                required String englishName,
                required String connectedStationsAr,
                required String connectedStationsEn,
                required int line,
                Value<int> rowid = const Value.absent(),
              }) => StationsCompanion.insert(
                lat: lat,
                lng: lng,
                arabicName: arabicName,
                englishName: englishName,
                connectedStationsAr: connectedStationsAr,
                connectedStationsEn: connectedStationsEn,
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
