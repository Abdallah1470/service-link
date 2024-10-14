import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/notification_model.dart';

final notificationViewModelProvider = StateNotifierProvider.family<NotificationViewModel, NotificationState, String>((ref, userId) {
  return NotificationViewModel(userId);
});

class NotificationState {
  final bool isLoading;
  final String? errorMessage;
  final List<NotificationModel> notifications;

  NotificationState({
    this.isLoading = false,
    this.errorMessage,
    this.notifications = const [],
  });
}

class NotificationViewModel extends StateNotifier<NotificationState> {
  final String userId;

  NotificationViewModel(this.userId) : super(NotificationState()) {
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    try {
      state = NotificationState(isLoading: true);
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .get();

      List<NotificationModel> notifications = snapshot.docs
          .map((doc) => NotificationModel.fromFirestore(doc))
          .toList();

      state = NotificationState(notifications: notifications);
    } catch (e) {
      state = NotificationState(errorMessage: e.toString());
    }
  }
}