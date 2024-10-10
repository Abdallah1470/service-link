import 'package:cloud_firestore/cloud_firestore.dart';

enum OrderStatus {
  Pending,
  Confirmed,
  Assigned,
  Accepted,
  Cancelled,
  Completed,
}

class OrderModel {
  final String id;
  final String title;
  final String description;
  final OrderStatus state;
  final Timestamp timestamp;

  OrderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.state,
    required this.timestamp,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      state: _orderStateFromString(json['state']),
      timestamp: json['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'state': _orderStateToString(state),
      'timestamp': timestamp,
    };
  }

  static OrderStatus _orderStateFromString(String? stateStr) {
    switch (stateStr) {
      case 'Pending':
        return OrderStatus.Pending;
      case 'Confirmed':
        return OrderStatus.Confirmed;
      case 'Assigned':
        return OrderStatus.Assigned;
      case 'Accepted':
        return OrderStatus.Accepted;
      case 'Cancelled':
        return OrderStatus.Cancelled;
      case 'Completed':
        return OrderStatus.Completed;
      default:
        return OrderStatus.Pending;
    }
  }

  static String _orderStateToString(OrderStatus state) {
    return state.toString().split('.').last;
  }
}
