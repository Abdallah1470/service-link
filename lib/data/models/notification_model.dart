// lib/data/models/notification_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

enum NotificationState {
  Announcements,
  ConfirmedOrder,
  OrderAssigned,
  OrderCompleted,
  OrderCancelled,
  OrderAccepted,
  // Add more states as needed
}

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final NotificationState state;
  final Timestamp timestamp;
  // Add other relevant fields

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.state,
    required this.timestamp,
  });

  factory NotificationModel.fromFirestore(Map<String, dynamic> data, String id) {
    return NotificationModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      state: _notificationStateFromString(data['state']),
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'state': _notificationStateToString(state),
      'timestamp': timestamp,
      // Add other fields as needed
    };
  }

  static NotificationState _notificationStateFromString(String? stateStr) {
    switch (stateStr) {
      case 'Announcements':
        return NotificationState.Announcements;
      case 'ConfirmedOrder':
        return NotificationState.ConfirmedOrder;
      case 'OrderAssigned':
        return NotificationState.OrderAssigned;
      case 'OrderCompleted':
        return NotificationState.OrderCompleted;
      case 'OrderCancelled':
        return NotificationState.OrderCancelled;
      default:
        return NotificationState.Announcements;
    }
  }

  static String _notificationStateToString(NotificationState state) {
    return state.toString().split('.').last;
  }
}
