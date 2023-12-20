// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:midterm_exam_mobile/models/user.dart';
import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/models/age.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:midterm_exam_mobile/models/negara.dart';
import 'package:midterm_exam_mobile/models/gender.dart';
import 'package:midterm_exam_mobile/models/genre.dart';
import 'package:dio/dio.dart';

class LapKekerasan extends StatefulWidget {
  @override
  State<LapKekerasan> createState() => _LapKekerasanState();
}

class _LapKekerasanState extends State<LapKekerasan> {
  String url_domain = "http://192.168.209.203:8000/";
  final dio = Dio();
  int totalItems = 0;
  late Future<Map<String, dynamic>> userData;
  late String name = '';
  late String nim = '';
  late String nohp = '';

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
        name = userDataMap['name'];
        nim = userDataMap['nim'];
        nohp = userDataMap['nohp'];
      });

      // Use the userName variable as needed
      print('User name: $name');
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  final TextEditingController laporanController =
      TextEditingController(text: "");
  final TextEditingController kronologiController =
      TextEditingController(text: "");
  final TextEditingController buktiController = TextEditingController(text: "");

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
              // decoration: BoxDecoration(
              //     border: Border.all(
              //       width: 1.5,
              //       color: Colors.blue,
              //     ),
              //     borderRadius: BorderRadius.circular(50)),
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
              margin: EdgeInsets.only(top: 80, left: 20),
              child: Text(
                'Laporan Kekerasan\ndan Pelacehan Seksual',
                style: TextStyle(
                    fontFamily: FontPicker.semiboldPoppins,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 162.5, left: 20),
              child: Text(
                'Laporkan detail lengkap kejadian yang kamu alami.',
                style: TextStyle(
                    fontFamily: FontPicker.regularPoppins,
                    fontSize: 12,
                    color: Colors.white),
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
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: nohp, enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jenis Laporan",
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
                        decoration: InputDecoration(
                            hintText: "Kekerasan",
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kronologi",
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
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "Kronologi",
                            enabledBorder: InputBorder.none),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bukti",
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins, fontSize: 19),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 20),
                        margin: EdgeInsets.only(bottom: 20, top: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.file_upload),
                          ),
                        )),
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
                                if (nim == "" ||
                                    name == "" ||
                                    nohp == "" ||
                                    laporanController.text == "" ||
                                    kronologiController.text == "") {
                                  print(null);
                                } else {
                                  create_date(
                                      nim,
                                      name,
                                      nohp,
                                      laporanController.text,
                                      kronologiController.text,
                                      buktiController.text);
                                  Navigator.of(context).pop();
                                }
                              },
                              style: ElevatedButton.styleFrom(),
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
    String nim,
    String name,
    String nohp,
    String laporan,
    String kronologi,
    String bukti,
  ) async {
    Response response;
    response = await dio.post(
      "${url_domain}api/create_data",
      queryParameters: {
        'nim': nim,
        'name': name,
        'nohp': nohp,
        'jenisLaporan': laporan,
        'kronologi': kronologi,
        'bukti': bukti,
      },
    );
  }
}
