import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../models/ssc_station_model.dart';
import '../../widgets/ssc_bus_info_cell.dart';
import '../controller/ssc_work_controller.dart';

class SSCWorkListTimePage extends StatefulWidget {
  const SSCWorkListTimePage({super.key});

  @override
  State<SSCWorkListTimePage> createState() => _SSCWorkListTimePageState();
}

class _SSCWorkListTimePageState extends State<SSCWorkListTimePage> {
  late SSCWorkController controller = SSCWorkController();

  @override
  void initState() {
    GetInstance().put(
      controller,
      tag: 'SSCWorkController',
    );

    controller.handleWorkTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSCWorkController>(
      init: controller,
      global: false,
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.workTimeModelList.length,
          itemBuilder: (context, index) {
            SSCStationModel model = controller.workTimeModelList[index];
            return GestureDetector(
              onTap: () {
                context.push('/timeDetail?number=${model.number}&work=1');
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
