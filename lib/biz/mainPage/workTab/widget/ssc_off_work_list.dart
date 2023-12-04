import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../models/ssc_station_model.dart';
import '../../widgets/ssc_bus_info_cell.dart';
import '../controller/ssc_off_work_controller.dart';

class SSCOffWorkListTimePage extends StatefulWidget {
  const SSCOffWorkListTimePage({super.key});

  @override
  State<SSCOffWorkListTimePage> createState() => _SSCWorkListTimePageState();
}

class _SSCWorkListTimePageState extends State<SSCOffWorkListTimePage> {
  late SSCOffWorkController controller = SSCOffWorkController();

  @override
  void initState() {
    GetInstance().put(
      controller,
      tag: 'SSCWorkController',
    );

    controller.handleOffWorkTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSCOffWorkController>(
      init: controller,
      global: false,
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.workTimeModelList.length,
          itemBuilder: (context, index) {
            SSCStationModel model = controller.workTimeModelList[index];
            return GestureDetector(
              onTap: () {
                context.push('/timeDetail?number=${model.number}&work=0');
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
