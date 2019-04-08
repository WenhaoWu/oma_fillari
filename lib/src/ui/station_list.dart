import 'package:flutter/material.dart';
import 'package:oma_fillari/src/bloc/station_bloc.dart';

class StationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StationListState();
  }
}

class StationListState extends State<StationList> {
  StationBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = StationBlocProvider.of(context);
    bloc.fetchStations();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
