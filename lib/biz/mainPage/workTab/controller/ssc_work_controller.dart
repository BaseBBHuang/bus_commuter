import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/ssc_station_model.dart';

class SSCWorkController extends GetxController {
  List<SSCStationModel> workTimeModelList = [];

  void handleWorkTime() async {
    var jsonText = await rootBundle.loadString(
      'assets/json/work_time.json',
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
