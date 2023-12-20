// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, void_checks, sort_child_properties_last

import 'package:dio/dio.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:midterm_exam_mobile/models/user.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  String url_domain = "http://192.168.209.203:8000/";
  final dio = Dio();
  int totalItems = 0;
  late Future<Map<String, dynamic>> userData;
  late String username = '';
  late String nim = '';
  ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);

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
        username = userDataMap['name'];
        nim = userDataMap['nim'];
      });

      // Use the userName variable as needed
      print('User name: $username');
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    userData = users(user.nim);
    if (username == '') {
      fetchData();
      return Scaffold(
        appBar: AppBar(
            title: Text('Hey ',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontPicker.boldPoppins,
                    fontSize: 20)),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            textAlign: TextAlign.end,
            'Hey ' + username,
            style: TextStyle(
                color: Colors.black,
                fontFamily: FontPicker.boldPoppins,
                fontSize: 20),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.view_list_rounded,
                color: const Color.fromARGB(255, 9, 53, 100),
              ),
              style: IconButton.styleFrom(alignment: Alignment.centerLeft),
            );
          }),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 242, 242, 242),
          child: ListView(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      color: const Color.fromARGB(255, 242, 242, 242)),
                  child: SizedBox(
                    height: 700,
                    child: Column(
                      children: [
                        ExpansionTile(
                          initiallyExpanded: true,
                          onExpansionChanged: (bool value) {
                            isExpanded.value = value;
                          },
                          trailing: AnimatedContainer(
                            transformAlignment: Alignment.topLeft,
                            duration: Duration(milliseconds: 200),
                            width: isExpanded.value ? 50 : 30,
                            height: isExpanded.value ? 50 : 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 9, 53, 100),
                              border: Border.all(style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "CRIP'S",
                            style: TextStyle(
                                fontFamily: FontPicker.boldPoppins,
                                fontSize: 30),
                          ),
                          children: [
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                'Home',
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.home),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.mainHomeScreen,
                                    arguments: User(nim));
                              },
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                'Dashboard',
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.show_chart_rounded),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.dashboardScreen,
                                    arguments: User(nim));
                              },
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                'Responden',
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.calendar_today_outlined),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                'Data Insiden',
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.storage),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.lapKekerasan,
                                    arguments: User(nim));
                              },
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                'Data Akademik',
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.book),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.dashboardScreenAkademik,
                                    arguments: User(nim));
                              },
                            ),
                            Divider(height: 175),
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                'Logout',
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.logout),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.loginScreen,
                                    arguments: User(''));
                              },
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              title: Text(
                                username,
                                style: TextStyle(
                                    fontFamily: FontPicker.mediumPoppins,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.account_circle_rounded),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.userScreen,
                                    arguments: User(nim));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Data has been successfully fetched
              Map<String, dynamic> userDataMap = snapshot.data!;
              username = userDataMap['name'];
              nim = userDataMap['nim'];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    height: 245,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 152, 162, 179),
                            blurRadius: 1.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 7.0),
                            blurStyle: BlurStyle.solid),
                        BoxShadow(
                            color: Color.fromARGB(189, 208, 213, 221),
                            blurRadius: 1.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 15.0),
                            blurStyle: BlurStyle.solid),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 9, 53, 100),
                    ),
                    width: 350,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 50, right: 30),
                    height: 220,
                    child: Text(
                      'Jangan Takut untuk Bersuara',
                      style: TextStyle(
                          fontFamily: FontPicker.mediumPoppins,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    width: 350,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45, top: 75),
                    child: Icon(Icons.flag, color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 335, top: 50),
                    child: Icon(Icons.star, color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 50, right: 30),
                    height: 220,
                    child: Text(
                      'Laporkan Kekerasan dan Pelecehan Seksual',
                      style: TextStyle(
                          fontFamily: FontPicker.boldPoppins,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    width: 350,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 165, left: 50, right: 30),
                    height: 220,
                    child: Text(
                      'Project dashboard management for a corporate chicken farm require a more structured...',
                      style: TextStyle(
                          fontFamily: FontPicker.regularPoppins,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                    width: 350,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 210, left: 140, right: 140),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.lapKekerasan,
                            arguments: User(nim));
                      },
                      child: Text(
                        'Ikut bersuara',
                        style: TextStyle(
                            fontFamily: FontPicker.regularPoppins,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 63, 96, 169),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 270),
                    height: 300,
                    child: Image(image: AssetImage('assets/img/women.png')),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 330, left: 225),
                    child: Text(
                      'Hai!',
                      style: TextStyle(
                          fontFamily: FontPicker.boldPoppins, fontSize: 25),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 370, left: 225),
                    child: Text(
                      'Kamu memiliki keluhan terhadap aktivitas akademik ?',
                      style: TextStyle(
                          fontFamily: FontPicker.mediumPoppins, fontSize: 13),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 435, left: 225),
                    child: Text(
                      'Masukkan Data\nKeluhan disini',
                      style: TextStyle(
                          fontFamily: FontPicker.boldPoppins, fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 472.5, left: 215),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.addDataScreen,
                            arguments: User(nim));
                      },
                      child: Text(
                        'Tambah Keluhan',
                        style: TextStyle(
                            fontFamily: FontPicker.mediumPoppins,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 63, 96, 169),
                        padding: EdgeInsets.only(left: 5, right: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 543),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        surfaceTintColor: const Color.fromARGB(255, 9, 53, 100),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.lapKekerasan,
                            arguments: User(nim));
                      },
                      icon: Icon(
                        Icons.add_box_rounded,
                        size: 45,
                      ),
                      color: const Color.fromARGB(255, 9, 53, 100),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      );
    }
  }
}
