class SSCStationDetailModel {
  late int number;
  late String timeLabel;
  late String station;

  SSCStationDetailModel.fromJson(Map<String, dynamic> json) {
    number = json['number'] ?? 0;
    timeLabel = json['timeLabel'] ?? '';
    station = json['station'] ?? '';
  }
}
