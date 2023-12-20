// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:midterm_exam_mobile/models/status_akhir.dart';
import 'package:midterm_exam_mobile/models/user.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/models/age.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:midterm_exam_mobile/models/negara.dart';
import 'package:midterm_exam_mobile/models/gender.dart';
import 'package:midterm_exam_mobile/models/genre.dart';
import 'package:dio/dio.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dio = Dio();
  List<Negara>? _chartData;
  List<StatusAkhir>? _statusAkhirData;
  List<Gender>? _genderData;
  late List<Genre> _genreData = [];
  late List<Age> _ageData = [];
  late String username = '';
  late String nim = '';
  late Future<Map<String, dynamic>> userData;

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

  String url_domain = "http://192.168.209.203:8000/";

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

  Future<dynamic> countRespondents() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/respondents");
        return response.data;
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
  }

  Future<dynamic> avgGpa() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/avg/gpa");
        return response.data;
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
  }

  Future<dynamic> avgAge() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/avg/age");
        var result = double.parse(response.data);
        return result.toStringAsFixed(3);
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
  }

  Future<dynamic> countAge16() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/16");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge17() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/17");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge18() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/18");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge19() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/19");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge20() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/20");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge21() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/21");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge22() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/22");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge23() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/23");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge24() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/24");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge25() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/25");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge26() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/26");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countAge27() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/age/27");
        return response.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 2));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreAcademic() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/genre/Academic Support and Resources");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreAthletics() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/genre/Athletics and sports");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreCareer() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/genre/Career opportunities");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreFinancial() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/genre/Financial Support");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreHealth() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/genre/Health and Well-being Support");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreInternational() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get(
            "${url_domain}api/count/genre/International student experiences");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreOnline() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/genre/Online learning");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreStudent() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/genre/Student Affairs");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreHousing() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/genre/Housing and Transportation");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreActivities() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/genre/Activities and Travelling");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenreFood() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/genre/Food and Cantines");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 3));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenderF() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/gender/F");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 4));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countGenderM() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/gender/M");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 4));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countStatusLulus() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/mhs/Lulus");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 10));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countStatusKeluar() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/mhs/KeluarMengundurkanDiri");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 10));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countStatusMengulang() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get(
            "${url_domain}api/count/mhs/Mengulang Karena Tidak Lulus Tugas Akhir");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 10));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countStatusTidakAktif() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get(
            "${url_domain}/count/mhs/Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 10));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countStatusMdMaba() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}/count/mhs/MD MABA");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 10));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countStatusMduTdu() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}/count/mhs/MD TDU setelah Cuti TRM");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 10));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countNationalityIndonesia() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/nationality/Indonesia");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 5));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countNationalitySoudan() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/nationality/Soudan");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 5));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countNationalityFrance() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/nationality/France");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 5));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countNationalityMexico() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/nationality/Mexico");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 5));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countNationalitySouth() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/nationality/South Africa");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 5));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countNationalityYemen() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/nationality/Yemen");
        return int.parse(response.data[0].toString());
      } on DioError catch (e) {
        if (e.type == DioErrorType.badResponse) {
          if (e.response?.statusCode == 429) {
            await Future.delayed(Duration(seconds: 5));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<List<StatusAkhir>> getStatusAkhirData() async {
    List<StatusAkhir> statusAkhirData = [
      StatusAkhir('Lulus', await countStatusMduTdu()),
      StatusAkhir('Keluar Mengundurkan Diri', await countStatusKeluar()),
      StatusAkhir('Mengulang Karena Tidak Lulus Tugas Akhir',
          await countStatusMengulang()),
      StatusAkhir('Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)',
          await countStatusTidakAktif()),
      StatusAkhir('MD MABA', await countStatusMdMaba()),
      StatusAkhir('MD TDU setelah Cuti TRM', await countStatusMduTdu()),
    ];
    return statusAkhirData;
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

  Future<void> _getStatusAkhirData() async {
    _statusAkhirData = _statusAkhirData ?? await getStatusAkhirData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    userData = users(user.nim);
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
                                SizedBox(height: 10),
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title: const Text(
                                        'Koresponden',
                                        style: TextStyle(
                                            fontFamily: FontPicker.boldPoppins),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      collapsedShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      collapsedBackgroundColor:
                                          Color.fromRGBO(223, 232, 243, 0.98),
                                      backgroundColor:
                                          Color.fromRGBO(223, 232, 243, 0.98),
                                      children: <Widget>[
                                        ListBody(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 45,
                                                                right: 50),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                "Total",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontFamily:
                                                                        FontPicker
                                                                            .mediumPoppins),
                                                              ),
                                                            ),
                                                            Container(
                                                              child:
                                                                  FutureBuilder<
                                                                      dynamic>(
                                                                future:
                                                                    countRespondents(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              59,
                                                                              104,
                                                                              156),
                                                                          fontFamily:
                                                                              FontPicker.boldPoppins,
                                                                          fontSize:
                                                                              30,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return const Center(
                                                                      child: CircularProgressIndicator
                                                                          .adaptive(),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                "Person",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        FontPicker
                                                                            .mediumPoppins,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 20),
                                                              child: Text(
                                                                "Gender ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontFamily:
                                                                        FontPicker
                                                                            .mediumPoppins),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 205,
                                                              height: 100,
                                                              child:
                                                                  SfCircularChart(
                                                                legend: Legend(
                                                                    isVisible:
                                                                        true),
                                                                series: <CircularSeries>[
                                                                  DoughnutSeries<
                                                                      Gender,
                                                                      String>(
                                                                    enableTooltip:
                                                                        true,
                                                                    dataLabelSettings:
                                                                        DataLabelSettings(
                                                                            isVisible:
                                                                                true),
                                                                    dataSource:
                                                                        _genderData,
                                                                    xValueMapper:
                                                                        (Gender data,
                                                                                _) =>
                                                                            data.jk,
                                                                    yValueMapper:
                                                                        (Gender data,
                                                                                _) =>
                                                                            data.jumlah,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              constraints:
                                                  BoxConstraints.expand(
                                                width: 205,
                                                height: 340,
                                              ),
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15),
                                                    child: Text(
                                                      "Negara Asal ",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontFamily: FontPicker
                                                              .mediumPoppins),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: SfCircularChart(
                                                      legend: Legend(
                                                          isVisible: true),
                                                      series: <CircularSeries>[
                                                        PieSeries<Negara,
                                                            String>(
                                                          dataLabelSettings:
                                                              DataLabelSettings(
                                                                  isVisible:
                                                                      true),
                                                          dataSource:
                                                              _chartData,
                                                          xValueMapper:
                                                              (Negara data,
                                                                      _) =>
                                                                  data.negara,
                                                          yValueMapper:
                                                              (Negara data,
                                                                      _) =>
                                                                  data.jumlah,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                      onExpansionChanged: (bool expanded) {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title: const Text(
                                        'Faktor Permasalahan',
                                        style: TextStyle(
                                            fontFamily: FontPicker.boldPoppins),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      collapsedShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      collapsedBackgroundColor:
                                          Color.fromRGBO(223, 232, 243, 0.98),
                                      backgroundColor:
                                          Color.fromRGBO(223, 232, 243, 0.98),
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
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
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Card(
                                            color: Color.fromRGBO(
                                                223, 232, 243, 1),
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
                                                    "Average GPA",
                                                    style: TextStyle(
                                                        fontFamily: FontPicker
                                                            .boldPoppins,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                Container(
                                                  width: 165,
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
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      59,
                                                                      104,
                                                                      156),
                                                              fontFamily:
                                                                  FontPicker
                                                                      .boldPoppins,
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
                                                    "GPA",
                                                    style: TextStyle(
                                                        fontFamily: FontPicker
                                                            .mediumPoppins,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Card(
                                            color: Color.fromRGBO(
                                                223, 232, 243, 1),
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
                                                    "Average Age ",
                                                    style: TextStyle(
                                                        fontFamily: FontPicker
                                                            .boldPoppins,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                Container(
                                                  width: 165,
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
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      59,
                                                                      104,
                                                                      156),
                                                              fontFamily:
                                                                  FontPicker
                                                                      .boldPoppins,
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
                                                        fontFamily: FontPicker
                                                            .mediumPoppins,
                                                        fontSize: 17),
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
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title: const Text(
                                        'Rerata Usia',
                                        style: TextStyle(
                                            fontFamily: FontPicker.boldPoppins),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      collapsedShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      collapsedBackgroundColor:
                                          Color.fromRGBO(223, 232, 243, 0.98),
                                      backgroundColor:
                                          Color.fromRGBO(223, 232, 243, 0.98),
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
                                      backgroundColor:
                                          Color.fromARGB(255, 63, 96, 169),
                                      padding: const EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      "Lihat Detail Responden",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontPicker.boldPoppins,
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
