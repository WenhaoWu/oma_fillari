import 'package:flutter/material.dart';
import 'package:oma_fillari/src/model/station.dart';
import 'package:oma_fillari/src/resource/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;

class StationBlocProvider extends InheritedWidget {
  final StationBloc bloc;

  StationBlocProvider({Key key, Widget child})
      : bloc = StationBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static StationBloc of(BuildContext context) {
    InheritedWidget widget =
        context.inheritFromWidgetOfExactType(StationBlocProvider);

    StationBlocProvider provider = widget as StationBlocProvider;

    return provider.bloc;
  }
}

class StationBloc {
  final _repository = Repository();
  ReplaySubject<List<Station>> _stations;
  ReplaySubject<Position> _postion;

  Stream<List<Station>> get stations => _stations.stream;
  Stream<Position> get position => _postion.stream;

  init() {
    if (_stations == null) _stations = ReplaySubject<List<Station>>();
    if (_postion == null) _postion = ReplaySubject<Position>();
  }

  fetchStations() async {
    if (_stations.isClosed) return;

    List<Station> stations = await _repository.fetchAllStations();
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    stations.forEach((s) {
      double distance = absDistance(position, s);
      s.disatance = distance;
    });

    stations.sort((s1, s2) => s1.disatance.compareTo(s2.disatance));

    _stations.sink.add(stations.take(10).toList());
  }

  dispose() {
    _stations.close();
    _postion.close();
  }

  // https://stackoverflow.com/questions/27928/calculate-distance-between-two-latitude-longitude-points-haversine-formula
  double absDistance(Position position, Station station) {
    var lat1 = position.latitude, lat2 = station.y;
    var lon1 = position.longitude, lon2 = station.x;

    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(deg2rad(lat1)) *
            math.cos(deg2rad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d / 1000;
  }

  double deg2rad(deg) {
    return deg * (math.pi / 180);
  }
}
