// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:midterm_exam_mobile/screens/main_home.dart';
import 'package:midterm_exam_mobile/models/user.dart';
import 'dart:math' as math;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String url_domain = "http://192.168.209.203:8000/";

  TextEditingController nimController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  bool _isVisible = true;
  final dio = Dio();

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
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 130, left: 30),
              child: Text(
                'Welcome,',
                style: TextStyle(
                    fontFamily: FontPicker.boldPoppins,
                    fontSize: 50,
                    color: const Color.fromARGB(255, 23, 95, 171)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 195, bottom: 30, left: 30),
              child: Text(
                'login to start with Crips ',
                style: TextStyle(
                    fontFamily: FontPicker.boldPoppins,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 23, 95, 171)),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 197.5, bottom: 30, left: 272.5),
              child: Transform.flip(
                flipX: true,
                child: Icon(Icons.waving_hand_rounded,
                    color: Color.fromRGBO(255, 213, 99, 1)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 260, bottom: 30, left: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NIM",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 15),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            strokeAlign: 1, width: 1, color: Colors.white),
                      ),
                      margin: EdgeInsets.only(right: 30, top: 10, bottom: 20),
                      padding: EdgeInsets.only(left: 12.5),
                      child: TextFormField(
                        controller: nimController,
                        decoration: InputDecoration(
                            hintText: "ex: 214176xxxx",
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 15),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            strokeAlign: 1, width: 1, color: Colors.white),
                      ),
                      margin: EdgeInsets.only(right: 30, top: 10),
                      padding: EdgeInsets.only(left: 12.5),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              padding: EdgeInsetsDirectional.only(end: 12.0),
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                            ),
                            hintText: "xxxxxxx",
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                        obscureText: _isVisible,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 30),
                      child: Text('Forgot Password?',
                          style: TextStyle(
                              fontFamily: FontPicker.mediumPoppins,
                              fontSize: 17,
                              color: Color.fromRGBO(23, 95, 171, 1))),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30, top: 40),
                      padding: EdgeInsets.only(left: 12.5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            primary: Color.fromARGB(255, 9, 53, 100),
                            padding: EdgeInsets.only(
                                left: 135, right: 135, top: 10, bottom: 10)),
                        onPressed: () async {
                          print("object");
                          if (nimController.text == "" ||
                              passwordController.text == "") {
                            print(null);
                          } else {
                            login(nimController.text, passwordController.text);
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.of(context).pushNamed(
                                AppRoutes.mainHomeScreen,
                                arguments: User(nimController.text.toString()));
                            AwesomeDialog(
                                    context: context,
                                    autoHide: Duration(seconds: 1),
                                    dialogType: DialogType.success,
                                    title: "Success",
                                    desc: "Kamu berhasil login")
                                .show();
                          }
                        },
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                              fontFamily: FontPicker.mediumPoppins,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 600, left: 70),
              child: Row(
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: FontPicker.mediumPoppins,
                      fontSize: 17,
                      color: Color.fromRGBO(23, 95, 171, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                    },
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 53, 100),
                          fontSize: 17,
                          fontFamily: FontPicker.semiboldPoppins),
                    ),
                  ),
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }

  void login(String nim, String password) async {
    Response response;
    response = await dio.post(
      "${url_domain}api/login",
      queryParameters: {
        'nim': nim,
        'password': password,
      },
    );
  }
}
