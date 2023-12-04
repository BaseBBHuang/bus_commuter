import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../models/ssc_station_model.dart';
import '../../widgets/ssc_bus_info_cell.dart';
import '../controller/ssc_holiday_work_controller.dart';

class SSCHolidayWorkListTimePage extends StatefulWidget {
  const SSCHolidayWorkListTimePage({super.key});

  @override
  State<SSCHolidayWorkListTimePage> createState() =>
      _SSCWorkListTimePageState();
}

class _SSCWorkListTimePageState extends State<SSCHolidayWorkListTimePage> {
  late SSCHolidayWorkController controller = SSCHolidayWorkController();

  @override
  void initState() {
    GetInstance().put(
      controller,
      tag: 'SSCHolidayWorkController',
    );

    controller.handleHolidayWorkTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSCHolidayWorkController>(
      init: controller,
      global: false,
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.holidayWorkTimeModelList.length,
          itemBuilder: (context, index) {
            SSCStationModel model = controller.holidayWorkTimeModelList[index];
            return GestureDetector(
              onTap: () {
                context.push(
                    '/timeDetail?number=${model.number}&work=1&holiday=1');
              },
              child: SSCBusInfoCell(
                model: model,
              ),
            );
          },
        );
      },
    );
  }
}
