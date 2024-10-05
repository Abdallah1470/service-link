import '../models/notification_model.dart';

abstract class NotificationRepository {
  Future<void> addNotification(String userId, NotificationModel notification);
  Future<List<NotificationModel>> getNotifications(String userId);
  Future<void> updateNotification(String userId, NotificationModel notification);
  Future<void> deleteNotification(String userId, String notificationId);
}