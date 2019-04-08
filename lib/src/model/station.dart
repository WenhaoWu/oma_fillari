class StationResponse {
  List<Station> results = [];

  StationResponse.fromJson(Map<String, dynamic> parsedJson) {
    List<Station> temp = [];
    for (int i = 0; i < parsedJson['stations'].length; i++) {
      Station result = Station.fromJson(parsedJson['stations'][i]);
      temp.add(result);
    }
    results = temp;
  }
}

class Station {
  String id;
  String name;
  double x;
  double y;
  int bikesAvailable;
  int spacesAvailable;
  bool allowDropoff;
  bool isFloatingBike;
  bool isCarStation;
  String state;
  List<String> networks;
  bool realTimeData;

  Station(
      {this.id,
      this.name,
      this.x,
      this.y,
      this.bikesAvailable,
      this.spacesAvailable,
      this.allowDropoff,
      this.isFloatingBike,
      this.isCarStation,
      this.state,
      this.networks,
      this.realTimeData});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    x = json['x'];
    y = json['y'];
    bikesAvailable = json['bikesAvailable'];
    spacesAvailable = json['spacesAvailable'];
    allowDropoff = json['allowDropoff'];
    isFloatingBike = json['isFloatingBike'];
    isCarStation = json['isCarStation'];
    state = json['state'];
    networks = json['networks'].cast<String>();
    realTimeData = json['realTimeData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['x'] = this.x;
    data['y'] = this.y;
    data['bikesAvailable'] = this.bikesAvailable;
    data['spacesAvailable'] = this.spacesAvailable;
    data['allowDropoff'] = this.allowDropoff;
    data['isFloatingBike'] = this.isFloatingBike;
    data['isCarStation'] = this.isCarStation;
    data['state'] = this.state;
    data['networks'] = this.networks;
    data['realTimeData'] = this.realTimeData;
    return data;
  }
}
