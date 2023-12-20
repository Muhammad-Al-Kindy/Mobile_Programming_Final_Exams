// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'dart:async';
import 'package:flutter/services.dart';
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

class AddDataScreen extends StatefulWidget {
  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  String? selectedGenre = "Academic Support and Resources";
  String? selectedGender = "M";
  String? selectedNationality = "Indonesia";
  var listGender = ["M", "F"];
  var listNationality = [
    "France",
    "Indonesia",
    "Mexico",
    "South Africa",
    "Soudan",
    "Yemen"
  ];
  var listGenre = [
    "Academic Support and Resources",
    "Athletics and sports",
    "Career opportunities",
    "Financial Support",
    "Health and Well-being Support",
    "International student experiences",
    "Online learning",
    "Student Affairs",
    "Housing and Transportation",
    "Activities and Travelling",
    "Food and Cantines",
  ];
  final dio = Dio();

  final TextEditingController reportsController =
      TextEditingController(text: "");
  final TextEditingController ageController = TextEditingController(text: "");
  final TextEditingController gpaController = TextEditingController(text: "");
  final TextEditingController yearController = TextEditingController(text: "");
  final TextEditingController countController = TextEditingController(text: "");

  String url_domain = "http://192.168.209.203:8000/";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kuisioner',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontFamily: FontPicker.boldPoppins,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 21, 57, 135),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Genre",
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
                  value: selectedGenre,
                  underline: SizedBox(),
                  borderRadius: BorderRadius.circular(10),
                  alignment: Alignment.center,
                  focusColor: Color.fromARGB(255, 236, 236, 236),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedGenre = value;
                    });
                  },
                  items: listGenre
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reports",
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
                  controller: reportsController,
                  decoration: InputDecoration(
                      hintText:
                          "ex: 'The limited access to research databases and materials is causing a lot of frustration among students. We need better access to be able to succeed academically.'",
                      enabledBorder: InputBorder.none),
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Age",
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
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: "ex: 10", enabledBorder: InputBorder.none),
                  style: TextStyle(fontSize: 20),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gpa",
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
                  controller: gpaController,
                  decoration: InputDecoration(
                      hintText: "ex: 2.18", enabledBorder: InputBorder.none),
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Year",
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
                  controller: yearController,
                  decoration: InputDecoration(
                      hintText: "ex: 3", enabledBorder: InputBorder.none),
                  style: TextStyle(fontSize: 20),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Count",
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
                  controller: countController,
                  decoration: InputDecoration(
                      hintText: "ex: 1", enabledBorder: InputBorder.none),
                  style: TextStyle(fontSize: 20),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
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
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nationality",
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
                  value: selectedNationality,
                  underline: SizedBox(),
                  borderRadius: BorderRadius.circular(10),
                  alignment: Alignment.center,
                  focusColor: Color.fromARGB(255, 236, 236, 236),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedNationality = value;
                    });
                  },
                  items: listNationality
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
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
                          "Close",
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
                          if (selectedGenre == "" ||
                              reportsController.text == "" ||
                              int.parse(ageController.text) == 0 ||
                              double.parse(gpaController.text) == 0 ||
                              int.parse(yearController.text) == 0 ||
                              int.parse(countController.text) == 0 ||
                              selectedGender == "" ||
                              selectedNationality == "") {
                            print(null);
                          } else {
                            create_date(
                                selectedGenre!,
                                reportsController.text,
                                int.parse(ageController.text),
                                double.parse(gpaController.text),
                                int.parse(yearController.text),
                                int.parse(countController.text),
                                selectedGender!,
                                selectedNationality!);
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          "Simpan",
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
    );
  }

  void create_date(
      String selectedGenre,
      String reports,
      int age,
      double gpa,
      int year,
      int count,
      String selectedGender,
      String selectedNationality) async {
    Response response;
    response = await dio.post(
      "${url_domain}api/create_data",
      queryParameters: {
        'genre': selectedGenre,
        'reports': reports,
        'age': age,
        'gpa': gpa,
        'year': year,
        'count': count,
        'gender': selectedGender,
        'nationality': selectedNationality
      },
    );
  }
}
