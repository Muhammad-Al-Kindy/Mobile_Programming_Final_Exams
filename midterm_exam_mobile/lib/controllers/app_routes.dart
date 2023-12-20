import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/screens/dashboard_screen.dart';
import 'package:midterm_exam_mobile/screens/detail_screen.dart';
import 'package:midterm_exam_mobile/screens/add_data_screen.dart';
import 'package:midterm_exam_mobile/splash/home_splash.dart';
import 'package:midterm_exam_mobile/splash/home_intro.dart';
import 'package:midterm_exam_mobile/login_register/login.dart';
import 'package:midterm_exam_mobile/login_register/register_screen.dart';
import 'package:midterm_exam_mobile/login_register/register_screen_done.dart';
import 'package:midterm_exam_mobile/screens/main_home.dart';
import 'package:midterm_exam_mobile/screens/lap_kekerasan.dart';
import 'package:midterm_exam_mobile/screens/dashboard_screen_akademik.dart';
import 'package:midterm_exam_mobile/screens/user_screen.dart';
import 'package:midterm_exam_mobile/screens/user_screen_edit.dart';

class AppRoutes {
  static const String dashboardScreen = '/dashboard_screen';
  static const String detailScreen = '/detail_screen';
  static const String addDataScreen = '/add_data_screen';
  static const String homeSplashScreen = '/home_splash';
  static const String homeSplashScreen2 = '/home_splash2';
  static const String homeIntroScreen = '/home_intro';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register_screen';
  static const String registerScreenDone = '/register_screen_done';
  static const String mainHomeScreen = '/main_home';
  static const String lapKekerasan = '/lap_kekerasan';
  static const String dashboardScreenAkademik = '/dashboard_screen_akademik';
  static const String userScreen = '/user_screen';
  static const String userScreenEdit = '/user_screen_edit';

  static Map<String, WidgetBuilder> routes = {
    dashboardScreen: (context) => DashboardScreen(),
    detailScreen: (context) => DetailScreen(),
    addDataScreen: (context) => AddDataScreen(),
    homeSplashScreen: (context) => HomeSplashScreen(),
    homeIntroScreen: (context) => HomeIntroScreen(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    registerScreenDone: (context) => RegisterScreenDone(),
    mainHomeScreen: (context) => MainHomeScreen(),
    lapKekerasan: (context) => LapKekerasan(),
    dashboardScreenAkademik: (context) => DashboardScreenAkademik(),
    userScreen: (context) => UserScreen(),
    userScreenEdit: (context) => UserScreenEdit(),
  };
}
