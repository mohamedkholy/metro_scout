class StationData{
  final double lat;
  final double lng;
  final String name;
  final String connectedStations;
  final int line;
  const StationData({
    required this.lat,
    required this.lng,
    required this.name,
    required this.connectedStations,
    required this.line,
  });
}