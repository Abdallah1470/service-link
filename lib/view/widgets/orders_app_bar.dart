import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Pending',
  'History',
];

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // This is required for implementing PreferredSizeWidget.

  OrdersAppBar({super.key}) : preferredSize = const Size.fromHeight(100.0); // Adjust height based on app bar + tabs

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Orders'),
      centerTitle: true,
      backgroundColor: Colors.white,
      bottom: TabBar(
        tabs: [
          Tab(
            text: titles[0],
          ),
          Tab(
            text: titles[1],
          ),
        ],
      ),
    );
  }
}
