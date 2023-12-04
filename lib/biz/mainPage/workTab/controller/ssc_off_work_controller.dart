import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/ssc_station_model.dart';

class SSCOffWorkController extends GetxController {
  List<SSCStationModel> workTimeModelList = [];

  void handleOffWorkTime() async {
    var jsonText = await rootBundle.loadString(
      'assets/json/off_work_time.json',
    );

    var data = json.decode(jsonText);
    int? code = data['code'];
    if (code == 200) {
      List workTimeList = data['data'] ?? [];
      if (workTimeList.isNotEmpty) {
        workTimeModelList.clear();

        workTimeModelList.addAll(
          workTimeList.map(
            (json) {
              SSCStationModel model = SSCStationModel.fromJson(json);

              return model;
            },
          ),
        );

        update();
      }
    }
  }
}
