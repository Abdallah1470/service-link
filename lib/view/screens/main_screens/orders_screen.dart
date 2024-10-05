import 'package:flutter/material.dart';
import 'package:service_link/view/widgets/no_orders_widget.dart';

import '../../widgets/orders_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: OrdersAppBar(),
        body: const TabBarView(
            children: [
              NoOrdersWidget(),
              NoOrdersWidget(),
            ]
        ),
      ),
    );
  }
}
