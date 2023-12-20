// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';

class HomeSplashScreen extends StatefulWidget {
  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.homeIntroScreen);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              tileMode: TileMode.decal,
              colors: [
                Color.fromARGB(255, 141, 195, 253),
                Color.fromARGB(255, 255, 234, 151)
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 400,
              child: Image(image: AssetImage('assets/img/lup.png')),
            ),
          ),
        ),
      ),
    );
  }
}
