import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:oma_fillari/src/model/station.dart';

class StationApiProvider {
  Client http = Client();
  final _baseUrl =
      "https://api.digitransit.fi/routing/v1/routers/hsl/bike_rental";

  Future<List<Station>> fetchStations() async {
    final response = await http.get("$_baseUrl");

    if (response.statusCode == 200)
      return StationResponse.fromJson(json.decode(response.body)).results;
    else
      throw Exception("Failed to load stations");
  }
}
