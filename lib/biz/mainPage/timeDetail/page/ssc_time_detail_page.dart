import 'package:flutter/material.dart';

import '../widget/ssc_time_detail_list.dart';

class SSCBusStationPage extends StatefulWidget {
  final int number;
  final int work; // 1 - 上班， 0 - 下班
  final int holiday; // 1 - 节假日，0 - 工作日
  const SSCBusStationPage({
    required this.number,
    required this.work,
    required this.holiday,
    super.key,
  });

  @override
  State<SSCBusStationPage> createState() => _SSCBusStationPageState();
}

class _SSCBusStationPageState extends State<SSCBusStationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('班车线:${widget.number}号'),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: SSCBusTimeList(
          number: widget.number,
          work: widget.work,
          holiday: widget.holiday,
        ),
      ),
    );
  }
}
