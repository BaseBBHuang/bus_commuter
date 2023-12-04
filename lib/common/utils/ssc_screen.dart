import 'package:flutter/material.dart';

class ScreenUtil {
  ScreenUtil._();

  static double getPaddingTop(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double getPaddingBottom(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
