import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoOrdersWidget extends StatelessWidget {
  const NoOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_orders.svg',
              height: 250,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'No Orders Yet',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'You have no active order right now.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
