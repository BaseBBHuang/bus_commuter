import 'package:flutter/material.dart';

import '../../../common/UI/ssc_conmon_container.dart';
import '../models/ssc_station_detail_model.dart';

class SSCBusStationDetailCell extends StatelessWidget with SSCUIContainer {
  final bool isLast;
  final SSCStationDetailModel model;
  const SSCBusStationDetailCell({
    required this.isLast,
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cellContainerPage(
          isShadow: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time_rounded),
                  const SizedBox(width: 4),
                  Text(
                    '到站时间:${model.timeLabel}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.chair_rounded),
                  const SizedBox(width: 4),
                  Text(
                    '站台:${model.station}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isLast ? const SizedBox() : busGoArrow(),
      ],
    );
  }
}
