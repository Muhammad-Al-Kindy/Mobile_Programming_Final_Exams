// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, camel_case_types, unnecessary_import, unused_local_variable, depend_on_referenced_packages, unused_element, unnecessary_new, deprecated_member_use

import 'dart:async';
import 'package:midterm_exam_mobile/models/negara.dart';
import 'package:midterm_exam_mobile/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:midterm_exam_mobile/models/age.dart';
import 'package:midterm_exam_mobile/controllers/app_routes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:midterm_exam_mobile/models/provinsi.dart';
import 'package:midterm_exam_mobile/models/gender.dart';
import 'package:midterm_exam_mobile/models/genre.dart';
import 'package:midterm_exam_mobile/models/status_akhir.dart';
import 'package:dio/dio.dart';

class DashboardScreenAkademik extends StatefulWidget {
  @override
  State<DashboardScreenAkademik> createState() =>
      _DashboardScreenAkademikState();
}

class _DashboardScreenAkademikState extends State<DashboardScreenAkademik> {
  final dio = Dio();
  late List<Provinsi> _provinsiData = [];
  late List<StatusAkhir> _statusData = [];
  List<Gender>? _genderData;
  List<StatusAkhir>? _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _getProvinsiData();
    _getGenderData();
    _getChartData();
    _getStatusData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  String url_domain = "http://192.168.31.7:8000/";

  Future<dynamic> countRespondents() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/calonmhs");
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

  Future<dynamic> countGenderP() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/gendercalon/P");
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

