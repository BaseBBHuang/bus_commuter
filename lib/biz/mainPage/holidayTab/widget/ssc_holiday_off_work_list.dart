import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../models/ssc_station_model.dart';
import '../../widgets/ssc_bus_info_cell.dart';
import '../controller/ssc_holiday_off_work_controller.dart';

class SSCHolidayOffWorkListTimePage extends StatefulWidget {
  const SSCHolidayOffWorkListTimePage({super.key});

  @override
  State<SSCHolidayOffWorkListTimePage> createState() =>
      _SSCWorkListTimePageState();
}

class _SSCWorkListTimePageState extends State<SSCHolidayOffWorkListTimePage> {
  late SSCHolidyaOffWorkController controller = SSCHolidyaOffWorkController();

  @override
  void initState() {
    GetInstance().put(
      controller,
      tag: 'SSCHolidayWorkController',
    );

    controller.handleHolidayOffWorkTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSCHolidyaOffWorkController>(
      init: controller,
      global: false,
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.holidayOffWorkTimeModelList.length,
          itemBuilder: (context, index) {
            SSCStationModel model =
                controller.holidayOffWorkTimeModelList[index];
            return GestureDetector(
              onTap: () {
                context.push(
                    '/timeDetail?number=${model.number}&work=0&holiday=1');
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
