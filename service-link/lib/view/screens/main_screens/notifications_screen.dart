import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_link/view/widgets/no_notifications_widget.dart';

import '../../../data/models/notification_model.dart';
import '../../../viewmodels/notification_viewmodel.dart';
import '../../widgets/notification_item.dart';

class NotificationsScreen extends ConsumerWidget {
  final String userId;

  const NotificationsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationViewModelProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: notificationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : notificationState.errorMessage != null
              ? Center(child: Text(notificationState.errorMessage!))
              : notificationState.notifications.isEmpty
                  ? const NoNotificationsWidget()
                  : ListView.separated(
                      itemCount: notificationState.notifications.length,
                      itemBuilder: (context, index) {
                        NotificationModel notification =
                            notificationState.notifications[index];
                        return NotificationItem (
                          title: notification.title,
                          description: notification.description,
                          timestamp: notification.timestamp,
                          state: notification.state,
                        );
                      }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 5); },
                    ),
    );
  }
}
