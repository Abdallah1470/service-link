import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/notification_model.dart';
import '../data/repositories/notification_repository.dart';
import '../data/repositories/providers.dart';

class NotificationStateModel {
  final List<NotificationModel> notifications;
  final bool isLoading;
  final String? errorMessage;

  NotificationStateModel({
    this.notifications = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  NotificationStateModel copyWith({
    List<NotificationModel>? notifications,
    bool? isLoading,
    String? errorMessage,
  }) {
    return NotificationStateModel(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class NotificationViewModel extends StateNotifier<NotificationStateModel> {
  final NotificationRepository _notificationRepository;
  final String userId;

  NotificationViewModel(this._notificationRepository, this.userId) : super(NotificationStateModel());

  Future<void> fetchNotifications() async {
    state = state.copyWith(isLoading: true);
    try {
      List<NotificationModel> notifications = await _notificationRepository.getNotifications(userId);
      state = state.copyWith(notifications: notifications, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> addNotification(NotificationModel notification) async {
    state = state.copyWith(isLoading: true);
    try {
      await _notificationRepository.addNotification(userId, notification);
      await fetchNotifications();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> updateNotification(NotificationModel notification) async {
    state = state.copyWith(isLoading: true);
    try {
      await _notificationRepository.updateNotification(userId, notification);
      await fetchNotifications();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    state = state.copyWith(isLoading: true);
    try {
      await _notificationRepository.deleteNotification(userId, notificationId);
      await fetchNotifications();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final notificationViewModelProvider = StateNotifierProvider.family<NotificationViewModel, NotificationStateModel, String>(
      (ref, userId) => NotificationViewModel(ref.watch(notificationRepositoryProvider), userId),
);
