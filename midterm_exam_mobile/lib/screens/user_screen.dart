// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:midterm_exam_mobile/models/user.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String url_domain = "http://192.168.209.203:8000/";
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
    fetchData();
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
    }
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
              child: Stack(
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nim",
                            style: TextStyle(
                                fontFamily: FontPicker.mediumPoppins,
                                fontSize: 19),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 20, top: 5),
                          child: Text(
                            nim,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: FontPicker.mediumPoppins,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nama",
                            style: TextStyle(
                                fontFamily: FontPicker.mediumPoppins,
                                fontSize: 19),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                            bottom: 20,
                            top: 5,
                          ),
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: FontPicker.mediumPoppins,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                            bottom: 20,
                            top: 5,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: FontPicker.mediumPoppins,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(left: 220),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontFamily: FontPicker.mediumPoppins,
                                fontSize: 19),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 20, top: 5),
                          child: Text(
                            gender,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: FontPicker.mediumPoppins,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "No HP/WA",
                            style: TextStyle(
                                fontFamily: FontPicker.mediumPoppins,
                                fontSize: 19),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 20, top: 5),
                          child: Text(
                            nohp,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: FontPicker.mediumPoppins,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            right: 10,
                            bottom: 20,
                            top: 5,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.userScreenEdit,
                                  arguments: User(nim));
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: FontPicker.mediumPoppins,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
