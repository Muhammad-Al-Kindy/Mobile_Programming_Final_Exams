// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/models/age.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:midterm_exam_mobile/models/negara.dart';
import 'package:midterm_exam_mobile/models/gender.dart';
import 'package:midterm_exam_mobile/models/genre.dart';
import 'package:dio/dio.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];

  bool isLoading = false;
  int currentPage = 1;
  int totalPages = 10; // Set the total number of pages you want to paginate to.
  ScrollController _scrollController = ScrollController();

  String url_domain = "http://192.168.0.106:8000/";

  @override
  void initState() {
    super.initState();
    show_all_data();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    // Check if we've reached the desired number of pages.
    if (currentPage > totalPages) {
      return;
    }

    // Simulate loading data from your data source (e.g., an API).
    // Append new items to the 'items' list.
    setState(() {
      isLoading = true;
    });

    try {
      var response =
          await dio.post("${url_domain}api/all_data?page=$currentPage");
      var result = response.data;

      if (result is List) {
        data.addAll(List<Map<String, dynamic>>.from(result));
        currentPage++;
      }
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }

    // Fetch and append data here...

    setState(() {
      isLoading = false;
      currentPage++;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        _loadData();
      }
    }
  }

  Future<void> show_all_data() async {
    try {
      var response =
          await dio.post("${url_domain}api/all_data?page=$currentPage");
      var result = response.data;

      if (result is List) {
        data = List<Map<String, dynamic>>.from(result);
      }
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
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
            fontFamily: FontPicker.bold,
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
                                        fontFamily: FontPicker.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                ListView.builder(
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  itemCount: data.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index < data.length) {
                                      return ListTile(
                                        title: Text(data[index].toString()),
                                      );
                                    } else {
                                      if (isLoading) {
                                        return CircularProgressIndicator();
                                      } else {
                                        return Container(); // No more data
                                      }
                                    }
                                  },
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
