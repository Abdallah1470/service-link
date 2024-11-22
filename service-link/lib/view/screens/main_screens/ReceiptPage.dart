import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptPage extends StatelessWidget {
  final String doctorName;
  final DateTime date;
  final TimeOfDay time;
  final String location;
  final double price;

  ReceiptPage({
    required this.doctorName,
    required this.date,
    required this.time,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    // Define DateFormat for date and time
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String formattedDate = dateFormat.format(date);

    final String formattedTime = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Receipt', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF00AEEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service Provider : $doctorName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Date: $formattedDate',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              'Time: $formattedTime',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              'Total Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00AEEF), // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
