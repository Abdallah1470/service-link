import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _searchController = TextEditingController();

  void _onSearch() {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      print('Searching for: $query');
      // Add your search logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'I want to hire a...',
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                _onSearch();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey,
            onPressed: _onSearch,
          ),
        ],
      ),
    );
  }
}
