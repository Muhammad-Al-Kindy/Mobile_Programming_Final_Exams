// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';

class RegisterScreenDone extends StatefulWidget {
  @override
  State<RegisterScreenDone> createState() => _RegisterScreenDoneState();
}

class _RegisterScreenDoneState extends State<RegisterScreenDone> {
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
                margin: EdgeInsets.only(top: 130),
                child: Text(
                  "Yeay, It’s Done.",
                  style: TextStyle(
                      fontFamily: FontPicker.boldPoppins,
                      fontSize: 25,
                      color: const Color.fromARGB(255, 23, 95, 171)),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Thank You For Joining Us!",
                  style: TextStyle(
                      fontFamily: FontPicker.boldPoppins,
                      fontSize: 25,
                      color: const Color.fromARGB(255, 23, 95, 171)),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 300,
                child: Image(
                    image: AssetImage('assets/img/jumpGirl.png'),
                    fit: BoxFit.contain),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 9, 53, 100),
              ),
              child: IconButton(
                icon: Icon(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  (Icons.arrow_forward_rounded),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
