import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../biz/mainPage/timeDetail/page/ssc_time_detail_page.dart';
import '../biz/tabController/page/ssc_tab_controller.dart';

class SSCRouter {
  static final SSCRouter _instance = SSCRouter._internal();
  late GoRouter goRouter;

  SSCRouter._internal() {
    goRouter = GoRouter(
      initialLocation: '/index',
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          name: 'index',
          path: '/index',
          builder: (BuildContext context, GoRouterState state) {
            return const SSCTabbarController();
          },
        ),
        GoRoute(
          name: 'timeDetail',
          path: '/timeDetail',
          builder: (BuildContext context, GoRouterState state) {
            Uri uri = state.uri;
            final pathParameters = uri.queryParameters;
            String number = pathParameters['number'] ?? '0';
            String work = pathParameters['work'] ?? '-1';
            String holiday = pathParameters['holiday'] ?? '0';
            debugPrint('pathParameters:$pathParameters');
            return work == '-1'
                ? const SizedBox()
                : SSCBusStationPage(
                    number: int.parse(number),
                    work: int.parse(work),
                    holiday: int.parse(holiday),
                  );
          },
        ),
      ],
    );
  }

  factory SSCRouter() {
    return _instance;
  }
}
