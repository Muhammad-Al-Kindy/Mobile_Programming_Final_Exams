// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'dart:async';
import 'dart:convert';
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

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dio = Dio();
  int pageNumber = 1;
  int pageSize = 20;
  int totalItems = 0;
  List<Map<String, dynamic>> data = [];

  String url_domain = "http://192.168.209.203:8000/";

  @override
  void initState() {
    super.initState();
    show_all_data();
  }

  Future<void> show_all_data() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/all_data/$pageSize?page=$pageNumber");
        var result = response.data;

        if (result is Map<String, dynamic>) {
          totalItems = result['totalItems'];
          List<Map<String, dynamic>> data =
              List<Map<String, dynamic>>.from(result['data']);
        }
        break; // break the loop after successfully getting the data
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response!.statusCode == 429) {
            await Future.delayed(Duration(seconds: 4));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cripst Dashboard',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontFamily: FontPicker.boldPoppins,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 21, 57, 135),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    "Hasil Survey dari Responden ",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: FontPicker.boldPoppins,
                                        fontSize: 18),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.addDataScreen);
                                    },
                                    style: ElevatedButton.styleFrom(),
                                    child: const Text(
                                      "Tambah data",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontPicker.boldPoppins,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                DataTable(
                                  columnSpacing: 16,
                                  dataRowMaxHeight: 150,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        'Genre',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Reports',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Gpa',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ],
                                  rows: data.map((rowData) {
                                    return DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Container(
                                            width: 80, // Atur lebar sel
                                            height: 200, // Atur tinggi sel
                                            alignment: Alignment
                                                .centerLeft, // Atur alignment teks dalam sel
                                            child: Text(
                                                rowData['genre'].toString()),
                                          ), // Atur margin vertikal
                                        ),
                                        DataCell(
                                          Container(
                                            width: 180, // Atur lebar sel
                                            height: 150, // Atur tinggi sel
                                            alignment: Alignment
                                                .centerLeft, // Atur alignment teks dalam sel
                                            child: Text(
                                                rowData['reports'].toString()),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                              width: 100, // Atur lebar sel
                                              height: 40, // Atur tinggi sel
                                              alignment: Alignment
                                                  .centerLeft, // Atur alignment teks dalam sel
                                              child: Text(
                                                  rowData['gpa'].toString())),
                                        )
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
