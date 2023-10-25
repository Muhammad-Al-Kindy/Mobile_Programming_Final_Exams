// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class PaginatedList extends StatefulWidget {
  @override
  _PaginatedListState createState() => _PaginatedListState();
}

class _PaginatedListState extends State<PaginatedList> {
  List<String> items = [];
  bool isLoading = false;
  int currentPage = 1;
  int totalPages = 10; // Set the total number of pages you want to paginate to.
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginated List'),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(
              title: Text(items[index]),
            );
          } else if (isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  _loadData();
                },
                child: Text('Load More'),
              ),
            );
          }
        },
        controller: _scrollController,
      ),
    );
  }
}
