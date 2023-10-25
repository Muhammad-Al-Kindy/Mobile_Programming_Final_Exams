// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

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

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dio = Dio();
  List<Negara>? _chartData;
  List<Gender>? _genderData;
  late List<Genre> _genreData = [];
  late List<Age> _ageData = [];

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _getChartData();
    _getGenderData();
    _getGenreData();
    _getAgeData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  String url_domain = "http://192.168.0.5:8000/";

  Future<dynamic> countRespondents() async {
    var response = await dio.get("${url_domain}api/count/respondents");
    var result = response.data;
    return result;
  }

  Future<dynamic> avgGpa() async {
    var response = await dio.get("${url_domain}api/avg/gpa");
    var result = response.data;
    return result;
  }

  Future<dynamic> avgAge() async {
    var response = await dio.get("${url_domain}api/avg/age");
    var result = double.parse(response.data);
    var akhirResult = result.toStringAsFixed(3);
    return akhirResult;
  }

  Future<dynamic> countAge16() async {
    var response = await dio.get("${url_domain}api/count/age/16");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge17() async {
    var response = await dio.get("${url_domain}api/count/age/17");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge18() async {
    var response = await dio.get("${url_domain}api/count/age/18");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge19() async {
    var response = await dio.get("${url_domain}api/count/age/19");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge20() async {
    var response = await dio.get("${url_domain}api/count/age/20");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge21() async {
    var response = await dio.get("${url_domain}api/count/age/21");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge22() async {
    var response = await dio.get("${url_domain}api/count/age/22");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge23() async {
    var response = await dio.get("${url_domain}api/count/age/23");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge24() async {
    var response = await dio.get("${url_domain}api/count/age/24");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge25() async {
    var response = await dio.get("${url_domain}api/count/age/25");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge26() async {
    var response = await dio.get("${url_domain}api/count/age/26");
    var result = response.data;
    return result;
  }

  Future<dynamic> countAge27() async {
    var response = await dio.get("${url_domain}api/count/age/27");
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

  Future<List<Age>> getAgeData() async {
    final List<Age> AgeData = [
      Age('16', await countAge16()),
      Age('17', await countAge17()),
      Age('18', await countAge18()),
      Age('19', await countAge19()),
      Age('20', await countAge20()),
      Age('21', await countAge21()),
      Age('22', await countAge22()),
      Age('23', await countAge23()),
      Age('24', await countAge24()),
      Age('25', await countAge25()),
      Age('26', await countAge26()),
      Age('27', await countAge27()),
    ];
    return AgeData;
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
    _genreData = await getGenreData();
    setState(() {});
  }

  Future<void> _getAgeData() async {
    _ageData = await getAgeData();
    setState(() {});
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
                                            ConstrainedBox(
                                                constraints:
                                                    BoxConstraints.expand(
                                                        width: 400,
                                                        height: 300),
                                                child: SfCartesianChart(
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  series: <ChartSeries>[
                                                    BarSeries<Genre, String>(
                                                        dataSource: _genreData,
                                                        xValueMapper:
                                                            (Genre genre, _) =>
                                                                genre.genres,
                                                        yValueMapper:
                                                            (Genre genre, _) =>
                                                                genre.jumlah,
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                                isVisible:
                                                                    true),
                                                        enableTooltip: true),
                                                  ],
                                                  primaryXAxis: CategoryAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Permasalahan')),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text: 'jumlah'),
                                                      edgeLabelPlacement:
                                                          EdgeLabelPlacement
                                                              .shift),
                                                )),
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
                                                    "Rerata GPA",
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
                                                    future: avgGpa(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Center(
                                                          child: Text(
                                                            (snapshot.data
                                                                    as num)
                                                                .toStringAsFixed(
                                                                    3),
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
                                                    "Gpa",
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
                                                    "Avrage Age Responden",
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
                                                    future: avgAge(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Center(
                                                          child: Text(
                                                            (snapshot.data
                                                                .toString()),
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
                                                    "Age",
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
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title:
                                          const Text('Rerata Umur Responden'),
                                      children: <Widget>[
                                        ListBody(
                                          children: <Widget>[
                                            ConstrainedBox(
                                                constraints:
                                                    BoxConstraints.expand(
                                                        width: 400,
                                                        height: 300),
                                                child: SfCartesianChart(
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  isTransposed: true,
                                                  series: <ChartSeries>[
                                                    BarSeries<Age, String>(
                                                        dataSource: _ageData,
                                                        xValueMapper:
                                                            (Age ages, _) =>
                                                                ages.ages,
                                                        yValueMapper:
                                                            (Age ages, _) =>
                                                                ages.jumlah,
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                                isVisible:
                                                                    true),
                                                        enableTooltip: true),
                                                  ],
                                                  primaryXAxis: CategoryAxis(
                                                      title: AxisTitle(
                                                          text: 'Umur')),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text: 'Jumlah'),
                                                      edgeLabelPlacement:
                                                          EdgeLabelPlacement
                                                              .shift),
                                                )),
                                          ],
                                        )
                                      ],
                                      onExpansionChanged: (bool expanded) {},
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.detailScreen);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red[800],
                                      padding: const EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      "Lihat Detail Responden",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                )
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
