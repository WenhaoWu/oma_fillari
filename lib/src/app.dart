import 'package:flutter/material.dart';
import 'package:oma_fillari/src/bloc/station_bloc.dart';
import 'package:oma_fillari/src/ui/station_list.dart';
import 'package:oma_fillari/src/ui/station_map.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    StationBlocProvider(child: StationList()),
    StationMap(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Oma Fillarit"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              title: Text("List"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("Map"),
              icon: Icon(Icons.home),
            ),
          ],
        ),
        body: SafeArea(child: _children[_currentIndex]),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
