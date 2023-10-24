// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:midterm_exam_mobile/models/negara.dart';
import 'package:dio/dio.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dio = Dio();
  List<Negara>? _chartData;
  String url_domain = "http://192.168.0.2:8000/";

  Future<dynamic> countNationalityIndonesia() async {
    var response =
        await dio.get("${url_domain}api/count/nationality/Indonesia");
    var result = response.data;
    return result;
  }

  Future<dynamic> countNationalitySoudan() async {
    var response = await dio.get("${url_domain}api/count/nationality/Soudan");
    var result = response.data;
    return result;
  }

  Future<dynamic> countNationalityFrance() async {
    var response = await dio.get("${url_domain}api/count/nationality/France");
    var result = response.data;
    return result;
  }

  Future<dynamic> countNationalityMexico() async {
    var response = await dio.get("${url_domain}api/count/nationality/Mexico");
    var result = response.data;
    return result;
  }

  Future<dynamic> countNationalitySouth() async {
    var response =
        await dio.get("${url_domain}api/count/nationality/South Africa");
    var result = response.data;
    return result;
  }

  Future<dynamic> countNationalityYemen() async {
    var response = await dio.get("${url_domain}api/count/nationality/Yemen");
    var result = response.data;
    return result;
  }

  hasilIndonesia() async {
    int result = await countNationalityIndonesia();
  }

  Future<List<Negara>> getChartData() async {
    List<Negara> chartData = [
      Negara('Indonesia', int.parse(await countNationalityIndonesia())),
      Negara('Yemen', int.parse(await countNationalityYemen())),
      Negara('South Africa', int.parse(await countNationalitySouth())),
      Negara('Mexico', int.parse(await countNationalityMexico())),
      Negara('France', int.parse(await countNationalityFrance())),
      Negara('Soudan', int.parse(await countNationalitySoudan())),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cripst'),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    "Hasil Survey dari Responden : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                                // ==================== Card ====================
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title:
                                          const Text('Negara Asal Koresponden'),
                                      children: <Widget>[
                                        ListBody(
                                          children: <Widget>[
                                            SfCircularChart(
                                              series: <CircularSeries>[
                                                PieSeries<Negara, String>(
                                                  dataSource: _chartData,
                                                  xValueMapper:
                                                      (Negara data, _) =>
                                                          data.negara,
                                                  yValueMapper:
                                                      (Negara data, _) =>
                                                          data.jumlah,
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                      onExpansionChanged: (bool expanded) {},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // berita(),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
