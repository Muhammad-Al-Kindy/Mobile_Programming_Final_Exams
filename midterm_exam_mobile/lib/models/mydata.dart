import 'package:flutter/material.dart';

class MyData extends DataTableSource {
  List<Map<String, dynamic>> data;
  int currentPage = 0;
  int itemsPerPage = 10;

  MyData(this.data);

  @override
  DataRow? getRow(int index) {
    final int dataIndex = index + (currentPage * itemsPerPage);
    if (dataIndex < data.length) {
      final row = data[dataIndex];
      return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(
            Text(row["genre"].toString()),
          ),
          DataCell(
            Text(row["reports"].toString()),
          ),
          DataCell(
            Text(row["gpa"].toString()),
          ),
        ],
      );
    }
    return null;
  }

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  List<Map<String, dynamic>> getCurrentPageItems() {
    final int startIndex = currentPage * itemsPerPage;
    final int endIndex = startIndex + itemsPerPage;
    if (startIndex >= data.length) {
      return [];
    } else {
      return data.sublist(startIndex, endIndex.clamp(0, data.length));
    }
  }
}
