import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelompok 6',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.dashboardScreen,
      routes: AppRoutes.routes,
    );
  }
}
