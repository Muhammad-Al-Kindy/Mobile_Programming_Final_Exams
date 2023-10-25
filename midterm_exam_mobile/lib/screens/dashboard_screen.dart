// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element

import 'dart:convert';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:midterm_exam_mobile/models/negara.dart';
import 'package:midterm_exam_mobile/models/gender.dart';
import 'package:midterm_exam_mobile/models/genre.dart';
import 'package:dio/dio.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dio = Dio();
  List<Negara>? _chartData;
  List<Gender>? _genderData;
  late List<Genre> _genreData;

  @override
  void initState() {
    _getChartData();
    _getGenderData();
    _getGenreData();
    super.initState();
  }

  String url_domain = "http://192.168.0.6:8000/";

  Future<dynamic> countRespondents() async {
    var response = await dio.get("${url_domain}api/count/respondents");
    var result = response.data;
    return result;
  }

  Future<dynamic> countGenreAcademic() async {
    var response = await dio
        .get("${url_domain}api/count/genre/Academic Support and Resources");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreAthletics() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Athletics and sports");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreCareer() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Career opportunities");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreFinancial() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Financial Support");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreHealth() async {
    var response = await dio
        .get("${url_domain}api/count/genre/Health and Well-being Support");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreInternational() async {
    var response = await dio
        .get("${url_domain}api/count/genre/International student experiences");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreOnline() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Online learning");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreStudent() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Student Affairs");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreHousing() async {
    var response = await dio
        .get("${url_domain}api/count/genre/Housing and Transportation");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreActivities() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Activities and Travelling");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenreFood() async {
    var response =
        await dio.get("${url_domain}api/count/genre/Food and Cantines");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenderF() async {
    var response = await dio.get("${url_domain}api/count/gender/F");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countGenderM() async {
    var response = await dio.get("${url_domain}api/count/gender/M");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countNationalityIndonesia() async {
    var response =
        await dio.get("${url_domain}api/count/nationality/Indonesia");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countNationalitySoudan() async {
    var response = await dio.get("${url_domain}api/count/nationality/Soudan");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countNationalityFrance() async {
    var response = await dio.get("${url_domain}api/count/nationality/France");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countNationalityMexico() async {
    var response = await dio.get("${url_domain}api/count/nationality/Mexico");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countNationalitySouth() async {
    var response =
        await dio.get("${url_domain}api/count/nationality/South Africa");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<dynamic> countNationalityYemen() async {
    var response = await dio.get("${url_domain}api/count/nationality/Yemen");
    var result = int.parse(response.data[0].toString());
    return result;
  }

  Future<List<Negara>> getChartData() async {
    List<Negara> chartData = [
      Negara('Indonesia', await countNationalityIndonesia()),
      Negara('Yemen', await countNationalityYemen()),
      Negara('South Africa', await countNationalitySouth()),
      Negara('Mexico', await countNationalityMexico()),
      Negara('France', await countNationalityFrance()),
      Negara('Soudan', await countNationalitySoudan()),
    ];
    return chartData;
  }

  Future<List<Gender>> getGenderData() async {
    List<Gender> genderData = [
      Gender('Male', await countGenderM()),
      Gender('Female', await countGenderF()),
    ];
    return genderData;
  }

  Future<List<Genre>> getGenreData() async {
    final List<Genre> genreData = [
      Genre('Academic Support and Resources', await countGenreAcademic()),
      Genre('Athletics and sports', await countGenreAthletics()),
      Genre('Career opportunities', await countGenreCareer()),
      Genre('Financial Support', await countGenreFinancial()),
      Genre('Health and Well-being Support', await countGenreHealth()),
      Genre(
          'International student experiences', await countGenreInternational()),
      Genre('Online learning', await countGenreOnline()),
      Genre('Student Affairs', await countGenreStudent()),
      Genre('Housing and Transportation', await countGenreHousing()),
      Genre('Activities and Travelling', await countGenreActivities()),
      Genre('Food and Cantines', await countGenreFood()),
    ];
    return genreData;
  }

  Future<void> _getChartData() async {
    _chartData = _chartData ?? await getChartData();
    setState(() {});
  }

  Future<void> _getGenderData() async {
    _genderData = _genderData ?? await getGenderData();
    setState(() {});
  }

  Future<void> _getGenreData() async {
    _genreData = (_genreData ?? await getGenreData())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _getGenreData();
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
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    "Hasil Survey dari Responden : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title:
                                          const Text('Negara Asal Koresponden'),
                                      children: <Widget>[
                                        ListBody(
                                          children: <Widget>[
                                            SfCircularChart(
                                              legend: Legend(isVisible: true),
                                              series: <CircularSeries>[
                                                PieSeries<Negara, String>(
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true),
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
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 5,
                                            shadowColor: Color.fromARGB(
                                                255, 21, 57, 135),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Text(
                                                    "Koresponden",
                                                    style: TextStyle(
                                                      color: Colors.red[900],
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 70,
                                                  margin: EdgeInsets.all(6),
                                                  padding: EdgeInsets.all(10),
                                                  child: FutureBuilder<dynamic>(
                                                    future: countRespondents(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Center(
                                                          child: Text(
                                                            snapshot.data
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .blue[800],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 30,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return const Center(
                                                          child:
                                                              CircularProgressIndicator
                                                                  .adaptive(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    "Person",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 5,
                                            shadowColor: Color.fromARGB(
                                                255, 21, 57, 135),
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    "Gender Responden",
                                                    style: TextStyle(
                                                      color: Colors.red[900],
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 190,
                                                  height: 110,
                                                  child: SfCircularChart(
                                                    legend:
                                                        Legend(isVisible: true),
                                                    series: <CircularSeries>[
                                                      DoughnutSeries<Gender,
                                                          String>(
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                                isVisible:
                                                                    true),
                                                        dataSource: _genderData,
                                                        xValueMapper:
                                                            (Gender data, _) =>
                                                                data.jk,
                                                        yValueMapper:
                                                            (Gender data, _) =>
                                                                data.jumlah,
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
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title: const Text('Faktor Permasalahan'),
                                      children: <Widget>[
                                        ListBody(
                                          children: <Widget>[
                                            BarChart(BarChartData(
                                                minY: 0,
                                                maxY: 200,
                                                barGroups: _genreData)),
                                            SfCartesianChart(
                                              primaryXAxis: CategoryAxis(),
                                              legend: Legend(isVisible: true),
                                              series: <ChartSeries>[
                                                BarSeries<Genre, String>(
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true),
                                                  dataSource: _genreData,
                                                  xValueMapper:
                                                      (Genre data, _) =>
                                                          data.genres,
                                                  yValueMapper:
                                                      (Genre data, _) =>
                                                          data.jumlah,
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                      onExpansionChanged: (bool expanded) {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // berita(),
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
