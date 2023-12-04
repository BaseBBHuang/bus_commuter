class SSCStationModel {
  late int number;
  late String timeLabel;
  late String startStation;
  late String endStation;

  SSCStationModel.fromJson(Map<String, dynamic> json) {
    number = json['number'] ?? 0;
    timeLabel = json['timeLabel'] ?? '';
    startStation = json['startStation'] ?? '';
    endStation = json['endStation'] ?? '';
  }
}
