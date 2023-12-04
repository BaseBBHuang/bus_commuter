import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/ssc_station_detail_model.dart';

class SSCTimeDetailController extends GetxController {
  List<SSCStationDetailModel> detailTimeModelList = [];

  void handleTime({
    required int number,
    required int work,
    required int holiday,
  }) async {
    String jsonStr = 'assets/json/bus_${number}_work_station.json';

    /// 工作日 - 下班
    if (work == 0 && holiday == 0) {
      jsonStr = 'assets/json/bus_${number}_off_work_station.json';
    } else if (work == 1 && holiday == 0) {
      /// 工作日 - 上班
      jsonStr = 'assets/json/bus_${number}_work_station.json';
    } else if (work == 0 && holiday == 1) {
      /// 节假日 - 下班
      jsonStr = 'assets/json/bus_${number}_holiday_off_work_station.json';
    } else if (work == 1 && holiday == 1) {
      /// 节假日 - 上班
      jsonStr = 'assets/json/bus_${number}_holiday_work_station.json';
    }
    debugPrint('jsonStr:$jsonStr');

    var jsonText = await rootBundle.loadString(
      jsonStr,
    );

    var data = json.decode(jsonText);
    int? code = data['code'];
    if (code == 200) {
      List workTimeList = data['data'] ?? [];
      if (workTimeList.isNotEmpty) {
        detailTimeModelList.clear();

        detailTimeModelList.addAll(
          workTimeList.map(
            (json) {
              SSCStationDetailModel model =
                  SSCStationDetailModel.fromJson(json);

              return model;
            },
          ),
        );

        update();
      }
    }
  }
}
