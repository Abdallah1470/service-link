import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_link/view/widgets/no_orders_widget.dart';

import '../../widgets/orders_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: OrdersAppBar(),
        body: TabBarView(
          children: [
            _buildOrdersTab(),
            _buildOrdersTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersTab() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('orders').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return NoOrdersWidget();
        }
        final orders = snapshot.data!.docs;
return ListView.builder(
  itemCount: orders.length,
  itemBuilder: (context, index) {
    final order = orders[index];
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order['doctorName'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Date: ${order['date'].toDate()}'),
            const SizedBox(height: 4),
            Text('Time: ${order['time']}'),
            const SizedBox(height: 4),
            Text('Location: ${order['location']}'),
            const SizedBox(height: 4),
            Text('Price: \$${order['price']}'),
          ],
        ),
      ),
    );
  },
);
      },
    );
  }
}
