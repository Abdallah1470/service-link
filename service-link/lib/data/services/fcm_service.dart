import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:service_link/app/routes/app_routes.dart';

class FCMService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Store user ID as a field to access it later
  String userId;

  FCMService(this.userId);

  Future<void> initialize(BuildContext context) async {
    // Request notification permissions for iOS
    if (Platform.isIOS) {
      await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    // Initialize local notifications for Android and iOS
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {
          // Handle iOS local notification when app is in foreground
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(title ?? "Notification"),
              content: Text(body ?? ""),
              actions: [
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            ),
          );
        });

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);

    // Initialize local notifications with handling tap
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse response) async {
          if (response.payload != null) {
            print("Notification tapped with payload: ${response.payload}");
            // Add navigation or handling logic here
          }
        });

    // Listen for messages when app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showLocalNotification(message);
    });

    // Handle notification taps when app is in background or terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle navigation or other logic when notification is opened
      Navigator.pushNamed(
        context,
        AppRoutes.notifications,
      );
    });

    // Get the token for this device and print it
    String? token = await _messaging.getToken();
    print("FCM Token: $token");

    // Save the FCM token to Firestore or any backend
    await saveTokenToBackend(token, userId);

    // Listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      // Update the token in Firestore
      saveTokenToBackend(newToken, userId);
    }).onError((err) {
      // Handle error
      print("Error listening to token refresh: $err");
    });
  }

  // Method to display local notifications when a foreground message is received
  Future<void> _showLocalNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    try {
      await _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: message.data['payload'], // Send payload with notification
      );
    } catch (e) {
      print("Error showing local notification: $e");
    }
  } else {
    print("Received message does not contain a valid notification or Android object.");
  }
}


  // Method to save FCM token to Firestore or your backend
  Future<void> saveTokenToBackend(String? token, String userId) async {
    if (token != null) {
      try {
        // Reference to the Firestore instance
        final firestore = FirebaseFirestore.instance;

        // Update the user's document with the FCM token
        await firestore.collection('users').doc(userId).update({
          'fcmToken': token,
        });
        print("FCM Token saved to backend: $token");
      } catch (e) {
        // Handle any errors that occur during the update
        print("Failed to save FCM token: $e");
      }
    }
  }
}
