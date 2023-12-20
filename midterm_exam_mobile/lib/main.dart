import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelompok 6',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeSplashScreen,
      routes: AppRoutes.routes,
    );
  }
}
