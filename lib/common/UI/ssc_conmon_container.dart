import 'package:flutter/material.dart';

mixin SSCUIContainer {
  Widget pageContainer({
    required List<Widget> children,
  }) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tab(
                    icon: Icon(
                      Icons.mood_bad,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '上班',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tab(
                    icon: Icon(
                      Icons.mood,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '下班',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          title: const Text('班车通勤表'),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }

  Widget cellContainerPage({
    required Widget child,
    bool isShadow = true,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: isShadow
            ? const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 0),
                  blurRadius: 16,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }

  Widget busGoArrow() {
    return const Padding(
      padding: EdgeInsets.only(left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.directions_bus_filled_outlined),
          Icon(Icons.keyboard_double_arrow_down_rounded),
          Icon(Icons.directions_bus_filled_outlined),
        ],
      ),
    );
  }
}