  Future<dynamic> countGenderL() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get("${url_domain}api/count/gendercalon/L");
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
            await Future.delayed(Duration(seconds: 4));
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
            await Future.delayed(Duration(seconds: 4));
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
            await Future.delayed(Duration(seconds: 4));
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
            await Future.delayed(Duration(seconds: 4));
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
            await Future.delayed(Duration(seconds: 4));
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
            await Future.delayed(Duration(seconds: 4));
            continue;
          }
        }
        print('Request error: $e');
        rethrow;
      }
    }
  }

  Future<dynamic> countProvinsiJatim() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/JAWA TIMUR");
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

  Future<dynamic> countProvinsiBali() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/BALI");
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

  Future<dynamic> countProvinsiSulawesiSel() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SULAWESI SELATAN");
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

  Future<dynamic> countProvinsiJawaTengah() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/JAWA TENGAH");
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

  Future<dynamic> countProvinsiLampung() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/Lampung");
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

  Future<dynamic> countProvinsiKaltim() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/KALIMANTAN TIMUR");
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

  Future<dynamic> countProvinsiKepBangka() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio.get(
            "${url_domain}api/count/provinsicalon/KEPULAUAN BANGKA BELITUNG");
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

  Future<dynamic> countProvinsiKalsel() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/KALIMANTAN SELATAN");
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

  Future<dynamic> countProvinsiSumsel() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SUMATERA SELATAN");
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

  Future<dynamic> countProvinsiJabar() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/JAWA BARAT");
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

  Future<dynamic> countProvinsiRiau() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/RIAU");
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

  Future<dynamic> countProvinsiKalbar() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/KALIMANTAN BARAT");
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

  Future<dynamic> countProvinsiKepri() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/KEPULAUAN RIAU");
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

  Future<dynamic> countProvinsiDkiJak() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/DKI JAKARTA");
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

  Future<dynamic> countProvinsiBanten() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/BANTEN");
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

  Future<dynamic> countProvinsiSumut() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SUMATERA UTARA");
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

  Future<dynamic> countProvinsiSumbar() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SUMATERA BARAT");
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

  Future<dynamic> countProvinsiJambi() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/JAMBI");
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

  Future<dynamic> countProvinsiPapua() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/PAPUA");
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

  Future<dynamic> countProvinsiAceh() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/ACEH");
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

  Future<dynamic> countProvinsiKalteng() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/KALIMANTAN TENGAH");
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

  Future<dynamic> countProvinsiNtb() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/NUSA TENGGARA BARAT");
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

  Future<dynamic> countProvinsiSulut() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SULAWESI UTARA");
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

  Future<dynamic> countProvinsiGoronta() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/GORONTALO");
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

  Future<dynamic> countProvinsiYogya() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/DI YOGYAKARTA");
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

  Future<dynamic> countProvinsiNtt() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/NUSA TENGGARA TIMUR");
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

  Future<dynamic> countProvinsiSulbar() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SULAWESI BARAT");
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

  Future<dynamic> countProvinsiSulteng() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SULAWESI TENGAH");
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

  Future<dynamic> countProvinsiMaluku() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/MALUKU");
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

  Future<dynamic> countProvinsiPapubar() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/PAPUA BARAT");
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

  Future<dynamic> countProvinsiKalut() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/KALIMANTAN UTARA");
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

  Future<dynamic> countProvinsiBeng() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/BENGKULU");
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

  Future<dynamic> countProvinsiSultenggara() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await dio
            .get("${url_domain}api/count/provinsicalon/SULAWESI TENGGARA");
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

  Future<dynamic> countProvinsiMalut() async {
    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await dio.get("${url_domain}api/count/provinsicalon/MALUKU UTARA");
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

  Future<List<Provinsi>> getProvinsiData() async {
    List<Provinsi> provinsiData = [
      Provinsi('Jawa Timur', await countProvinsiJatim()),
      Provinsi('Bali', await countProvinsiBali()),
      Provinsi('Sulawesi Selatan', await countProvinsiSulawesiSel()),
      Provinsi('Jawa Tengah', await countProvinsiJawaTengah()),
      Provinsi('Lampung', await countProvinsiLampung()),
      Provinsi('Kalimantan Timur', await countProvinsiKaltim()),
      Provinsi('Kepulauan Bangka Belitung', await countProvinsiKepBangka()),
      Provinsi('Kalimantan Selatan', await countProvinsiKalsel()),
      Provinsi('Sumatera Selatan', await countProvinsiSumsel()),
      Provinsi('Jawa Barat', await countProvinsiJabar()),
      Provinsi('Riau', await countProvinsiRiau()),
      Provinsi('Kalimantan Barat', await countProvinsiKalbar()),
      Provinsi('Kepulauan Riau', await countProvinsiKepri()),
      Provinsi('DKI Jakarta', await countProvinsiDkiJak()),
      Provinsi('Banten', await countProvinsiBanten()),
      Provinsi('Sumatera Utara', await countProvinsiSumut()),
      Provinsi('Sumatera Barat', await countProvinsiSumbar()),
      Provinsi('Jambi', await countProvinsiJambi()),
      Provinsi('Papua', await countProvinsiPapua()),
      Provinsi('Aceh', await countProvinsiAceh()),
      Provinsi('Kalimantan Tengah', await countProvinsiKalteng()),
      Provinsi('Nusa Tenggara Barat', await countProvinsiNtb()),
      Provinsi('Sulawesi Utara', await countProvinsiSulut()),
      Provinsi('Gorontalo', await countProvinsiGoronta()),
      Provinsi('DI Yogyakarta', await countProvinsiYogya()),
      Provinsi('Nusa Tenggara Timur', await countProvinsiNtt()),
      Provinsi('Sulawesi Barat', await countProvinsiSulbar()),
      Provinsi('Sulawesi Tengah', await countProvinsiSulteng()),
      Provinsi('Maluku', await countProvinsiMaluku()),
      Provinsi('Papua Barat', await countProvinsiPapubar()),
      Provinsi('Kalimantan Utara', await countProvinsiKalut()),
      Provinsi('Bengkulu', await countProvinsiBeng()),
      Provinsi('Sulawesi Tenggara', await countProvinsiSultenggara()),
      Provinsi('Maluku Utara', await countProvinsiMalut()),
    ];
    return provinsiData;
  }

  Future<List<StatusAkhir>> getStatusData() async {
    List<StatusAkhir> statusData = [
      StatusAkhir('Lulus', await countStatusMduTdu()),
      StatusAkhir('Keluar Mengundurkan Diri', await countStatusKeluar()),
      StatusAkhir('Mengulang Karena Tidak Lulus Tugas Akhir',
          await countStatusMengulang()),
      StatusAkhir('Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)',
          await countStatusTidakAktif()),
      StatusAkhir('MD MABA', await countStatusMdMaba()),
      StatusAkhir('MD TDU setelah Cuti TRM', await countStatusMduTdu()),
    ];
    return statusData;
  }

  Future<List<StatusAkhir>> getChartData() async {
    List<StatusAkhir> chartData = [
      StatusAkhir('Lulus', await countStatusLulus()),
      StatusAkhir('Keluar Mengundurkan Diri', await countStatusKeluar()),
      StatusAkhir('Mengulang Karena Tidak Lulus Tugas Akhir',
          await countStatusMengulang()),
      StatusAkhir('Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)',
          await countStatusTidakAktif()),
      StatusAkhir('MD MABA', await countStatusMdMaba()),
      StatusAkhir('MD TDU setelah Cuti TRM', await countStatusMduTdu()),
    ];
    return chartData;
  }

  Future<List<Gender>> getGenderData() async {
    List<Gender> genderData = [
      Gender('Laki-laki', await countGenderL()),
      Gender('Perempuan', await countGenderP()),
    ];
    return genderData;
  }

  Future<void> _getProvinsiData() async {
    _provinsiData = await getProvinsiData();
    setState(() {});
  }

  Future<void> _getStatusData() async {
    _statusData = await getStatusData();
    setState(() {});
  }

  Future<void> _getGenderData() async {
    _genderData = _genderData ?? await getGenderData();
    setState(() {});
  }

  Future<void> _getChartData() async {
    _chartData = _chartData ?? await getChartData();
    setState(() {});
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
                                    "Laporan hasil akademik",
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
                                        'Calon Mahasiswa',
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
                                                                left: 15,
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
                                                      "Provinsi Asal ",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontFamily: FontPicker
                                                              .mediumPoppins),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: SfCartesianChart(
                                                      tooltipBehavior:
                                                          _tooltipBehavior,
                                                      series: <ChartSeries>[
                                                        BarSeries<Provinsi,
                                                                String>(
                                                            borderRadius: BorderRadius
                                                                .circular(15.0),
                                                            dataSource:
                                                                _provinsiData,
                                                            xValueMapper:
                                                                (Provinsi
                                                                            genre,
                                                                        _) =>
                                                                    genre
                                                                        .provinsi,
                                                            yValueMapper:
                                                                (Provinsi genre,
                                                                        _) =>
                                                                    genre
                                                                        .jumlah,
                                                            dataLabelSettings:
                                                                DataLabelSettings(
                                                                    isVisible:
                                                                        true),
                                                            enableTooltip:
                                                                true),
                                                      ],
                                                      primaryXAxis: CategoryAxis(
                                                          title: AxisTitle(
                                                              text:
                                                                  'Provinsi')),
                                                      primaryYAxis: NumericAxis(
                                                          title: AxisTitle(
                                                              text: 'jumlah'),
                                                          edgeLabelPlacement:
                                                              EdgeLabelPlacement
                                                                  .shift),
                                                    ),
                                                  ),
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
                                        'Status Mahasiswa',
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
                                                      width: 400, height: 300),
                                              child: SfCartesianChart(
                                                tooltipBehavior:
                                                    _tooltipBehavior,
                                                series: <ChartSeries>[
                                                  BarSeries<StatusAkhir,
                                                          String>(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      dataSource: _statusData,
                                                      xValueMapper:
                                                          (StatusAkhir data,
                                                                  _) =>
                                                              data.statusAkhir,
                                                      yValueMapper:
                                                          (StatusAkhir data,
                                                                  _) =>
                                                              data.jumlah,
                                                      dataLabelSettings:
                                                          DataLabelSettings(
                                                              isVisible: true),
                                                      enableTooltip: true),
                                                ],
                                                primaryXAxis: CategoryAxis(
                                                    title: AxisTitle(
                                                        text: 'Provinsi')),
                                                primaryYAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text: 'jumlah'),
                                                    edgeLabelPlacement:
                                                        EdgeLabelPlacement
                                                            .shift),
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
                                SizedBox(
                                  height: 10,
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
