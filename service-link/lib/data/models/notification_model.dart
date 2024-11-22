import 'package:cloud_firestore/cloud_firestore.dart';

enum NotificationState {
  Announcements,
  ConfirmedOrder,
  OrderAssigned,
  OrderCompleted,
  OrderCancelled,
  OrderAccepted, OrderReceived,
}

class NotificationModel {
  final String title;
  final String description;
  final Timestamp timestamp;
  final NotificationState state;

  NotificationModel({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.state,
  });

 factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return NotificationModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      state: NotificationState.values.firstWhere(
        (e) => e.toString() == 'NotificationState.${data['state']}',
        orElse: () => NotificationState.Announcements,
      ),
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      state: _notificationStateFromString(json['state']),
      timestamp: json['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
