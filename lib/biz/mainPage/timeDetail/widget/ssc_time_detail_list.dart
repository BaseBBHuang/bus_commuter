import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../models/ssc_station_detail_model.dart';
import '../../widgets/ssc_bus_station_detail_cell.dart';
import '../controller/ssc_time_detail_controller.dart';

class SSCBusTimeList extends StatefulWidget {
  final int number;
  final int work;
  final int holiday;

  const SSCBusTimeList({
    required this.number,
    required this.work,
    required this.holiday,
    super.key,
  });

  @override
  State<SSCBusTimeList> createState() => _SSCBusTimeListState();
}

class _SSCBusTimeListState extends State<SSCBusTimeList> {
  SSCTimeDetailController controller = SSCTimeDetailController();
  String tag = '';

  @override
  void initState() {
    tag =
        'SSCTimeDetailController_number_${widget.number}_${Random().nextInt(100)}';

    GetInstance().put(
      controller,
      tag: tag,
    );

    controller.handleTime(
      number: widget.number,
      work: widget.work,
      holiday: widget.holiday,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSCTimeDetailController>(
      init: controller,
      tag: tag,
      global: false,
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.detailTimeModelList.length,
          itemBuilder: (context, index) {
            SSCStationDetailModel model = controller.detailTimeModelList[index];
            return SSCBusStationDetailCell(
              model: model,
              isLast: (controller.detailTimeModelList.length - 1) == index,
            );
          },
        );
      },
    );
  }
}
