// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:midterm_exam_mobile/models/user.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';

class UserScreenEdit extends StatefulWidget {
  @override
  State<UserScreenEdit> createState() => _UserScreenEditState();
}

class _UserScreenEditState extends State<UserScreenEdit> {
  String url_domain = "http://192.168.209.203:8000/";
  var listGender = ["M", "F"];
  bool _isVisible = true;
  bool _isVisibleConfPass = true;
  String? selectedGender = "M";
  final dio = Dio();
  late Future<Map<String, dynamic>> userData;
  late String name = '';
  late String nim = '';
  late String nohp = '';
  late String email = '';
  late String gender = '';
  late String password = '';

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> users(String nim) async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/search/$nim");
        final result = response.data;
        return result
            as Map<String, dynamic>; // Cast the result to the correct type
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 1));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
    throw Exception(
        "Failed to fetch user data"); // Add a throw statement to handle the case where the loop doesn't succeed
  }

  void fetchData() async {
    try {
      // Wait for the userData Future to complete
      Map<String, dynamic> userDataMap = await userData;

      // Now you can safely access the 'name' attribute
      setState(() {
        nim = userDataMap['nim'];
        name = userDataMap['name'];
        email = userDataMap['email'];
        nohp = userDataMap['nohp'];
        gender = userDataMap['gender'];
      });

      // Use the userName variable as needed
      print('User name: $name');
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  final TextEditingController passwordController =
      TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController nohpController = TextEditingController(text: "");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    userData = users(user.nim);
    if (nim == '') {
      fetchData();
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  tileMode: TileMode.decal,
                  colors: [
                    Color.fromARGB(255, 30, 41, 59),
                    Color.fromARGB(255, 51, 65, 85),
                    Color.fromARGB(255, 9, 53, 100),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Transform.flip(
                flipX: true,
                child: IconButton(
                  style:
                      IconButton.styleFrom(backgroundColor: Colors.transparent),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    (Icons.arrow_forward_rounded),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              height: 500,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 250, left: 30, right: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nim",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: nim.toString(),
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: name, enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: email, enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No HP/WA",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: nohpController,
                        decoration: InputDecoration(
                            hintText: nohp, enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      width: MediaQuery.of(context).size.width,
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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      width: MediaQuery.of(context).size.width,
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
                            hintText: password,
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                        obscureText: _isVisible,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Konfirmasi Password",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            strokeAlign: 1, width: 3, color: Colors.white),
                      ),
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(bottom: 20, top: 3),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_isVisibleConfPass
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              padding: EdgeInsetsDirectional.only(end: 12.0),
                              onPressed: () {
                                setState(() {
                                  _isVisibleConfPass = !_isVisibleConfPass;
                                });
                              },
                            ),
                            hintText: "Confirm Password",
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                        obscureText: _isVisibleConfPass,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontPicker.boldPoppins,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                print("object");
                                if (nohpController.text == "" ||
                                    emailController.text == "" ||
                                    selectedGender == "" ||
                                    passwordController.text == "" ||
                                    confirmPasswordController.text == "") {
                                  print(null);
                                } else {
                                  if (passwordController.text ==
                                      confirmPasswordController.text) {
                                    create_date(
                                        nohpController.text,
                                        selectedGender!,
                                        emailController.text,
                                        passwordController.text);
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.userScreen,
                                        arguments: User(nim));
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontPicker.boldPoppins,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void create_date(
    String nohp,
    String gender,
    String email,
    String password,
  ) async {
    Response response;
    response = await dio.post(
      "${url_domain}api/edit/$nim",
      queryParameters: {
        'nohp': nohp,
        'gender': gender,
        'email': email,
        'password': password,
      },
    );
  }
}
