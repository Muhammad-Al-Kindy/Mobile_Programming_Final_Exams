import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];
  List<String> items = [];
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

  void _loadData() {
    // Check if we've reached the desired number of pages.
    if (currentPage > totalPages) {
      return;
    }

    // Simulate loading data from your data source (e.g., an API).
    // Append new items to the 'items' list.
    setState(() {
      isLoading = true;
    });

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

  Future<dynamic> show_all_data() async {
    try {
      var response = await dio.post("${url_domain}api/all_data");
      var result = response.data;
      //return result;
      if (result is List) {
        data = List<Map<String, dynamic>>.from(result);
        setState(() {});
      }
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //   itemCount: items.length + 1,
      //   itemBuilder: (context, index) {
      //     if (index < items.length) {
      //       return ListTile(
      //         title: Text(items[index]),
      //       );
      //     } else if (isLoading) {
      //       return Center(child: CircularProgressIndicator());
      //     } else {
      //       return Center(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             _loadData();
      //           },
      //           child: Text('Load More'),
      //         ),
      //       );
      //     }
      //   },
      //   controller: _scrollController,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(-100.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(800),
                        bottomRight: Radius.circular(800),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        color: Colors.red[800],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              onPressed: () {},
                            )),
                      )),
                ],
              ),
            ),
            //=============== BODY ====================
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "Detail Responden ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ListView.builder(
                          itemCount: data.length + 1,
                          itemBuilder: (context, index) {
                            if (index < data.length) {
                              return DataTable(
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
                                rows: data.map(
                                  (rowData) {
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
                                  },
                                ).toList(),
                              );
                            }
                          },
                        ),
                        // DataTable(
                        //   columnSpacing: 16,
                        //   dataRowMaxHeight: 150,
                        //   columns: const <DataColumn>[
                        //     DataColumn(
                        //       label: Text(
                        //         'Genre',
                        //         style: TextStyle(fontStyle: FontStyle.italic),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         'Reports',
                        //         style: TextStyle(fontStyle: FontStyle.italic),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         'Gpa',
                        //         style: TextStyle(fontStyle: FontStyle.italic),
                        //       ),
                        //     ),
                        //   ],
                        //   rows: data.map(
                        //     (rowData) {
                        //       return DataRow(
                        //         cells: <DataCell>[
                        //           DataCell(
                        //             Container(
                        //               width: 80, // Atur lebar sel
                        //               height: 200, // Atur tinggi sel
                        //               alignment: Alignment
                        //                   .centerLeft, // Atur alignment teks dalam sel
                        //               child: Text(rowData['genre'].toString()),
                        //             ), // Atur margin vertikal
                        //           ),
                        //           DataCell(
                        //             Container(
                        //               width: 180, // Atur lebar sel
                        //               height: 150, // Atur tinggi sel
                        //               alignment: Alignment
                        //                   .centerLeft, // Atur alignment teks dalam sel
                        //               child:
                        //                   Text(rowData['reports'].toString()),
                        //             ),
                        //           ),
                        //           DataCell(
                        //             Container(
                        //                 width: 100, // Atur lebar sel
                        //                 height: 40, // Atur tinggi sel
                        //                 alignment: Alignment
                        //                     .centerLeft, // Atur alignment teks dalam sel
                        //                 child: Text(rowData['gpa'].toString())),
                        //           )
                        //         ],
                        //       );
                        //     },
                        //   ).toList(),
                        // ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[800],
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Kembali",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
