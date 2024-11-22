// notification_provider.dart
import 'package:flutter/material.dart';
import 'notification_model.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  void addNotification(String message) {
    _notifications.add(NotificationModel(
      message: message,
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }
}
