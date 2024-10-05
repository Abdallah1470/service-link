import 'package:cloud_firestore/cloud_firestore.dart';

enum OrderStatus {
  Pending,
  Confirmed,
  Assigned,
  Accepted,
  Cancelled,
  Completed,
  // Add more states as needed
}

class Order {
  final String id;
  final String title;
  final String description;
  final OrderStatus state;
  final Timestamp timestamp;
  // Add other relevant fields

  Order({
    required this.id,
    required this.title,
    required this.description,
    required this.state,
    required this.timestamp,
  });

  factory Order.fromFirestore(Map<String, dynamic> data, String id) {
    return Order(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      state: _orderStateFromString(data['state']),
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'state': _orderStateToString(state),
      'timestamp': timestamp,
      // Add other fields as needed
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
