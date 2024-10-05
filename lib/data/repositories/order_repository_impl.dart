import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order_model.dart' as order_model;
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepositoryImpl(this._firestore);

  @override
  Future<void> addOrder(String userId, order_model.Order order) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .add(order.toMap());
  }

  @override
  Future<List<order_model.Order>> getOrders(String userId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => order_model.Order.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  @override
  Future<void> updateOrder(String userId, order_model.Order order) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .doc(order.id)
        .update(order.toMap());
  }

  @override
  Future<void> deleteOrder(String userId, String orderId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .doc(orderId)
        .delete();
  }
}
