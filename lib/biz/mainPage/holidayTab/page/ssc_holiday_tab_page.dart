import 'package:flutter/material.dart';

import '../../../../common/UI/ssc_conmon_container.dart';
import '../widget/ssc_holiday_off_work_list.dart';
import '../widget/ssc_holiday_work_list.dart';

class SSCHolidayTabPage extends StatelessWidget with SSCUIContainer {
  const SSCHolidayTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageContainer(
      children: [
        const SSCHolidayWorkListTimePage(),
        const SSCHolidayOffWorkListTimePage(),
      ],
    );
  }
}
