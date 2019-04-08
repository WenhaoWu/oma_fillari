import 'package:oma_fillari/src/model/station.dart';
import 'package:oma_fillari/src/resource/station_api_provider.dart';

class Repository {
  final provider = StationApiProvider();

  Future<List<Station>> fetchAllStations() => provider.fetchStations();
}
