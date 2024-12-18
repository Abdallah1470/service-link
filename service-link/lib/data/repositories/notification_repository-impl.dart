import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/notification_model.dart';
import 'notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final FirebaseFirestore _firestore;

  NotificationRepositoryImpl(this._firestore);

  @override
  Future<void> addNotification(
      String userId, NotificationModel notification) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add(notification.toJson());
  }

  @override
  Future<List<NotificationModel>> getNotifications(String userId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) =>
            NotificationModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> updateNotification(
      String userId, NotificationModel notification) async {
 /*   await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .doc(notification.id)
        .update(notification.toJson());*/
  }

  @override
  Future<void> deleteNotification(String userId, String notificationId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .doc(notificationId)
        .delete();
  }
}
