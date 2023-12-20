import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];

  String url_domain = "http://192.168.77.171:8000/";
  int page = 1; // Current page number
  int pageSize = 10; // Number of items to fetch per page
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    showAllData();
  }

  Future<dynamic> showAllData() async {
    if (isLoading) return; // Prevent concurrent loading
    try {
      setState(() {
        isLoading = true;
      });
      var response = await dio
          .get("${url_domain}api/all_data?page=$page&pageSize=$pageSize");
      var result = response.data;

      if (result is List) {
        data.addAll(List<Map<String, dynamic>>.from(result));
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<void> loadMoreData() async {
    if (isLoading || !hasMoreData) return;
    page++;
    await showAllData();
  }

  bool get hasMoreData {
    // Replace this with your own logic to determine if there's more data
    // to load. For example, you can compare the length of the data list with
    // the total number of items available from the API.
    return data.length <
        totalItems; // totalItems is the total number of items available.
  }

  int get totalItems {
    // Replace this with the total number of items available from the API.
    // You may need to fetch this information separately or have it provided.
    return 100; // Example: 100 total items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cripst Dashboard',
          textAlign: TextAlign.end,
        ),
        backgroundColor: const Color.fromARGB(255, 21, 57, 135),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                  child: SizedBox(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          // Reached the end of the list, load more data.
                          loadMoreData();
                        }
                        return true;
                      },
                      child: Column(
                        children: [
                          for (int index = 0; index < data.length; index++)
                            buildDataRow(data[index]),
                          if (hasMoreData) const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (hasMoreData)
                  Text(
                    'Page: $page',
                    style: const TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDataRow(Map<String, dynamic> rowData) {
    return Card(
      child: Column(
        children: [
          Text('Genre: ${rowData['genre']}'),
          Text('Reports: ${rowData['reports']}'),
          Text('Gpa: ${rowData['gpa']}'),
        ],
      ),
    );
  }
}
