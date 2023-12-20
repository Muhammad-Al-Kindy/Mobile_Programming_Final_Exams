// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new

// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';
// import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:midterm_exam_mobile/models/age.dart';
// import 'package:midterm_exam_mobile/controllers/app_routes.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:midterm_exam_mobile/models/negara.dart';
// import 'package:midterm_exam_mobile/models/gender.dart';
// import 'package:midterm_exam_mobile/models/genre.dart';
// import 'package:dio/dio.dart';
// import 'package:charts_flutter_new/flutter.dart' as charts;

// class DetailScreen extends StatefulWidget {
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   final dio = Dio();
//   List<Map<String, dynamic>> data = [];

//   String url_domain = "http://192.168.77.252:8000/";

//   @override
//   void initState() {
//     super.initState();
//     show_all_data();
//   }

//   Future<dynamic> show_all_data() async {
//     try {
//       var response = await dio.get("${url_domain}api/all_data");
//       var result = response.data;

//       if (result is List) {
//         data = List<Map<String, dynamic>>.from(result);
//         setState(() {});
//       }
//     } catch (e) {
//       print('error : ${e.toString()}');
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Cripst Dashboard',
//           textAlign: TextAlign.end,
//           style: TextStyle(
//             fontFamily: FontPicker.bold,
//           ),
//         ),
//         backgroundColor: Color.fromARGB(255, 21, 57, 135),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   child: SizedBox(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 20, horizontal: 20),
//                             child: Column(
//                               children: <Widget>[
//                                 const Padding(
//                                   padding: EdgeInsets.only(bottom: 20),
//                                   child: Text(
//                                     "Hasil Survey dari Responden ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                         fontFamily: FontPicker.bold,
//                                         fontSize: 18),
//                                   ),
//                                 ),
//                                 Container(
//                                   child: FutureBuilder<dynamic>(
//                                     future: show_all_data(),
//                                     builder: (context, snapshot) {
//                                       if (snapshot.hasData) {
//                                         print(_age(snapshot.data[0]));
//                                         return ListView.builder(
//                                             padding: EdgeInsets.all(8),
//                                             itemCount: snapshot.data.length,
//                                             itemBuilder: (BuildContext context,
//                                                 int index) {
//                                               return Card(
//                                                 child: Column(
//                                                   children: <Widget>[
//                                                     ListTile(
//                                                       leading: CircleAvatar(
//                                                           radius: 30,
//                                                           backgroundImage:
//                                                               NetworkImage(snapshot
//                                                                               .data[
//                                                                           index]
//                                                                       [
//                                                                       'picture']
//                                                                   ['large'])),
//                                                       title: Text(_name(snapshot
//                                                           .data[index])),
//                                                       subtitle: Text(_location(
//                                                           snapshot
//                                                               .data[index])),
//                                                       trailing: Text(_age(
//                                                           snapshot
//                                                               .data[index])),
//                                                     )
//                                                   ],
//                                                 ),
//                                               );
//                                             });
//                                       } else {
//                                         return const Center(
//                                           child: CircularProgressIndicator
//                                               .adaptive(),
//                                         );
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
