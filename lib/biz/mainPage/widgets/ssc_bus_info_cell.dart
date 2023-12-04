import 'package:flutter/material.dart';
import 'package:flutter_rsc/common/UI/ssc_conmon_container.dart';

import '../models/ssc_station_model.dart';

class SSCBusInfoCell extends StatelessWidget with SSCUIContainer {
  final SSCStationModel model;

  const SSCBusInfoCell({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return cellContainerPage(
      child: Row(
        children: [
          _numberWidget(context),
          Expanded(
            child: _cellContentWidget(),
          ),
          const Icon(
            Icons.chevron_right,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget _numberWidget(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${model.number}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _cellContentWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Column(
        children: [
          _cellTopContent(),
          const SizedBox(height: 20),
          _cellBtmComtent(),
        ],
      ),
    );
  }

  Widget _cellTopContent() {
    return Row(
      children: [
        Expanded(
          child: _stationLogo(isStart: true),
        ),
        Expanded(
          child: _startTime(),
        ),
        Expanded(
          child: _stationLogo(isStart: false),
        ),
      ],
    );
  }

  Widget _cellBtmComtent() {
    return Row(
      children: [
        Expanded(
          child: _stationText(text: model.startStation),
        ),
        Expanded(
          child: _arrowWidget(),
        ),
        Expanded(
          child: _stationText(text: model.endStation),
        ),
      ],
    );
  }

  Widget _stationLogo({
    required bool isStart,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isStart
              ? Icons.directions_bus_rounded
              : Icons.directions_bus_outlined,
        ),
        Text(isStart ? '起始站' : '终点站'),
      ],
    );
  }

  Widget _startTime() {
    return Text(
      '发车${model.timeLabel}',
      textAlign: TextAlign.center,
    );
  }

  Widget _stationText({
    required String text,
  }) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _arrowWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.keyboard_double_arrow_right_rounded,
        ),
        Icon(
          Icons.keyboard_double_arrow_right_rounded,
        ),
      ],
    );
  }
}
