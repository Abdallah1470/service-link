import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:service_link/view/screens/main_screens/ReceiptPage.dart';

import '../../../data/models/notification_model.dart';
import '../../../main.dart';

class OrderingPage extends StatefulWidget {
  final String doctorName;

  OrderingPage({required this.doctorName});

  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedLocation = '';
  String promotionCode = ''; // Store the entered promotion code
  double price = 150.0; // Example price; you might want to set this dynamically
  double discountedPrice = 150.0; // Variable to store the final price after discount

  // Method to apply promotion code
  void applyPromotionCode() {
    if (promotionCode == "EID2024") {
      // Apply 2% discount
      setState(() {
        discountedPrice = price - (price * 0.02); // Apply 2% discount
      });
    } else {
      // If the promotion code is invalid, reset the discounted price
      setState(() {
        discountedPrice = price; // Reset to original price
      });
      // Optionally show a message for invalid promotion code
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid promotion code!")),
      );
    }
  }

  // Method to save the order to Firestore
  Future<void> saveOrder() async {
    final orderData = {
      'doctorName': widget.doctorName,
      'date': selectedDate,
      'time': '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
      'location': selectedLocation,
      'price': discountedPrice,
    };

    await FirebaseFirestore.instance.collection('orders').add(orderData);
  }

  // Method to save the notification to Firestore
  Future<void> saveNotification(String title, String description, Timestamp timestamp, NotificationState state) async {
    final notificationData = {
      'title': title,
      'description': description,
      'timestamp': timestamp,
      'state': state.toString(),
    };

    await FirebaseFirestore.instance.collection('notifications').add(notificationData);
  }

  // Method to show a notification
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'order_channel_id', // Channel ID
      'Order Notifications', // Channel name
      channelDescription: 'Notifications for order status updates', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      ticker: 'ticker',
      playSound: true,
      enableVibration: true,
      enableLights: true,
      color: Color(0xFF00AEEF),
      ledColor: Color(0xFF00AEEF),
      ledOnMs: 1000,
      ledOffMs: 500,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Order Received',
      'Your order has been successfully received.',
      platformChannelSpecifics,
      payload: 'order_received',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${widget.doctorName}', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF00AEEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue[300],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Choose Time:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                );
                if (pickedTime != null && pickedTime != selectedTime) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
              child: Text('${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue[300],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Choose Location:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  selectedLocation = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your location',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Promotion Code:  "Optional"',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  promotionCode = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter promotion code',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            ElevatedButton(
              onPressed: applyPromotionCode,
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // Change to your preferred color
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Price: \$${price.toString()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Text(
              'Discounted Price: \$${discountedPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Save the order to Firestore
                  await saveOrder();

                  // Save the notification to Firestore
                  await saveNotification(
                    'Order Received',
                    'Your order has been successfully received.',
                    Timestamp.now(),
                    NotificationState.OrderReceived,
                  );

                  // Show notification
                  await showNotification();

                  // Navigate to the receipt page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceiptPage(
                        doctorName: widget.doctorName,
                        date: selectedDate,
                        time: selectedTime,
                        location: selectedLocation,
                        price: discountedPrice, // Use the discounted price
                      ),
                    ),
                  );
                },
                child: Text('Done'),
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