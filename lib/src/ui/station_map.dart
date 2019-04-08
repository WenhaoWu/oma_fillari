import 'package:flutter/material.dart';

class StationMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StationMapState();
  }
}

class StationMapState extends State<StationMap> {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
