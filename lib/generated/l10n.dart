// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter valid station`
  String get enterValidStation {
    return Intl.message(
      'Enter valid station',
      name: 'enterValidStation',
      desc: '',
      args: [],
    );
  }

  /// `Calculate Fare`
  String get calculateFare {
    return Intl.message(
      'Calculate Fare',
      name: 'calculateFare',
      desc: '',
      args: [],
    );
  }

  /// `Start Station Can't be the destination`
  String get sameStationError {
    return Intl.message(
      'Start Station Can\'t be the destination',
      name: 'sameStationError',
      desc: '',
      args: [],
    );
  }

  /// `From Station`
  String get fromStation {
    return Intl.message(
      'From Station',
      name: 'fromStation',
      desc: '',
      args: [],
    );
  }

  /// `Select starting station`
  String get selectStartStation {
    return Intl.message(
      'Select starting station',
      name: 'selectStartStation',
      desc: '',
      args: [],
    );
  }

  /// `To Station`
  String get toStation {
    return Intl.message('To Station', name: 'toStation', desc: '', args: []);
  }

  /// `Select destination station`
  String get selectDestinationStation {
    return Intl.message(
      'Select destination station',
      name: 'selectDestinationStation',
      desc: '',
      args: [],
    );
  }

  /// `Route Details`
  String get routeDetails {
    return Intl.message(
      'Route Details',
      name: 'routeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Total Stations`
  String get totalStations {
    return Intl.message(
      'Total Stations',
      name: 'totalStations',
      desc: '',
      args: [],
    );
  }

  /// `stations`
  String get stations {
    return Intl.message('stations', name: 'stations', desc: '', args: []);
  }

  /// `Estimated Time`
  String get estimatedTime {
    return Intl.message(
      'Estimated Time',
      name: 'estimatedTime',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message('minutes', name: 'minutes', desc: '', args: []);
  }

  /// `Ticket Price`
  String get ticketPrice {
    return Intl.message(
      'Ticket Price',
      name: 'ticketPrice',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Metro Scout`
  String get metroScout {
    return Intl.message('Metro Scout', name: 'metroScout', desc: '', args: []);
  }

  /// `Welcome to Metro Scout`
  String get welcomeMetroScout {
    return Intl.message(
      'Welcome to Metro Scout',
      name: 'welcomeMetroScout',
      desc: '',
      args: [],
    );
  }

  /// `Your smart companion of metro navigation in cairo`
  String get tagline {
    return Intl.message(
      'Your smart companion of metro navigation in cairo',
      name: 'tagline',
      desc: '',
      args: [],
    );
  }

  /// `Find Nearest Station`
  String get findNearestStation {
    return Intl.message(
      'Find Nearest Station',
      name: 'findNearestStation',
      desc: '',
      args: [],
    );
  }

  /// `Locate metro stations near you`
  String get locateStations {
    return Intl.message(
      'Locate metro stations near you',
      name: 'locateStations',
      desc: '',
      args: [],
    );
  }

  /// `Check ticket prices for your journey`
  String get checkFare {
    return Intl.message(
      'Check ticket prices for your journey',
      name: 'checkFare',
      desc: '',
      args: [],
    );
  }

  /// `Metro Map`
  String get metroMap {
    return Intl.message('Metro Map', name: 'metroMap', desc: '', args: []);
  }

  /// `Local`
  String get local {
    return Intl.message('Local', name: 'local', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Use current Location`
  String get useCurrentLocation {
    return Intl.message(
      'Use current Location',
      name: 'useCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Search by location`
  String get searchByLocation {
    return Intl.message(
      'Search by location',
      name: 'searchByLocation',
      desc: '',
      args: [],
    );
  }

  /// `Nearest Station`
  String get nearestStation {
    return Intl.message(
      'Nearest Station',
      name: 'nearestStation',
      desc: '',
      args: [],
    );
  }

  /// `Find the nearest station to where you are right now`
  String get findNearestCurrent {
    return Intl.message(
      'Find the nearest station to where you are right now',
      name: 'findNearestCurrent',
      desc: '',
      args: [],
    );
  }

  /// `Find the nearest station to a specific address or tap the map`
  String get searchSpecificLocation {
    return Intl.message(
      'Find the nearest station to a specific address or tap the map',
      name: 'searchSpecificLocation',
      desc: '',
      args: [],
    );
  }

  /// `Enter address or landmark`
  String get enterAddress {
    return Intl.message(
      'Enter address or landmark',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Search Location`
  String get searchLocation {
    return Intl.message(
      'Search Location',
      name: 'searchLocation',
      desc: '',
      args: [],
    );
  }

  /// `Station Name`
  String get stationName {
    return Intl.message(
      'Station Name',
      name: 'stationName',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message('Distance', name: 'distance', desc: '', args: []);
  }

  /// `km`
  String get km {
    return Intl.message('km', name: 'km', desc: '', args: []);
  }

  /// `Navigate`
  String get navigate {
    return Intl.message('Navigate', name: 'navigate', desc: '', args: []);
  }

  /// `View complete metro network`
  String get viewCompleteMetroNetwork {
    return Intl.message(
      'View complete metro network',
      name: 'viewCompleteMetroNetwork',
      desc: '',
      args: [],
    );
  }

  /// `No nearby metro stations found.`
  String get noStationsFound {
    return Intl.message(
      'No nearby metro stations found.',
      name: 'noStationsFound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
