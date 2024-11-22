import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order_model.dart' as order_model;
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepositoryImpl(this._firestore);

  @override
  Future<void> addOrder(String userId, order_model.OrderModel order) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .add(order.toJson());
  }

  @override
  Future<List<order_model.OrderModel>> getOrders(String userId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => order_model.OrderModel.fromJson(
            doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> updateOrder(String userId, order_model.OrderModel order) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .doc(order.id)
        .update(order.toJson());
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
