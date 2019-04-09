import 'package:flutter/material.dart';
import 'package:oma_fillari/src/bloc/station_bloc.dart';
import 'package:oma_fillari/src/model/station.dart';

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
    return StreamBuilder(
      stream: bloc.stations,
      builder: (context, AsyncSnapshot<List<Station>> snapshot) {
        if (snapshot.hasData)
          return buildList(snapshot.data);
        else if (snapshot.hasError)
          return Text(snapshot.error.toString());
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(List<Station> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(data[index].name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        );
      },
    );
  }
}
