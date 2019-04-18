import 'package:flutter/material.dart';
import 'package:oma_fillari/src/bloc/station_bloc.dart';
import 'package:oma_fillari/src/ui/station_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Oma Fillarit"),
        ),
        body: SafeArea(
          child: StationBlocProvider(child: StationList()),
        ),
      ),
    );
  }
}
