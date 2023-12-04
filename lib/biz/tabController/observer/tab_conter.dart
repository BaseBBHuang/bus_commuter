import 'package:flutter/material.dart';

class TabCounter extends ChangeNotifier {
  int currentPageIndex = 0;

  updateCounter({required int currPageIndex}) {
    currentPageIndex = currPageIndex;
    notifyListeners();
  }
}
