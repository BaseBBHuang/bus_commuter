import 'package:flutter/material.dart';

import '../../../../common/UI/ssc_conmon_container.dart';
import '../widget/ssc_off_work_list.dart';
import '../widget/ssc_work_list.dart';

class SSCWorkTabPage extends StatelessWidget with SSCUIContainer {
  const SSCWorkTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageContainer(
      children: [
        const SSCWorkListTimePage(),
        const SSCOffWorkListTimePage(),
      ],
    );
  }
}
