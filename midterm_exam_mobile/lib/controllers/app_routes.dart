import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/screens/dashboard_screen.dart';

class AppRoutes {
  static const String dashboardScreen = '/dashboard_screen';

  static Map<String, WidgetBuilder> routes = {
    dashboardScreen: (context) => DashboardScreen()
  };
}
