// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';

class HomeIntroScreen extends StatefulWidget {
  @override
  State<HomeIntroScreen> createState() => _HomeIntroScreenState();
}

class _HomeIntroScreenState extends State<HomeIntroScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 80, bottom: 30),
                child: AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText('Welcome to',
                      textStyle: TextStyle(
                          fontFamily: FontPicker.boldPoppins,
                          fontSize: 40,
                          color: const Color.fromARGB(255, 23, 95, 171)),
                      speed: Duration(milliseconds: 100))
                ]),
              ),
            ),
            Center(
              child: SizedBox(
                height: 300,
                child: Image(
                    image: AssetImage('assets/img/lup.png'),
                    fit: BoxFit.contain),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText("CRIP'S",
                      textStyle: TextStyle(
                          fontFamily: FontPicker.boldPoppins,
                          fontSize: 40,
                          color: const Color.fromARGB(255, 23, 95, 171)),
                      speed: Duration(milliseconds: 175))
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.5),
                    ),
                    primary: Color.fromARGB(255, 9, 53, 100),
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10)),
                child: Text(
                  "LET'S GO",
                  style: TextStyle(
                      fontFamily: FontPicker.mediumPoppins,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
