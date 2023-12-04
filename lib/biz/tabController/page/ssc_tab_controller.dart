import 'package:flutter/material.dart';

import '../../mainPage/holidayTab/page/ssc_holiday_tab_page.dart';
import '../../mainPage/workTab/page/ssc_work_tab_page.dart';
import '../observer/tab_conter.dart';
import '../widget/ssc_lazy_indexed_stack.dart';

class SSCTabbarController extends StatefulWidget {
  final VoidCallback? logoutCallback;

  const SSCTabbarController({
    this.logoutCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<SSCTabbarController> createState() => _SSCTabbarControllerState();
}

class _SSCTabbarControllerState extends State<SSCTabbarController> {
  final TabCounter _counter = TabCounter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _counter.currentPageIndex,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        onTap: (int index) {
          if (mounted) {
            setState(
              () {
                _counter.updateCounter(currPageIndex: index);
              },
            );
          }
        },
        items: _buildBarItem(),
      ),
      body: SSCLazyIndexedStack(
        index: _counter.currentPageIndex,
        children: _buildControllers(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBarItem() {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.alarm),
        label: '工作日',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.add_alarm),
        label: '节假日',
      ),
    ];
  }

  List<Widget> _buildControllers() {
    return <Widget>[
      const SSCWorkTabPage(),
      const SSCHolidayTabPage(),
    ];
  }
}
