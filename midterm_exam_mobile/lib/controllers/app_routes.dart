import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/screens/dashboard_screen.dart';
import 'package:midterm_exam_mobile/screens/detail_screen.dart';

class AppRoutes {
  static const String dashboardScreen = '/dashboard_screen';
  static const String detailScreen = '/detail_screen';

  static Map<String, WidgetBuilder> routes = {
    dashboardScreen: (context) => DashboardScreen(),
    detailScreen: (context) => DetailScreen()
  };
}
