import 'package:cloud_firestore/cloud_firestore.dart';

enum NotificationState {
  Announcements,
  ConfirmedOrder,
  OrderAssigned,
  OrderCompleted,
  OrderCancelled,
  OrderAccepted,
}

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final NotificationState state;
  final Timestamp timestamp;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.state,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      state: _notificationStateFromString(json['state']),
      timestamp: json['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'state': _notificationStateToString(state),
      'timestamp': timestamp,
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
