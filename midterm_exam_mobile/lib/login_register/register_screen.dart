// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'dart:math' as math;

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _controller = PageController(initialPage: 0);
  TextEditingController nimController = TextEditingController(text: "");
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController nohpController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "");
  final double MAX_PAGE = 6;
  final dio = Dio();
  late double currentValue;
  String? selectedGender = "M";
  var listGender = ["M", "F"];
  bool _isVisiblePass = true;
  bool _isVisibleConfPass = true;
  String url_domain = "http://192.168.209.203:8000/";

  @override
  void initState() {
    currentValue = 1 / MAX_PAGE;
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
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Transform.flip(
                flipX: true,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    (Icons.arrow_forward_rounded),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 30, right: 30),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 400,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (index) {
                      print(index);
                      setState(() {
                        currentValue = (index + 1) / MAX_PAGE;
                      });
                    },
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Let’s start with your name",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    hintText: "Niken Maharani Permata",
                                    enabledBorder: InputBorder.none),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Hello ${nameController.text}",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Text(
                                " Enter your email",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 80, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    enabledBorder: InputBorder.none),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "What’s your NIM?",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: TextFormField(
                                controller: nimController,
                                decoration: InputDecoration(
                                    hintText: "2141xxxxxx",
                                    enabledBorder: InputBorder.none),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "What’s your phone number?",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: TextFormField(
                                controller: nohpController,
                                decoration: InputDecoration(
                                    hintText: "+62 8121 xxxx xxx",
                                    enabledBorder: InputBorder.none),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "What’s your gender?",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: DropdownButton<String>(
                                value: selectedGender,
                                underline: SizedBox(),
                                borderRadius: BorderRadius.circular(10),
                                alignment: Alignment.center,
                                focusColor: Color.fromARGB(255, 236, 236, 236),
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                                items: listGender
                                    .map<DropdownMenuItem<String>>(
                                        (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e.toString()),
                                            ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Great! Create your password",
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(_isVisiblePass
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      padding:
                                          EdgeInsetsDirectional.only(end: 12.0),
                                      onPressed: () {
                                        setState(() {
                                          _isVisiblePass = !_isVisiblePass;
                                        });
                                      },
                                    ),
                                    hintText: "Password",
                                    enabledBorder: InputBorder.none),
                                style: TextStyle(fontSize: 15),
                                obscureText: _isVisiblePass,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    strokeAlign: 1,
                                    width: 3,
                                    color: Colors.white),
                              ),
                              margin: EdgeInsets.only(top: 140, bottom: 20),
                              padding: EdgeInsets.only(left: 12.5),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(_isVisibleConfPass
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      padding:
                                          EdgeInsetsDirectional.only(end: 12.0),
                                      onPressed: () {
                                        setState(() {
                                          _isVisibleConfPass =
                                              !_isVisibleConfPass;
                                        });
                                      },
                                    ),
                                    hintText: "Confirm Password",
                                    enabledBorder: InputBorder.none),
                                style: TextStyle(fontSize: 15),
                                obscureText: _isVisibleConfPass,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 590, start: 30),
              child: Text(
                (currentValue * MAX_PAGE).toStringAsFixed(0),
                style: TextStyle(
                    fontFamily: FontPicker.boldPoppins,
                    fontSize: 18,
                    color: Color.fromARGB(255, 9, 53, 100)),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 590, start: 40),
              child: Text(
                "/${MAX_PAGE.toStringAsFixed(0)}",
                style: TextStyle(
                    fontFamily: FontPicker.boldPoppins,
                    fontSize: 18,
                    color: Color.fromARGB(255, 254, 254, 255)),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 630, start: 30, end: 30),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    color: Color.fromARGB(255, 9, 53, 100),
                    value: currentValue,
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 15,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 575, start: 335),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 9, 53, 100),
              ),
              child: IconButton(
                onPressed: () {
                  if (nameController.text == "" ||
                      emailController.text == "" ||
                      nimController.text == "" ||
                      nohpController.text == "" ||
                      selectedGender == "" ||
                      passwordController.text == "" ||
                      confirmPasswordController.text == "") {
                    _controller.nextPage(
                        duration: Duration(microseconds: 100),
                        curve: Curves.ease);
                  } else {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      create_date(
                          nameController.text,
                          emailController.text,
                          nimController.text,
                          nohpController.text,
                          selectedGender!,
                          passwordController.text);
                      Navigator.of(context)
                          .pushNamed(AppRoutes.registerScreenDone);
                    }
                  }
                },
                icon: Icon(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  (Icons.arrow_forward_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void create_date(String name, String email, String nim, String nohp,
      String selectedGender, String password) async {
    Response response;
    response = await dio.post(
      "${url_domain}api/register",
      queryParameters: {
        'nim': nim,
        'name': name,
        'email': email,
        'nohp': nohp,
        'gender': selectedGender,
        'password': password,
      },
    );
  }
}
