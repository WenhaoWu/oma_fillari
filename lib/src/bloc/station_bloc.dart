import 'package:flutter/material.dart';
import 'package:oma_fillari/src/model/station.dart';
import 'package:oma_fillari/src/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

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
  final _stations = PublishSubject<List<Station>>();

  fetchStations() async {
    List<Station> stations = await _repository.fetchAllStations();
    _stations.sink.add(stations);
  }

  dispose() {
    _stations.close();
  }
}